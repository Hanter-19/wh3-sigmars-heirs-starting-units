local function out_h(str)
    out("[hanter_xou_emp_provincial_starting_units] "..str);
end

-- Vanilla starting units
local starting_units = {
    ["wh_main_emp_empire"] = {
        "rek_inf_greatswords",
        "rek_inf_halberdiers",
        "rek_inf_swordsmen",
        "rek_inf_swordsmen",
        "wh_main_emp_cav_reiksguard",
        "rek_inf_handgunners",
        "rek_inf_handgunners",
        "wh_main_emp_art_mortar",
    },
    ["wh2_dlc13_emp_golden_order"] = {
        "gol_inf_greatswords",
        "gol_inf_swordsmen",
        "gol_inf_swordsmen",
        "gol_inf_swordsmen",
        "gol_inf_spearmen_0",
        "gol_inf_crossbowmen",
        "gol_inf_crossbowmen",
        "wh_main_emp_cav_outriders_0",
        "wh_main_emp_art_great_cannon",
        "wh_main_emp_art_mortar",
    },
    ["wh_main_emp_averland"] = {
        "avr_inf_swordsmen",
        "avr_inf_swordsmen",
        "avr_inf_swordsmen",
        "avr_inf_spearmen_0",
        "wh_main_emp_cav_pistoliers_1",
        "wh_main_emp_art_mortar",
    },
    ["wh_main_emp_hochland"] = {
        "hoc_inf_swordsmen",
        "hoc_inf_swordsmen",
        "hoc_inf_swordsmen",
        "hoc_inf_crossbowmen",
        "hoc_inf_crossbowmen",
        "wh_main_emp_cav_empire_knights",
        "wh_main_emp_cav_empire_knights",
        "wh_main_emp_art_mortar",
    },
    ["wh_main_emp_marienburg"] = { -- these units don't have any special effects
        "mrb_inf_swordsmen",
        "mrb_inf_swordsmen",
        "mrb_inf_spearmen_0",
        "mrb_inf_spearmen_0",
        "mrb_inf_crossbowmen",
        "mrb_inf_crossbowmen",
        "wh_main_emp_art_mortar",
    },
    ["wh_main_emp_middenland"] = {
        "mid_inf_swordsmen",
        "mid_inf_swordsmen",
        "mid_inf_spearmen_0",
        "mid_inf_spearmen_0",
        "mid_inf_crossbowmen",
        "wh_main_emp_cav_pistoliers_1",
    },
    ["wh_main_emp_nordland"] = {
        "nod_inf_halberdiers",
        "nod_inf_spearmen_0",
        "nod_inf_spearmen_0",
        "nod_inf_spearmen_0",
        "nod_inf_crossbowmen",
        "nod_inf_crossbowmen",
    },
    ["wh_main_emp_ostermark"] = {
        "osm_inf_swordsmen",
        "osm_inf_swordsmen",
        "osm_inf_spearmen_1",
        "osm_inf_spearmen_1",
        "osm_inf_spearmen_0",
        "osm_inf_spearmen_0",
        "wh_main_emp_art_mortar",
    },
    ["wh_main_emp_ostland"] = {
        "ost_inf_swordsmen",
        "ost_inf_swordsmen",
        "ost_inf_swordsmen",
        "ost_inf_crossbowmen",
        "wh_main_emp_cav_pistoliers_1",
        "wh_main_emp_cav_pistoliers_1",
    },
    ["wh_main_emp_stirland"] = {
        "str_inf_halberdiers",
        "str_inf_spearmen_1",
        "str_inf_spearmen_0",
        "str_inf_spearmen_0",
        "wh_main_emp_cav_pistoliers_1",
        "wh_main_emp_cav_pistoliers_1",
    },
    ["wh_main_emp_talabecland"] = {
        "tab_inf_swordsmen",
        "tab_inf_swordsmen",
        "tab_inf_spearmen_1",
        "tab_inf_spearmen_0",
        "tab_inf_crossbowmen",
        "tab_inf_crossbowmen",
    },
    ["wh_main_emp_wissenland"] = {
        "wis_inf_swordsmen",
        "wis_inf_spearmen_0",
        "wis_inf_spearmen_0",
        "wis_inf_spearmen_0",
        "wis_inf_crossbowmen",
        "wis_inf_crossbowmen",
        "wh_main_emp_art_mortar",
    }
}

local function replace_units()
    if cm:is_new_game() then
        for faction_key,units in pairs(starting_units) do
            out_h("Replacing State Troops with Provincial for : "..faction_key);
            local faction_leader = cm:get_faction(faction_key):faction_leader();
            cm:remove_all_units_from_general(faction_leader);
            for i=1, #units do
                cm:grant_units_to_character_by_position_from_faction(
                    faction_key,
                    faction_leader:logical_position_x(),
                    faction_leader:logical_position_y(),
                    units[i]
                )
            end
        end
    end
end

cm:add_first_tick_callback_new(function()
    replace_units();
end);