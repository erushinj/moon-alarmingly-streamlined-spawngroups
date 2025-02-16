-- https://github.com/segabl/pd2-hoplib/blob/master/req/TableUtils.lua
-- https://github.com/segabl/pd2-hoplib/blob/master/req/MenuBuilder.lua
-- slightly tweaked. use hoplib's menu builder if you need one. i would but i dont want to add a dependency post-release.

local function table_replace(tbl1, tbl2, match_type)
	for k, v in pairs(tbl2) do
		if type(tbl1[k]) == type(v) or not match_type and tbl1[k] ~= nil then
			if type(v) == "table" then
				tbl1[k] = type(tbl1[k]) == "table" and tbl1[k] or {}
				table_replace(tbl1[k], v, match_type)
			else
				tbl1[k] = v
			end
		end
	end
	return tbl1
end

local function table_union(tbl1, tbl2, match_type)
	for k, v in pairs(tbl2) do
		if not match_type or tbl1[k] == nil or type(tbl1[k]) == type(v) then
			if type(v) == "table" then
				tbl1[k] = type(tbl1[k]) == "table" and tbl1[k] or {}
				table_union(tbl1[k], v, match_type)
			else
				tbl1[k] = v
			end
		end
	end
	return tbl1
end

local MenuBuilder = {}

---Creates a MenuBuilder instance
---@param identifier string @unique identifier of the mod the menu is built for
---@param settings_table table @settings table to build the menu for
---@param settings_params? table @optional parameters to be used for creating the menu
function MenuBuilder:init(identifier, settings_table, settings_params)
	self._id = identifier
	self._table = settings_table
	self._params = settings_params or {}
	self:load_settings()
end

---Saves the current settings (done automatically on settings change via menu)
function MenuBuilder:save_settings()
	io.save_as_json(self._table, SavePath .. self._id .. ".json")
end

---Loads the current settings (done automatically on MenuBuilder creation)
function MenuBuilder:load_settings()
	local path = SavePath .. self._id .. ".json"
	local data = io.file_is_readable(path) and io.load_as_json(path)
	if not data then
		path = SavePath .. self._id .. ".txt"
		data = io.file_is_readable(path) and io.load_as_json(path)
	end

	if data then
		table_replace(self._table, data, true)
	end
end

