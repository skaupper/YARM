require "resmon"
require "remote"


-- if this ever happens, I'll be enormously surprised
if not resmon then error("{{MOD_NAME}} has become badly corrupted: the variable resmon should've been set!") end

function msg_all(message)
    for _,p in pairs(game.players) do
        p.print(message)
    end
end

script.on_init(function()
    local _, err = pcall(resmon.init_globals)
    if err then msg_all({"YARM-err-generic", err}) end
end)

script.on_configuration_changed(function()
    local _, err = pcall(resmon.init_globals)
    if err then msg_all({"YARM-err-generic", err}) end
end)

script.on_event(defines.events.on_player_created, function(event)
    local _, err = pcall(resmon.on_player_created, event)
    if err then msg_all({"YARM-err-specific", "on_player_created", err}) end
end)

script.on_event(defines.events.on_tick, function(event)
    local _, err = pcall(resmon.on_tick, event)
    if err then msg_all({"YARM-err-specific", "on_tick", err}) end
end)

script.on_event(defines.events.on_gui_click, function(event)
    local _, err = pcall(resmon.on_gui_click, event)
    if err then msg_all({"YARM-err-specific", "on_gui_click", err}) end
end)

script.on_event(defines.events.on_gui_closed, function(event)
    local _, err = pcall(resmon.on_gui_closed, event)
    if err then msg_all({"YARM-err-specific", "on_gui_closed", err}) end
end)

script.on_event("get-yarm-selector", function(event)
    local _, err = pcall(resmon.on_get_selection_tool, event)
    if err then msg_all({"YARM-err-specific", "on_get_selection_tool", err}) end
end)

script.on_event(defines.events.on_player_selected_area, function(event)
    local _, err = pcall(resmon.on_player_selected_area, event)
    if err then msg_all{"YARM-err-specific", "on_player_selected_area", err} end
end)

on_site_updated = script.generate_event_name()
