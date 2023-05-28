--[[
    Set to true if we want additional logging/listeners for debugging
--]]
local debug_mode = true;

--[[
    Custom logging for easier debugging.
--]]
local function out_h(str)
    out("[hanter_xou_emp_provincial_starting_units] "..str);
end

--[[
    A table that will be used to map infantry units to their Provincial counterparts for each Empire faction.
--]]
local units_map = {
    ["wh_main_emp_averland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "avr_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "avr_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "avr_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "avr_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "avr_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "avr_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "avr_inf_swordsmen";
    },
    ["wh2_dlc13_emp_golden_order"] = {
        ["wh_main_emp_inf_crossbowmen"] = "gol_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "gol_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "gol_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "gol_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "gol_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "gol_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "gol_inf_swordsmen";
    },
    ["wh_main_emp_hochland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "hoc_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "hoc_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "hoc_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "hoc_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "hoc_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "hoc_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "hoc_inf_swordsmen";
    },
    ["wh_main_emp_middenland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "mid_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "mid_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "mid_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "mid_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "mid_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "mid_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "mid_inf_swordsmen";
    },
    ["wh_main_emp_marienburg"] = {
        ["wh_main_emp_inf_crossbowmen"] = "mrb_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "mrb_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "mrb_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "mrb_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "mrb_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "mrb_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "mrb_inf_swordsmen";
    },
    ["wh_main_emp_nordland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "nod_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "nod_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "nod_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "nod_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "nod_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "nod_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "nod_inf_swordsmen";
    },
    ["wh_main_emp_ostermark"] = {
        ["wh_main_emp_inf_crossbowmen"] = "osm_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "osm_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "osm_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "osm_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "osm_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "osm_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "osm_inf_swordsmen";
    },
    ["wh_main_emp_ostland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "ost_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "ost_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "ost_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "ost_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "ost_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "ost_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "ost_inf_swordsmen";
    },
    ["wh_main_emp_empire"] = {
        ["wh_main_emp_inf_crossbowmen"] = "rek_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "rek_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "rek_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "rek_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "rek_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "rek_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "rek_inf_swordsmen";
    },
    ["wh_main_emp_stirland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "str_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "str_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "str_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "str_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "str_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "str_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "str_inf_swordsmen";
    },
    ["wh_main_emp_talabecland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "tab_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "tab_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "tab_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "tab_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "tab_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "tab_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "tab_inf_swordsmen";
    },
    ["wh_main_emp_wissenland"] = {
        ["wh_main_emp_inf_crossbowmen"] = "wis_inf_crossbowmen";
        ["wh_main_emp_inf_greatswords"] = "wis_inf_greatswords";
        ["wh_main_emp_inf_halberdiers"] = "wis_inf_halberdiers";
        ["wh_main_emp_inf_handgunners"] = "wis_inf_handgunners";
        ["wh_main_emp_inf_spearmen_0"] = "wis_inf_spearmen_0";
        ["wh_main_emp_inf_spearmen_1"] = "wis_inf_spearmen_1";
        ["wh_main_emp_inf_swordsmen"] = "wis_inf_swordsmen";
    },
}

--[[
    A function using units_map to map a unit key to its Provincial counterpart if applicable.
    
    Parameters
    - (string) faction_key  : The faction key of the faction the unit we want to convert belongs to (example: "wh_main_emp_wissenland")
    - (string) unit_key     : The unit key of the unit we want to convert (example: "wh_main_emp_inf_swordsmen")

    Return
    - (string) res          : The unit key of the converted unit (example: "wis_inf_swordsmen");
                            If not able to map in units_map, then return the original unit_key (example: "wh_main_emp_art_mortar").
--]]
local function convert_unit_key_to_provincial(faction_key, unit_key)
    local map = units_map[faction_key];
    if not map then
        -- if the faction_key has no mapping, then we return the original unit_key
        return unit_key;
    end
    local res = map[unit_key];
    if not res then
        -- if the unit_key has no mapping under the relevant faction, then we return the original unit_key
        return unit_key;
    end
    -- finally we can return the mapped unit_key to provincial unit key
    return res;
end

--[[
    A table to store information for each Empire faction where we will convert units to Provincial:
        - Key: faction_key | Value: An Array of tables
            - Each table in the Array contains: 
                - Key: "character"      | Value: A CHARACTER_SCRIPT_INTERFACE (of a Lord)
                - Key: "units_before"   | Value: An array of unit keys denoting the current units in the Lord's army
                - Key: "units_after"    | Value: An array of unit keys denoting the units that will be in the Lord's army 
                                                after we convert all applicable infantry to the Provincial version
    
    We will use this table both for debugging/logging as well as actually converting the units
--]]
local armies = {
    ["wh_main_emp_empire"] = {},
    ["wh2_dlc13_emp_golden_order"] = {},
    ["wh_main_emp_averland"] = {},
    ["wh_main_emp_hochland"] = {},
    ["wh_main_emp_marienburg"] = {},
    ["wh_main_emp_middenland"] = {},
    ["wh_main_emp_nordland"] = {},
    ["wh_main_emp_ostermark"] = {},
    ["wh_main_emp_ostland"] = {},
    ["wh_main_emp_stirland"] = {},
    ["wh_main_emp_talabecland"] = {},
    ["wh_main_emp_wissenland"] = {}
}