---Creates a new menu and places it in the specified parent menu
---@param menu_nodes table @menu nodes as provided by the `MenuManagerBuildCustomMenus` hook
---@param parent_menu? string @defaults to blt_options
function MenuBuilder:create_menu(menu_nodes, parent_menu)
	if self._created then
		return
	end

	parent_menu = parent_menu or "blt_options"
	if not menu_nodes[parent_menu] then
		log("[MenuBuilder] ERROR: Parent menu node \"" .. parent_menu .. "\" does not exist (" .. self._id .. ")!")
		return
	end

	local loc_strings = {}
	local loc = managers.localization
	if not loc then
		log("[MenuBuilder] WARNING: Localization manager is not available yet (" .. self._id .. ")!")
	end

	local function set_value(item_name, item_value)
		local hierarchy = item_name:split("/")
		local tbl = self._table
		for i = 1, #hierarchy - 1 do
			tbl = tbl[hierarchy[i]]
		end
		local setting_name = hierarchy[#hierarchy]
		local callback = self._params[setting_name] and self._params[setting_name].callback
		tbl[setting_name] = item_value
		if callback then
			callback(item_value)
		end
	end

	MenuCallbackHandler[self._id .. "_toggle"] = function (_, item)
		set_value(item:name(), item:value() == "on")
	end

	MenuCallbackHandler[self._id .. "_value"] = function (_, item)
		set_value(item:name(), item:value())
	end

	MenuCallbackHandler[self._id .. "_save"] = function ()
		self:save_settings()

		local level_mod = ASS.values.level_mod[self._table.level_mod]
		if tostring(level_mod):match("ZEAL") then
			ASS:message("zeals_enabled")
		end
	end

	local function loop_tables(tbl, menu_id, hierarchy, inherited_params)
		local element_priority = 0

		hierarchy = hierarchy and hierarchy .. "/" or ""
		inherited_params = inherited_params or {}

		MenuHelper:NewMenu(menu_id)

		for k, v in pairs(tbl) do
			local t = type(v)
			local name_id = self._id .. "_menu_" .. k
			local desc_id = name_id .. "_desc"
			local desc = loc and loc:exists(desc_id) and desc_id
			local params = self._params[k] and table_union(clone(inherited_params), self._params[k]) or inherited_params

			if loc and not loc:exists(name_id) then
				loc_strings[name_id] = k:pretty()
			end

			element_priority = element_priority - 1

			if params.hidden then
				-- Don't create menu entries for hidden settings
			elseif t == "boolean" then
				MenuHelper:AddToggle({
					id = hierarchy .. k,
					title = name_id,
					desc = desc,
					callback = self._id .. "_toggle",
					disabled = params.disabled,
					value = v,
					menu_id = menu_id,
					priority = self._params[k] and self._params[k].priority or element_priority
				})
			elseif t == "number" then
				if params.items then
					MenuHelper:AddMultipleChoice({
						id = hierarchy .. k,
						title = name_id,
						desc = desc,
						callback = self._id .. "_value",
						disabled = params.disabled,
						value = v,
						items = params.items,
						menu_id = menu_id,
						priority = self._params[k] and self._params[k].priority or element_priority
					})
				else
					MenuHelper:AddSlider({
						id = hierarchy .. k,
						title = name_id,
						desc = desc,
						callback = self._id .. "_value",
						disabled = params.disabled,
						value = v,
						min = params.min or math.min(v, 0),
						max = params.max or math.max(v, 1),
						step = params.step or 0.1,
						show_value = Utils:FirstNonNil(params.show_value, true),
						display_precision = params.display_precision,
						display_scale = params.display_scale,
						is_percentage = params.is_percentage,
						menu_id = menu_id,
						priority = self._params[k] and self._params[k].priority or element_priority
					})
				end
			elseif t == "string" then
				MenuHelper:AddInput({
					id = hierarchy .. k,
					title = name_id,
					desc = desc,
					callback = self._id .. "_value",
					disabled = params.disabled,
					value = v,
					menu_id = menu_id,
					priority = self._params[k] and self._params[k].priority or element_priority
				})
			elseif t == "function" then
				local callback_name = self._id .. "_button_" .. k
				MenuCallbackHandler[callback_name] = function (...) v(...) end
				MenuHelper:AddButton({
					id = hierarchy .. k,
					title = name_id,
					desc = desc,
					callback = callback_name,
					disabled = params.disabled,
					menu_id = menu_id,
					priority = self._params[k] and self._params[k].priority or element_priority
				})
			elseif t == "table" then
				local node_id = menu_id .. "_" .. k
				MenuHelper:AddButton({
					id = hierarchy .. k,
					title = name_id,
					desc = desc,
					disabled = params.disabled,
					next_node = node_id,
					menu_id = menu_id,
					priority = self._params[k] and self._params[k].priority or element_priority
				})
				loop_tables(v, node_id, hierarchy .. k, params)
			end

			local divider = self._params[k] and self._params[k].divider
			if divider then
				MenuHelper:AddDivider({
					menu_id = menu_id,
					size = math.abs(divider),
					priority = (self._params[k] and self._params[k].priority or element_priority) + (divider < 0 and 0.1 or -0.1)
				})
			end
		end

		menu_nodes[menu_id] = MenuHelper:BuildMenu(menu_id, { back_callback = self._id .. "_save" })
	end

	loop_tables(self._table, self._id)

	local name_id = self._id .. "_menu"
	local desc_id = name_id .. "_desc"
	if loc then
		if not loc:exists(name_id) then
			loc_strings[name_id] = self._id:pretty(true)
		end
		loc:add_localized_strings(loc_strings)
	end

	MenuHelper:AddMenuItem(menu_nodes[parent_menu], self._id, name_id, loc and loc:exists(desc_id) and desc_id)

	self._created = true
end

---Creates a hook that will automatically build the menu when the game builds its own menus
---@param parent_menu? string @defaults to blt_options
function MenuBuilder:create_menu_build_hook(parent_menu)
	Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenus" .. self._id, function(_, nodes)
		self:create_menu(nodes, parent_menu)
	end)
end


return MenuBuilder, MenuBuilder:init(...)