--[[
    A helper function to print the armies table to the script logs
--]]
local function debug_print_armies()
    out_h("*************************************************************");
    out_h("* Comparing units before and after converting to Provincial *");
    out_h("*************************************************************");
    for faction_key, arr in pairs(armies) do
        out_h("Faction: "..faction_key);
        for i=1, #arr do
            out_h("\tCharacter: "..arr[i]["character"]:character_subtype_key());
            out_h("\tunits_before:\n"..table.tostring(arr[i]["units_before"]));
            -- out_h(table.tostring(arr[i]["units_before"]));
            out_h("\tunits_after:\n"..table.tostring(arr[i]["units_after"]));
            -- out_h(table.tostring(arr[i]["units_after"]));
        end
    end
end

--[[
    A function to populate the armies table with relevant data, 
    in preparation for later converting the units to their applicable Provincial counterparts
    for all applicable Empire factions, playable or otherwise
--]]
local function populate_armies()
    -- Iterate over all the factions in the armies table
    for faction_key,armies in pairs(armies) do
        local faction = cm:get_faction(faction_key);
        local char_list = faction:character_list();
        -- Iterate over all characters belonging to the faction
        for i=0, char_list:num_items() - 1 do
            local c = char_list:item_at(i);
            -- We only want to consider Lords, so we make sure the character type is the same as the Faction Leader (the actual character_type_key value should be "general")
            -- We also need to make sure the Lord actually has a military force (if the Lord is wounded for whatever reason then they will not have one)
            if c:character_type_key() == faction:faction_leader():character_type_key() and not c:military_force():is_null_interface() then
                local units_before = {};
                local units_after = {};
                local unit_list = c:military_force():unit_list();
                for j=1, unit_list:num_items() -1 do -- start index at 1 to skip the Lord
                    local unit = unit_list:item_at(j):unit_key();
                    table.insert(units_before,unit); -- track the units that the Lord started with
                    table.insert(units_after,convert_unit_key_to_provincial(faction_key,unit)); -- track the units that the Lord will end up with after converting Provincial units
                end
                table.insert(armies,{
                    ["character"] = c,
                    ["units_before"] = units_before,
                    ["units_after"] = units_after,
                })
            end
        end
    end
end


--[[
    A function that will finally convert all applicable Empire units in existing armies to their Provincial counterparts.
    It does so by first removing all units from each Lord, then adding all the units in the Lord's "units_after" array from the armies table.
--]]
function hanter_replace_units()
    if cm:is_new_game() then
        -- preparation
        populate_armies();
        debug_print_armies();
        -- execution
        for faction_key, t in pairs(armies) do
            out_h("Replacing State Troops with Provincial for : "..faction_key);
            for i=1, #t do
                local character = t[i]["character"];
                local character_str = cm:char_lookup_str(character);
                local units_after = t[i]["units_after"];
                cm:remove_all_units_from_general(character);
                for j=1, #units_after do
                    cm:grant_unit_to_character(
                        character_str,
                        units_after[j]
                    )
                end
            end
        end
        -- Trigger a custom event in case other mods want to specifically act right after we finish replacing the troops
        core:trigger_custom_event("ScriptEventProvincialTroopReplacementCompleted",{});
    end
end

--[[
    Add a listener that triggers on the first tick to start our process

    Works fine in vanilla (ie no other mods altering starting Empire lords), but has issues the following:

    Doesn't work with Mixu's LL because Mixu's replacements are done at add_first_tick_callback
    If for whatever reason Mixu's LLs still aren't spawned at that point, then it will reattempt it at FactionTurnStart event (see mixu_spawn_faction_leader_listener function in !mixu_ll_global_functions.lua)
    as well as at FactionEncountersOtherFaction.
    
    Doesn't work with graetor's Solland Overhaul either. eldred_replace_starting_general() gets called at add_first_tick_callback
--]]
-- cm:add_first_tick_callback_new(function()
--     hanter_replace_units();
-- end);

--[[
    For now we will use post-first tick so that our changes will act after Solland Overhaul and Mixu's LLs (for the first attempt at least)
--]]
cm:add_post_first_tick_callback(function()
    hanter_replace_units();
end);


-- Hopefully we shouldn't need to use this (do the replacement at FactionTurnStart which is much later after First Tick).
-- I'm leaving this code here in case we want to try using it for any situations where some Empire Lord is only given their army at a later stage
--[[
core:add_listener(
    "provincial_units_replacer_listener",
    "FactionTurnStart",
    function(context)
        -- Trigger on the first human player's turn only
        return context:faction():name() == cm:get_human_factions()[1] and cm:model():turn_number()==1;
    end,
    function(context)
        hanter_replace_units();
    end,
    false -- do not persist
);
--]]

if debug_mode then

    -- Test our custom event ScriptEventProvincialTroopReplacementCompleted
    core:add_listener(
        "provincial_units_replacement_completed_listener",
        "ScriptEventProvincialTroopReplacementCompleted",
        true,
        function(context)
            out_h("Provincial Troop Replacement completed and ScriptEventProvincialTroopReplacementCompleted Event triggered");
        end,
        true
    )

    -- Some mods that change a faction leader will spawn a new faction leader and kill the old one; This will help log when that's happening
    core:add_listener(
    "provincial_units_replacer_character_killed_listener",
    "CharacterConvalescedOrKilled",
    function()
        return cm:model():turn_number() == 1;
    end,
    function(context)
        local c = context:character();
        out_h("Character killed: "..c:character_subtype_key().." from: "..c:faction():name());
    end,
    true
    );
    
end