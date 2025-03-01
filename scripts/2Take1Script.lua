if _2t1s then
    print("2Take1Script already loaded!")
    return menu.notify("2Take1Script already loaded!", "2Take1Script Setup", 8, 0x0000FF)
end
_2t1s = "2.5.6"
local a = {}
a["PDevs"] = utils.get_appdata_path("PopstarDevs", "")
a["Menu"] = a["PDevs"] .. "\\2Take1Menu"
a["ModdedOutfits"] = a["Menu"] .. "\\moddedOutfits"
a["ModdedVehicles"] = a["Menu"] .. "\\moddedVehicles"
a["ConfigFolder"] = a["Menu"] .. "\\cfg"
a["ScriptsFolder"] = a["Menu"] .. "\\scripts"
a["2Take1Script"] = a["ScriptsFolder"] .. "\\2Take1Script"
a["ScriptData"] = a["2Take1Script"] .. "\\Data"
a["ScriptMapper"] = a["2Take1Script"] .. "\\Mapper"
a["ScriptFunctions"] = a["2Take1Script"] .. "\\Functions"
a["ScriptLogs"] = a["2Take1Script"] .. "\\Logs"
a["ScriptSettings"] = a["2Take1Script"] .. "\\Settings"
a["Event-Logger"] = a["2Take1Script"] .. "\\Event-Logger"
local b = {
    ["MenuMainLog"] = a["Menu"] .. "\\2Take1Menu.log",
    ["MenuPrepLog"] = a["Menu"] .. "\\2Take1Prep.log",
    ["MenuNetLog"] = a["Menu"] .. "\\net_event.log",
    ["MenuNotifLog"] = a["Menu"] .. "\\notification.log",
    ["MenuPlayerLog"] = a["Menu"] .. "\\player.log",
    ["MenuScriptLog"] = a["Menu"] .. "\\script_event.log",
    ["MainLog"] = a["ScriptLogs"] .. "\\2Take1Script.log",
    ["ChatLog"] = a["ScriptLogs"] .. "\\Chat.log",
    ["Modder"] = a["ScriptLogs"] .. "\\Modder.cfg",
    ["Blacklist"] = a["ScriptLogs"] .. "\\blacklist.cfg",
    ["PlayerInfo"] = a["ScriptFunctions"] .. "\\PlayerInfo.lua",
    ["Utils"] = a["ScriptFunctions"] .. "\\Utils.lua",
    ["Math"] = a["ScriptFunctions"] .. "\\Math.lua",
    ["Spawn"] = a["ScriptFunctions"] .. "\\Spawn.lua",
    ["Threads"] = a["ScriptFunctions"] .. "\\Threads.lua",
    ["CustomData"] = a["ScriptData"] .. "\\CustomData.lua",
    ["StringData"] = a["ScriptData"] .. "\\StringData.lua",
    ["ScriptEvents"] = a["ScriptData"] .. "\\ScriptEvents.lua",
    ["Modderflags"] = a["ScriptData"] .. "\\Modderflags.lua",
    ["NetEventMapper"] = a["ScriptMapper"] .. "\\NetEventMapper.lua",
    ["ObjectMapper"] = a["ScriptMapper"] .. "\\ObjectMapper.lua",
    ["VehicleMapper"] = a["ScriptMapper"] .. "\\VehicleMapper.lua",
    ["PedMapper"] = a["ScriptMapper"] .. "\\PedMapper.lua",
    ["WeaponMapper"] = a["ScriptMapper"] .. "\\WeaponMapper.lua",
    ["WorldobjectMapper"] = a["ScriptMapper"] .. "\\WorldobjectMapper.lua",
    ["FakeFriends"] = a["ConfigFolder"] .. "\\scid.cfg",
    ["DefaultConfig"] = a["ScriptSettings"] .. "\\Default.ini",
    ["Dev"] = a["2Take1Script"] .. "\\dev.lua"
}
local c = {["2Take1Script Parent"] = {Enabled = true}}
local d = require("2Take1Script.Data.Modderflags")
local e = {}
function e.Log(f)
    if not f then
        return
    end
    local g = io.open(b["MainLog"], "a")
    io.output(g)
    io.write(f .. "\n")
    io.close(g)
    print(f)
end
function e.main()
    math.randomseed(utils.time_ms())
    if not utils.dir_exists(a["2Take1Script"]) then
        print("2Take1Script folder not found...")
        menu.notify(
            "2Take1Script folder not found...\nRedownload the script and make sure you got everything!",
            "2Take1Script Setup",
            8,
            0x0000FF
        )
        return false
    elseif not utils.dir_exists(a["ScriptData"]) then
        print("2Take1Script/Data folder not found...")
        menu.notify(
            "2Take1Script/Data folder not found...\nRedownload the script and make sure you got everything!",
            "2Take1Script Setup",
            8,
            0x0000FF
        )
        return false
    elseif not utils.dir_exists(a["ScriptFunctions"]) then
        print("2Take1Script/Functions folder not found...")
        menu.notify(
            "2Take1Script/Functions folder not found...\nRedownload the script and make sure you got everything!",
            "2Take1Script Setup",
            8,
            0x0000FF
        )
        return false
    elseif not utils.dir_exists(a["ScriptMapper"]) then
        print("2Take1Script/Mapper folder not found...")
        menu.notify(
            "2Take1Script/Mapper folder not found...\nRedownload the script and make sure you got everything!",
            "2Take1Script Setup",
            8,
            0x0000FF
        )
        return false
    end
    local h = {
        "CustomData",
        "StringData",
        "Modderflags",
        "ScriptEvents",
        "PlayerInfo",
        "Utils",
        "Math",
        "Spawn",
        "Threads",
        "NetEventMapper",
        "ObjectMapper",
        "VehicleMapper",
        "PedMapper",
        "WeaponMapper",
        "WorldobjectMapper"
    }
    local i = 0
    for j = 1, #h do
        if not utils.file_exists(b[h[j]]) then
            print(h[j] .. ".lua not found...")
            menu.notify(h[j] .. ".lua not found...", "2Take1Script Setup", 8, 0x0000FF)
            i = i + 1
        end
    end
    if i > 0 then
        return false
    end
    if not utils.dir_exists(a["ScriptLogs"]) then
        utils.make_dir(a["2Take1Script"] .. "\\Logs")
    end
    if not utils.dir_exists(a["ScriptSettings"]) then
        utils.make_dir(a["2Take1Script"] .. "\\Settings")
    end
    return true
end
if not e.main() then
    menu.notify("Failed to load 2Take1Script.", "2Take1Script Setup", 8, 0x0000FF)
    print("Failed to load 2Take1Script.")
    return
end
e.Log("Loading Modder Flags...")
d.Load()
d.Load()
local k = require("2Take1Script.Functions.PlayerInfo")
local l = require("2Take1Script.Functions.Utils")
local m = require("2Take1Script.Functions.Math")
local n = require("2Take1Script.Functions.Spawn")
local o = require("2Take1Script.Functions.Threads")
local p = require("2Take1Script.Data.CustomData")
local q = require("2Take1Script.Data.StringData")
local r = require("2Take1Script.Data.ScriptEvents")
local s = {
    net = require("2Take1Script.Mapper.NetEventMapper"),
    ped = require("2Take1Script.Mapper.PedMapper"),
    veh = require("2Take1Script.Mapper.VehicleMapper"),
    obj = require("2Take1Script.Mapper.ObjectMapper"),
    world = require("2Take1Script.Mapper.WorldObjectMapper"),
    weapons = require("2Take1Script.Mapper.WeaponMapper")
}
local t = {Parent = {}, Feature = {}, mainparent = 0, playerparent = 0}
local function u(v)
    if not v then
        return
    end
    if v == 1 then
        return true
    else
        return false
    end
end
local function w(x)
    local y = {0x00FF00, 0x00A2FF, 0x0000FF, 0xFF0000, 0x6C3570, 0x0062FF, 0xCCFF00}
    if t.Feature[x .. " Notification Color"] then
        return y[t.Feature[x .. " Notification Color"].value + 1]
    else
        return 0x00FF00
    end
end
local function z(f, x, A)
    if not f or not t.Feature["Enable Script Notifications"].on then
        return
    end
    A = A or "2Take1Script"
    local B = w(x or "Error")
    menu.notify(f, A, t.Feature["Notification Duration"].value, B)
    if t.Feature["Print Scriptlog"].on then
        print("[" .. A .. "] " .. f)
    end
end
local function C(f, D)
    local E
    if t.Feature["Enable Script log"] then
        E = t.Feature["Enable Script log"].on
    else
        E = true
    end
    if not f or not E then
        return
    end
    D = D or " "
    l.write(io.open(b["MainLog"], "a"), m.TimePrefix() .. " " .. f)
end
local function F(G)
    local H = {}
    for I in io.lines(b["FakeFriends"]) do
        local J = {}
        for K in I:gmatch("[^:]+") do
            J[#J + 1] = K
        end
        if #J >= 2 then
            local L = J[1]
            local M = tonumber(J[2], 16)
            H[M] = {Name = L}
        end
    end
    if H[k.SCID(G)] then
        return true
    end
    return false
end
function e.SaveSettings(g)
    if not g then
        g = b["DefaultConfig"]
    end
    local N = io.open(g, "w+")
    io.output(N)
    for O, P in pairs(c) do
        io.write(tostring(O) .. ":" .. tostring(P.Enabled) .. ":" .. tostring(P.Value) .. "\n")
    end
    io.close(N)
end
function e.LoadSettings(g)
    if not g then
        g = b["DefaultConfig"]
    end
    for I in io.lines(g) do
        local Q = {}
        for R in I:gmatch("[^:]+") do
            Q[#Q + 1] = R
        end
        local O = Q[1]
        if t.Feature[O] then
            if Q[2] ~= tostring(nil) then
                if Q[2] == "true" then
                    t.Feature[O].on = true
                elseif Q[2] == "false" then
                    t.Feature[O].on = false
                end
            end
            if Q[3] ~= tostring(nil) then
                t.Feature[O].value = Q[3]
            end
        end
    end
end
function e.Rename(g, S, T)
    if not g or not S or not T then
        return
    end
    io.remove(g)
    local U = a["ScriptSettings"] .. "\\" .. T .. ".ini"
    e.SaveSettings(U)
    t.Feature["Profile " .. T] =
        menu.add_feature(
        T,
        "action_value_str",
        t.Parent["Setting Profiles"],
        function(V)
            if V.value == 0 then
                e.SaveSettings(g)
                C("Settings saved to File.")
                z("Settings saved to File.", "Success")
            elseif V.value == 1 then
                e.LoadSettings(g)
                C("Settings Successfully Loaded!")
                z("Settings Successfully Loaded!", "Success")
            elseif V.value == 2 then
                local O = k.Input("Enter Profile Name", 25, 2, "Name")
                if not O then
                    z("Input canceled.")
                    return
                end
                e.Rename(U, T, O)
            else
                io.remove(U)
                menu.delete_feature(V.id)
            end
        end
    )
    t.Feature["Profile " .. T]:set_str_data({"Save", "Load", "Rename", "Delete"})
    menu.delete_feature(t.Feature["Profile " .. S].id)
    C("Profile " .. S .. " Successfully renamed to " .. T)
    z("Profile " .. S .. " Successfully renamed to " .. T, "Success")
end
local W = {
    ["toggle"] = 1,
    ["slider"] = 7,
    ["value_i"] = 11,
    ["value_str"] = 35,
    ["value_f"] = 131,
    ["action"] = 512,
    ["action_slider"] = 518,
    ["action_value_i"] = 522,
    ["action_value_str"] = 546,
    ["action_value_f"] = 642,
    ["autoaction_slider"] = 1030,
    ["autoaction_value_i"] = 1034,
    ["autoaction_value_str"] = 1058,
    ["autoaction_value_f"] = 1154,
    ["parent"] = 2048
}
local X = {
    {222, 222, 255},
    {2, 21, 255},
    {3, 83, 255},
    {0, 255, 140},
    {94, 255, 1},
    {255, 255, 0},
    {255, 150, 5},
    {255, 62, 0},
    {255, 1, 1},
    {255, 50, 100},
    {255, 5, 190},
    {35, 1, 255},
    {15, 3, 255}
}
local Y = {
    all = {
        {"cmd_clearwanted", "/clearwanted"},
        {"cmd_giveweapons", "/giveweapons"},
        {"cmd_removeweapons", "/removeweapons <playername>"},
        {"cmd_setbounty", "/setbounty <playername>"},
        {"cmd_explode", "/explode <playername>"},
        {"cmd_trap", "/trap <playername>"},
        {"cmd_kick", "/kick <playername>"},
        {"cmd_crash", "/crash <playername>"},
        {"cmd_spawn", "/spawn <NAME>"},
        {"cmd_vehiclegod", "/vehiclegod <on/off>"},
        {"cmd_upgrade", "/upgrade"},
        {"cmd_repair", "/repair"}
    },
    self = {
        {"cmd_tp", "/tp <playername>"},
        {"cmd_explode_all", "/explodeall"},
        {"cmd_scriptkick_all", "/scriptkickall"},
        {"cmd_desynckick_all", "/desynckickall"},
        {"cmd_crash_all", "/crashall"}
    }
}
local Z = {
    ["bl_objects"] = {},
    ["peds"] = {},
    ["attach_obj"] = {},
    ["asteroids"] = {},
    ["entity_spam"] = {},
    ["obj_crash"] = {},
    ["Custom Vehicles"] = {},
    ["preview_veh"] = {},
    ["temp_veh"] = {},
    ["shooting"] = {},
    ["chat_veh"] = {},
    ["world_objects"] = {},
    ["bodyguards"] = {},
    ["bodyguards_veh"] = {},
    ["robot_weapon_left"] = {},
    ["robot_weapon_right"] = {}
}
local _ = {
    ["police_outfit"] = {
        ["female"] = {
            ["clothes"] = {{0, 0}, {0, 6}, {0, 14}, {0, 34}, {0, 0}, {0, 25}, {0, 0}, {0, 35}, {0, 0}, {0, 0}, {0, 48}},
            ["props"] = {{0, 45, 0}, {1, 11, 0}, {2, 4294967295, 0}, {6, 4294967295, -1}, {7, 4294967295, -1}}
        },
        ["male"] = {
            ["clothes"] = {{0, 0}, {0, 0}, {0, 0}, {0, 35}, {0, 0}, {0, 25}, {0, 0}, {0, 58}, {0, 0}, {0, 0}, {0, 55}},
            ["props"] = {{0, 46, 0}, {1, 13, 0}, {2, 4294967295, 0}, {6, 4294967295, -1}, {7, 4294967295, -1}}
        }
    },
    ["bac_outfit"] = {["textures"] = {}, ["clothes"] = {}, ["prop_text"] = {}, ["prop_ind"] = {}, ["gender"] = nil},
    ["session_crash"] = {["textures"] = {}, ["clothes"] = {}, ["prop_text"] = {}, ["prop_ind"] = {}}
}
local a0 = {
    ["ceo_earnings"] = {
        {"LIFETIME_BUY_COMPLETE", 2000},
        {"LIFETIME_BUY_UNDERTAKEN", 2000},
        {"LIFETIME_SELL_COMPLETE", 2000},
        {"LIFETIME_SELL_UNDERTAKEN", 2000},
        {"LIFETIME_CONTRA_EARNINGS", 20000000}
    },
    ["mc_earnings"] = {
        {"LIFETIME_BIKER_BUY_COMPLET", 2000},
        {"LIFETIME_BIKER_BUY_UNDERTA", 2000},
        {"LIFETIME_BIKER_SELL_COMPLET", 2000},
        {"LIFETIME_BIKER_SELL_UNDERTA", 2000},
        {"LIFETIME_BIKER_BUY_COMPLET1", 2000},
        {"LIFETIME_BIKER_BUY_UNDERTA1", 2000},
        {"LIFETIME_BIKER_SELL_COMPLET1", 2000},
        {"LIFETIME_BIKER_SELL_UNDERTA1", 2000},
        {"LIFETIME_BIKER_BUY_COMPLET2", 2000},
        {"LIFETIME_BIKER_BUY_UNDERTA2", 2000},
        {"LIFETIME_BIKER_SELL_COMPLET2", 2000},
        {"LIFETIME_BIKER_SELL_UNDERTA2", 2000},
        {"LIFETIME_BIKER_BUY_COMPLET3", 2000},
        {"LIFETIME_BIKER_BUY_UNDERTA3", 2000},
        {"LIFETIME_BIKER_SELL_COMPLET3", 2000},
        {"LIFETIME_BIKER_SELL_UNDERTA3", 2000},
        {"LIFETIME_BIKER_BUY_COMPLET4", 2000},
        {"LIFETIME_BIKER_BUY_UNDERTA4", 2000},
        {"LIFETIME_BIKER_SELL_COMPLET4", 2000},
        {"LIFETIME_BIKER_SELL_UNDERTA4", 2000},
        {"LIFETIME_BIKER_BUY_COMPLET5", 2000},
        {"LIFETIME_BIKER_BUY_UNDERTA5", 2000},
        {"LIFETIME_BIKER_SELL_COMPLET5", 2000},
        {"LIFETIME_BIKER_SELL_UNDERTA5", 2000},
        {"LIFETIME_BKR_SELL_EARNINGS0", 20000000},
        {"LIFETIME_BKR_SELL_EARNINGS1", 20000000},
        {"LIFETIME_BKR_SELL_EARNINGS2", 20000000},
        {"LIFETIME_BKR_SELL_EARNINGS3", 20000000},
        {"LIFETIME_BKR_SELL_EARNINGS4", 20000000},
        {"LIFETIME_BKR_SELL_EARNINGS5", 20000000}
    },
    ["snacks_and_armor"] = {
        {"NO_BOUGHT_YUM_SNACKS", 30},
        {"NO_BOUGHT_HEALTH_SNACKS", 15},
        {"NO_BOUGHT_EPIC_SNACKS", 5},
        {"NUMBER_OF_ORANGE_BOUGHT", 10},
        {"NUMBER_OF_BOURGE_BOUGHT", 10},
        {"NUMBER_OF_CHAMP_BOUGHT", 5},
        {"CIGARETTES_BOUGHT", 20},
        {"MP_CHAR_ARMOUR_1_COUNT", 10},
        {"MP_CHAR_ARMOUR_2_COUNT", 10},
        {"MP_CHAR_ARMOUR_3_COUNT", 10},
        {"MP_CHAR_ARMOUR_4_COUNT", 10},
        {"MP_CHAR_ARMOUR_5_COUNT", 10}
    },
    ["xmas"] = {
        {"MPPLY_XMASLIVERIES0"},
        {"MPPLY_XMASLIVERIES1"},
        {"MPPLY_XMASLIVERIES2"},
        {"MPPLY_XMASLIVERIES3"},
        {"MPPLY_XMASLIVERIES4"},
        {"MPPLY_XMASLIVERIES5"},
        {"MPPLY_XMASLIVERIES6"},
        {"MPPLY_XMASLIVERIES7"},
        {"MPPLY_XMASLIVERIES8"},
        {"MPPLY_XMASLIVERIES9"},
        {"MPPLY_XMASLIVERIES10"},
        {"MPPLY_XMASLIVERIES11"},
        {"MPPLY_XMASLIVERIES12"},
        {"MPPLY_XMASLIVERIES13"},
        {"MPPLY_XMASLIVERIES14"},
        {"MPPLY_XMASLIVERIES15"},
        {"MPPLY_XMASLIVERIES16"},
        {"MPPLY_XMASLIVERIES17"},
        {"MPPLY_XMASLIVERIES18"},
        {"MPPLY_XMASLIVERIES19"},
        {"MPPLY_XMASLIVERIES20"}
    },
    ["kills_deaths"] = {"MPPLY_KILLS_PLAYERS", "MPPLY_DEATHS_PLAYER"},
    ["fast_run"] = {
        "CHAR_FM_ABILITY_1_UNLCK",
        "CHAR_FM_ABILITY_2_UNLCK",
        "CHAR_FM_ABILITY_3_UNLCK",
        "CHAR_ABILITY_1_UNLCK",
        "CHAR_ABILITY_2_UNLCK",
        "CHAR_ABILITY_3_UNLCK"
    },
    ["chc"] = {
        ["misc"] = {
            {"Remove Repeat Cooldown (-1)", "H3_COMPLETEDPOSIX", 0, -1},
            {"Last Approach Completed (1 2 3)", "H3_LAST_APPROACH", 0, -1, 3},
            {"Confirm First Board", "H3OPT_BITSET1", 0, -1},
            {"Confirm Second Board", "H3OPT_BITSET0", 0, -1}
        },
        ["board1"] = {
            {"1:Silent, 2:BigCon, 3:Aggressive", "H3OPT_APPROACH", 0, 1, 3, 1},
            {"1:Hard, 2:Difficulty, 3:Approach", "H3_HARD_APPROACH", 0, 1, 3, 1},
            {"0:Money, 1:Gold, 2:Art, 3:Diamond", "H3OPT_TARGET", 0, 0, 3, 3},
            {"Unlock Points of Interests", "H3OPT_POI", 0, 1023},
            {"Unlock Access Points", "H3OPT_ACCESSPOINTS", 0, 2047}
        },
        ["board2"] = {
            {"1:5%, 2:9%, 3:7%, 4:10%, 5:10%", "H3OPT_CREWWEAP", 0, 1, 5, 1},
            {"1:5%, 2:7%, 3:9%, 4:6%, 5:10%", "H3OPT_CREWDRIVER", 0, 1, 5, 1},
            {"1:3%, 2:7%, 3:5%, 4:10%, 5:9%", "H3OPT_CREWHACKER", 0, 1, 5, 1},
            {"Weapon Variation (0 1)", "H3OPT_WEAPS", 0, 0, 1},
            {"Vehicle Variation (0 1 2 3)", "H3OPT_VEHS", 0, 0, 3},
            {"Remove Duggan Heavy Guards", "H3OPT_DISRUPTSHIP", 0, 3},
            {"Equip Heavy Armor", "H3OPT_BODYARMORLVL", 0, 3},
            {"Scan Card Level", "H3OPT_KEYLEVELS", 0, 2},
            {"Mask Variation (0 till 12)", "H3OPT_MASKS", 0, 0, 12}
        }
    },
    ["perico"] = {
        {"Unlock Points of Interests", "H4CNF_BS_GEN", 0, 131071},
        {"Redoubt Entry Points", "H4CNF_BS_ENTR", 0, 63},
        {"Unlock Support Team", "H4CNF_BS_ABIL", 0, 63},
        {"Weapon Variation", "H4CNF_WEAPONS", 0, 1, 5, 5},
        {"Disruption - Unmarked Weapon", "H4CNF_WEP_DISRP", 0, 3},
        {"Disruption - Armor Disruption", "H4CNF_ARM_DISRP", 0, 3},
        {"Disruption - Air Support", "H4CNF_HEL_DISRP", 0, 3},
        {"Primary Target", "H4CNF_TARGET", 0, 1, 5, 5},
        {"Truck - Spawn Place", "H4CNF_TROJAN", 0, 1, 5, 3},
        {"Infiltration - Escape Points", "H4CNF_APPROACH", 0, -1},
        {"Set Missions as completed", "H4_MISSIONS", 0, 65535},
        {"Set Difficulty (Normal or Hard)", "H4_PROGRESS", 0, 126823, 130667},
        {"Gold Inside  Compound", "H4LOOT_GOLD_C_SCOPED", 0, 192, 255},
        {"Paint Inside  Compound", "H4LOOT_PAINT_SCOPED", 0, 120, 127},
        {"Gold_C Loot Price", "H4LOOT_GOLD_C", 0, 192, 255},
        {"Gold_V Loot Price", "H4LOOT_GOLD_V", 0, 471000, 126000, 1373000, 1598000},
        {"Paint Loot Price", "H4LOOT_PAINT", 0, 120, 127},
        {"Paint_V Loot Price", "H4LOOT_PAINT_V", 0, 353000, 948000, 1030000, 1198000}
    }
}
local a1 = {}
a1[1] = true
local a2 = {}
local a3 = {
    "Random Primary Color",
    "Random Secondary Color",
    "Random Pearlescent Color",
    "Random Neon Color",
    "Random Smoke Color",
    "Random Xenon Color",
    "Random Wheel Color"
}
local a4 = {
    "Rainbow Primary Color",
    "Rainbow Secondary Color",
    "Rainbow Pearlescent Color",
    "Rainbow Neon Color",
    "Rainbow Smoke Color",
    "Rainbow Xenon Color",
    "Rainbow Wheel Color"
}
local a5, a6, a7 = 0, false, 0
local a8 = v3()
local a9 = nil
local aa = 0
local ab = {}
local ac = {}
local ad = {}
local ae = {script = {}, net = {}}
local af, ag, ah, aj, ak, al
local am = {}
local an = {12, 13, 14, 43, 66, 74, 78, 83}
local ao = {Modder = {}, OTR = {}, Friends = {}}
local ap = {
    ["flamethrower"] = nil,
    ["flamethrower_green"] = nil,
    ["alien"] = nil,
    ["fire_circle"] = {},
    ["fire_balls"] = {},
    ["fire_ass"] = nil,
    ["fire_ass_ball"] = nil
}
local aq = {
    smslocations = {
        math.random(22, 41),
        math.random(60, 69),
        math.random(70, 80),
        81,
        math.random(83, 87),
        88,
        math.random(89, 97),
        math.random(102, 111),
        117,
        122,
        124,
        math.random(128, 133),
        147,
        148,
        math.random(149, 153),
        154,
        math.random(155, 158),
        159
    },
    ceomoney = {
        {"10K Work Payout", 10000, -1292453789, 0, 120000},
        {"10K Special Cargo", 10000, -1292453789, 1, 60000},
        {"10K Vehicle Cargo", 10000, 4213353345, 1, 60000},
        {"30K Cargo", 30000, 198210293, 1, 120000}
    },
    hudcomponents = {
        {"Wanted Stars", 1},
        {"Bank Money", 3},
        {"Wallet Money", 4},
        {"Vehicle Name", 6},
        {"Area Name", 7},
        {"Street Name", 9},
        {"Weapon Wheel", 19},
        {"Weapon Wheel Stats", 20},
        {"Radio Stations", 16},
        {"Aim Dot", 14}
    },
    ramps = {
        2934970695,
        3233397978,
        1290523964,
        versions = {
            {"Front", v3(0, 6, 0.2), v3(0, 0, 180)},
            {"Back", v3(0, -6, 0.2), v3(0, 0, 0)},
            {"Left", v3(-5, 0, 0.2), v3(0, 0, 270)},
            {"Right", v3(5, 0, 0.2), v3(0, 0, 90)}
        }
    },
    VehicleCategories = {
        "Compacts",
        "Sedans",
        "SUVs",
        "Coupes",
        "Muscle",
        "Sports Classics",
        "Sports",
        "Super",
        "Motorcycles",
        "Off-Road",
        "Industrial",
        "Utility",
        "Vans",
        "Cycles",
        "Boats",
        "Helicopters",
        "Planes",
        "Service",
        "Emergency",
        "Military",
        "Commercial",
        "Open Wheel"
    },
    Animals = {
        Ground = {
            {Hash = 0x61D4C771, Name = "Bigfoot"},
            {Hash = 0xAD340F5A, Name = "Bigfoot 2"},
            {Hash = 0xCE5FF074, Name = "Boar"},
            {Hash = 0x573201B8, Name = "Cat"},
            {Hash = 0xA8683715, Name = "Chimp"},
            {Hash = 0x14EC17EA, Name = "Chop"},
            {Hash = 0xFCFA9E1E, Name = "Cow"},
            {Hash = 0x644AC75E, Name = "Coyote"},
            {Hash = 0xD86B5A95, Name = "Deer"},
            {Hash = 0x431FC24C, Name = "German Shepherd"},
            {Hash = 0x6AF51FAF, Name = "Hen"},
            {Hash = 0x4E8F95A2, Name = "Husky"},
            {Hash = 0x1250D7BA, Name = "Mountain Lion"},
            {Hash = 0xE71D5E68, Name = "Panther"},
            {Hash = 0xB11BAB56, Name = "Pig"},
            {Hash = 0x431D501C, Name = "Poodle"},
            {Hash = 0x6D362854, Name = "Pug"},
            {Hash = 0xDFB55C81, Name = "Rabbit"},
            {Hash = 0xC3B52966, Name = "Rat"},
            {Hash = 0x349F33E1, Name = "Golden Retriever"},
            {Hash = 0xC2D06F53, Name = "Rhesus"},
            {Hash = 0x9563221D, Name = "Rottweiler"},
            {Hash = 0xAD7844BB, Name = "Westy"}
        },
        Water = {
            {Hash = 0x8BBAB455, Name = "Dolphin"},
            {Hash = 0x2FD800B7, Name = "Fish"},
            {Hash = 0x3C831724, Name = "Hammershark"},
            {Hash = 0x471BE4B2, Name = "Humpback"},
            {Hash = 0x8D8AC8B9, Name = "Killerwhale"},
            {Hash = 0x06C3F072, Name = "Shark"},
            {Hash = 0xA148614D, Name = "Stingray"}
        },
        Air = {
            {Hash = 0x56E29962, Name = "Cormorant"},
            {Hash = 0xAAB71F62, Name = "Chickenhawk"},
            {Hash = 0x18012A9F, Name = "Crow"},
            {Hash = 0x06A20728, Name = "Pigeon"},
            {Hash = 0xD3939DFD, Name = "Seagull"}
        },
        Standard = {
            {Hash = 0x9B22DBAF, Name = "Franklin"},
            {Hash = 0x0D7114C9, Name = "Michael"},
            {Hash = 0x9B810FA2, Name = "Trevor"},
            {Hash = 0x9C9EFFD8, Name = "MP Female"},
            {Hash = 0x705E61F2, Name = "MP Male"}
        }
    }
}
local function ar()
    local as = 0
    for j = 0, 31 do
        if player.is_player_valid(j) then
            as = as + 1
        end
    end
    return as
end
local function at(au)
    for j = #au, 2, -1 do
        local av = math.random(j)
        au[j], au[av] = au[av], au[j]
    end
    return au
end
local function aw(ax, water, ay, az)
    if
        not t.Feature["Safe Model Change"].on or
            t.Feature["Safe Model Change"].on and not ped.is_ped_in_any_vehicle(k.OwnPed()) and
                (water and entity.is_entity_in_water(k.OwnPed()) or
                    not water and not entity.is_entity_in_water(k.OwnPed()))
     then
        if az then
            l.tp(k.OwnCoords(), 1.5)
        end
        l.request_model(ax)
        player.set_player_model(ax)
        streaming.set_model_as_no_longer_needed(ax)
        if ay then
            coroutine.yield(0)
            ped.set_ped_component_variation(k.OwnPed(), 4, 0, 0, 2)
        end
        if t.Feature["Revert Outfit"].on then
            if ax == 0x9C9EFFD8 or ax == 0x705E61F2 then
                local aA = "male"
                if player.is_player_female(player.player_id()) then
                    aA = "female"
                end
                if _["bac_outfit"]["gender"] == aA then
                    local aB = _["bac_outfit"]["clothes"]
                    local aC = _["bac_outfit"]["textures"]
                    for aD = 1, 11 do
                        ped.set_ped_component_variation(k.OwnPed(), aD, aB[aD], aC[aD], 2)
                    end
                    local aE = {0, 1, 2, 6, 7}
                    local aF = _["bac_outfit"]["prop_ind"]
                    local aG = _["bac_outfit"]["prop_text"]
                    for aH = 1, #aE do
                        ped.set_ped_prop_index(k.OwnPed(), aE[aH], aF[aH], aG[aH], 0)
                    end
                end
            end
        end
    else
        z("Model Change not possible!", "Error")
    end
end
local function aI(aJ)
    for j = 1, #aJ do
        if t.Feature[aJ[j]] and t.Feature[aJ[j]].on then
            t.Feature[aJ[j]].on = false
        end
    end
end
local function aK(aL, aM, aN)
    local O = k.Name(aL)
    local aO = k.SCID(aL)
    C("Detected Chat-Command " .. aN .. " from Player " .. O .. " [" .. k.SCID(aL) .. "]")
    if
        t.Feature["Enable Commands"].value == 0 or
            t.Feature["Enable Commands"].value == 1 and player.is_player_friend(aL) or
            aL == player.player_id()
     then
        if not aM then
            C('Executing Chat Command "' .. aN .. '" for Player "' .. O .. '"')
            z("Executed Command: " .. aN .. "\nPlayer: " .. O, "Neutral", "2Take1Script Chat Commands")
            return true, nil
        end
        local aP = l.id_from_name(aM)
        local aQ = k.Name(aP)
        if not player.is_player_valid(aP) then
            C("Target doesnt exist")
            return false
        end
        if aP == player.player_id() and aL ~= player.player_id() then
            C('Blocking Chat Command "' .. aN .. '" for Player "' .. O .. '" with you as Target')
            z(
                "Blocked Command: " .. aN .. "\nPlayer: " .. O .. "\nTarget: You",
                "Neutral",
                "2Take1Script Chat Commands"
            )
            return false
        elseif player.is_player_friend(aP) and t.Feature["Block Friends as Target"].on and aL ~= player.player_id() then
            C('Blocking Chat Command "' .. aN .. '" for Player "' .. O .. '" with a Friend as Target')
            z(
                "Blocked Command: " .. aN .. "\nPlayer: " .. O .. '\nTarget: "' .. k.Name(aP) .. '" (Friend)',
                "Neutral",
                "2Take1Script Chat Commands"
            )
            return false
        else
            C('Executing Chat Command "' .. aN .. '" for Player "' .. O .. '" on Target: "' .. k.Name(aP) .. '"')
            z(
                "Executed Command: " .. aN .. "\nPlayer: " .. O .. '\nTarget: "' .. k.Name(aP) .. '"',
                "Neutral",
                "2Take1Script Chat Commands"
            )
            return true, aP
        end
    end
    return false
end
local function aR(aS)
    assert(aS.data, "Feature needs data object with area information.")
    C("Blocking Area.")
    for j = 1, #aS.data.Objects do
        local aT = aS.data.Objects[j]
        local aU = n.Object(aT.Hash)
        Z["bl_objects"][#Z["bl_objects"] + 1] = aU
        local aV = aT.Position
        if aT.Position2 then
            aV.x = math.random(aV.x, aT.Position2.x)
            aV.y = math.random(aV.y, aT.Position2.y)
            aV.z = math.random(aV.z, aT.Position2.z)
        end
        l.set_coords(aU, aV)
        entity.set_entity_rotation(aU, aT.Rotation)
        if aT.Freeze then
            entity.freeze_entity(aU, true)
        end
        if aT.Invisible then
            entity.set_entity_visible(aU, false)
        end
    end
    if t.Feature["Teleport to Block"].on then
        l.tp(aS.data.Teleport, nil, aS.data.Heading)
    end
    C("Blocking Done.")
end
local function aW()
    if not a9 then
        z("Nothing to fix", "Error", "")
        return
    end
    aw(a9)
    coroutine.yield(250)
    ped.set_ped_health(k.OwnPed(), 0)
    coroutine.yield(3500)
    local aX = _["session_crash"]["clothes"]
    local aY = _["session_crash"]["textures"]
    for j = 1, 11 do
        ped.set_ped_component_variation(k.OwnPed(), j, aX[j], aY[j], 2)
    end
    local aE = {0, 1, 2, 6, 7}
    local aF = _["session_crash"]["prop_ind"]
    local aG = _["session_crash"]["prop_text"]
    for aH = 1, #aE do
        ped.set_ped_prop_index(k.OwnPed(), aE[aH], aF[aH], aG[aH], 0)
    end
end
local function aZ()
    local a_ = am["llbone"]
    local b0 = am["rlbone"]
    local b1 = am["tampa"]
    local b2 = v3(-4.25, 0, 12.5)
    local b3 = v3(4.25, 0, 12.5)
    if a_ and b0 and b1 then
        if entity.is_an_entity(a_) and entity.is_an_entity(b0) and entity.is_an_entity(b1) then
            l.request_ctrl(a_)
            l.request_ctrl(b0)
            l.request_ctrl(b1)
            entity.attach_entity_to_entity(a_, b1, 0, b2, v3(), true, t.Feature["Robot Collision"].on, false, 2, true)
            entity.attach_entity_to_entity(b0, b1, 0, b3, v3(), true, t.Feature["Robot Collision"].on, false, 2, true)
        end
    end
end
local function b4(b5, b6)
    C("Attempt to spawn Custom Vehicle.")
    menu.set_menu_can_navigate(false)
    local b7 = {}
    local aV = v3()
    local b8 = v3()
    local b9 = 0
    local ba = 0
    local bb = 0
    local bc = false
    local bd = k.OwnVehicle()
    if t.Feature["Custom Vehicles Preview"].on and Z["preview_veh"][1] then
        l.clear(Z["preview_veh"])
        Z["preview_veh"] = {}
        a6 = false
        coroutine.yield(250)
    end
    for j = 1, #b5[1] do
        l.request_model(b5[1][j])
    end
    for j = 2, #b5 do
        aV = k.OwnCoords()
        if b5[j][6] and j == 2 then
            aV.z = aV.z + b5[j][6]
        end
        if j > 2 then
            aV.z = aV.z + 25
        end
        if
            t.Feature["Use Own Vehicles"].on and j == 2 and entity.get_entity_model_hash(bd) == b5[j][1] or
                b5[2][1] == 0 and j == 2 and t.Feature["Use Own Vehicles"].on and bd ~= 0
         then
            C("Detected Own Vehicle, using it.")
            b7[j - 1] = bd
            bc = true
        elseif b5[2][1] == 0 and not t.Feature["Use Own Vehicles"].on then
            C("Failed at spawning Custom Vehicle.")
            z("No Vehicle found, get in a valid Vehicle", "Error")
            menu.set_menu_can_navigate(true)
            return
        else
            if streaming.is_model_a_vehicle(b5[j][1]) then
                if j == 2 then
                    bb = k.OwnHeading()
                    if b5[j][11] then
                        a7 = b5[j][11]
                    else
                        a7 = 5
                    end
                    if b5[j][12] then
                        a5 = b5[j][12]
                    else
                        a5 = 1
                    end
                    aV = l.OffsetCoords(aV, bb, a7)
                end
                b7[j - 1] = n.Vehicle(b5[j][1], aV, bb)
                decorator.decor_set_int(b7[j - 1], "MPBitset", 1 << 10)
                local be = math.random(0, 16777215)
                if b5[j][4] then
                    be = b5[j][4][1]
                end
                vehicle.set_vehicle_custom_primary_colour(b7[j - 1], be)
                if b5[j][4] then
                    be = b5[j][4][2]
                end
                vehicle.set_vehicle_custom_secondary_colour(b7[j - 1], be)
                if b5[j][4] then
                    be = b5[j][4][3]
                end
                vehicle.set_vehicle_custom_pearlescent_colour(b7[j - 1], be)
                if b5[j][4] then
                    be = b5[j][4][4]
                end
                vehicle.set_vehicle_custom_wheel_colour(b7[j - 1], be)
                be = math.random(0, 4)
                if b5[j][4] then
                    be = b5[j][4][5]
                end
                vehicle.set_vehicle_window_tint(b7[j - 1], be)
                if streaming.is_model_a_plane(b5[j][1]) and j > 2 then
                    vehicle.control_landing_gear(b7[j - 1], 3)
                end
            else
                b7[j - 1] = n.Object(b5[j][1], aV)
            end
        end
        if j > 2 then
            aV.z = aV.z - 25
        end
        if t.Feature["Custom Vehicles Godmode"].on then
            entity.set_entity_god_mode(b7[j - 1], true)
        end
        if b5[j][5] then
            entity.set_entity_visible(b7[j - 1], false)
        end
        if b5[j][13] then
            entity.set_entity_alpha(b7[j - 1], b5[j][13], false)
        end
        if j > 2 then
            b9 = 0
            if b5[j][7] then
                b9 = b5[j][7]
            end
            ba = b7[1]
            if b5[j][8] then
                ba = b7[b5[j][8]]
            end
            local bf = b5[j][10]
            if bf then
                entity.set_entity_collision(b7[j - 1], false, false, false)
            else
                bf = false
            end
            aV = v3()
            if b5[j][2] then
                aV = v3(b5[j][2][1], b5[j][2][2], b5[j][2][3])
            end
            b8 = v3()
            if b5[j][3] then
                b8 = v3(b5[j][3][1], b5[j][3][2], b5[j][3][3])
            end
            if b5[j][1] ~= 0 then
                entity.attach_entity_to_entity(b7[j - 1], ba, b9, aV, b8, false, not bf, false, 2, true)
            end
            if b5[j][9] then
                local bg
                aV = k.OwnCoords()
                bg = n.Ped(b5[j][9], aV)
                coroutine.yield(0)
                if t.Feature["Custom Vehicles Godmode"].on then
                    ped.set_ped_max_health(bg, 25000000.0)
                    ped.set_ped_health(bg, 25000000.0)
                    ped.set_ped_can_ragdoll(bg, false)
                    entity.set_entity_god_mode(bg, true)
                end
                streaming.set_model_as_no_longer_needed(b5[j][9])
                if b5[j][1] ~= 0 then
                    ped.set_ped_into_vehicle(bg, b7[j - 1], -1)
                    vehicle.set_vehicle_doors_locked(b7[j - 1], 2)
                else
                    aV = v3()
                    if b5[j][2] then
                        aV = v3(b5[j][2][1], b5[j][2][2], b5[j][2][3])
                    end
                    b8 = v3()
                    if b5[j][3] then
                        b8 = v3(b5[j][3][1], b5[j][3][2], b5[j][3][3])
                    end
                    entity.attach_entity_to_entity(bg, ba, b9, aV, b8, false, not bf, true, 2, true)
                end
            end
        end
        if t.Feature["Custom Vehicles Preview"].on then
            Z["preview_veh"][#Z["preview_veh"] + 1] = b7[j - 1]
        elseif b6 then
            Z[b6][#Z[b6] + 1] = b7[j - 1]
        else
            Z["Custom Vehicles"][#Z["Custom Vehicles"] + 1] = b7[j - 1]
        end
    end
    if not t.Feature["Custom Vehicles Preview"].on then
        if t.Feature["Spawn in Custom Vehicle"].on then
            ped.set_ped_into_vehicle(k.OwnPed(), b7[1], -1)
            vehicle.set_vehicle_engine_on(b7[1], true, true, false)
        end
    end
    if not bc then
        l.MaxVehicle(b7[1], 2)
    end
    menu.set_menu_can_navigate(true)
    C("Spawn Custom Vehicle Done.")
end
local bh = {}
bh.targets = {}
function bh.spawnped()
    if #ped.get_all_peds() > 100 then
        coroutine.yield(1000)
        return
    end
    local bi = {3502104854, 32417469, 1146800212, 2557996913, 933092024, 920595805}
    local bj = k.OwnCoords() + v3(math.random(-50, 50), math.random(-50, 50), 0)
    bj.z = m.GetGroundZ(bj.x, bj.y)
    local bk = n.Ped(bi[math.random(#bi)], bj)
    menu.create_thread(bh.setup, {bk, ped.get_all_peds()})
    coroutine.yield(500)
end
function bh.setup(P)
    local bk = P[1]
    local bl = P[2]
    l.request_ctrl(bk)
    if entity.is_entity_dead(bk) and bh.targets[bk] then
        coroutine.yield(500)
        l.clear(bk)
        return
    end
    coroutine.yield(200)
    if bh.targets[bk] and entity.is_entity_dead(bh.targets[bk]) then
        l.clear(bh.targets[bk])
        bh.targets[bk] = nil
    end
    coroutine.yield(200)
    if ped.get_vehicle_ped_is_using(bk) ~= 0 then
        local ax = entity.get_entity_model_hash(ped.get_vehicle_ped_is_using(bk))
        if streaming.is_model_a_car(ax) or streaming.is_model_a_bike(ax) then
            l.request_ctrl(ped.get_vehicle_ped_is_using(bk))
            entity.set_entity_velocity(ped.get_vehicle_ped_is_using(bk), v3())
            ped.clear_ped_tasks_immediately(bk)
        end
    end
    coroutine.yield(200)
    if not weapon.has_ped_got_weapon(bk, 0xC78D71B4) then
        weapon.give_delayed_weapon_to_ped(bk, 0xC78D71B4, 0, 0)
        weapon.set_ped_ammo(bk, 0xC78D71B4, 9999)
        entity.set_entity_as_mission_entity(bk, true, true)
    end
    coroutine.yield(200)
    if not bh.targets[bk] or bh.targets[bk] == 0 then
        bh.targets[bk] = bl[math.random(#bl)]
        while bh.targets[bk] == k.OwnPed() or bh.targets[bk] == bk or entity.is_entity_dead(bh.targets[bk]) do
            bh.targets[bk] = bl[math.random(#bl)]
            coroutine.yield(0)
        end
        ai.task_combat_ped(bk, bh.targets[bk], 0, 16)
    end
    coroutine.yield(200)
    ped.set_ped_combat_attributes(bk, 46, true)
    ped.set_ped_combat_attributes(bk, 17, true)
    ped.set_ped_combat_attributes(bk, 5, true)
    ped.set_ped_combat_ability(bk, 100)
    ped.set_ped_combat_range(bk, 2)
end
local function bm(bn)
    local bo = k.PlayerVehicle(bn)
    if bo ~= 0 then
        local bp = false
        local bq
        local br = entity.get_entity_model_hash(bo)
        local bs
        if streaming.is_model_a_car(br) or streaming.is_model_a_bike(br) then
            bs = p.vehicle_blacklist[1].Children
        elseif streaming.is_model_a_plane(br) or streaming.is_model_a_heli(br) then
            bs = p.vehicle_blacklist[2].Children
        else
            bs = p.vehicle_blacklist[3].Children
        end
        for j = 1, #bs do
            if t.Feature["VB " .. bs[j].Name].on and br == bs[j].Hash then
                bp = true
                bq = bs[j].Name
            end
        end
        if bp then
            local time = utils.time_ms() + 20000
            C("Player: " .. k.Name(bn) .. "\nVehicle: " .. bq, "[Vehicle Blacklist]")
            if t.Feature["Vehicle Blacklist Reaction"].value == 0 then
                z(
                    "Player: " .. k.Name(bn) .. "\nVehicle: " .. bq .. "\nReaction: Delete",
                    "Neutral",
                    "2Take1Script Vehicle Blacklist"
                )
                l.clear(k.PlayerVehicle(bn))
            elseif t.Feature["Vehicle Blacklist Reaction"].value == 1 then
                z(
                    "Player: " .. k.Name(bn) .. "\nVehicle: " .. bq .. "\nReaction: Explode",
                    "Neutral",
                    "2Take1Script Vehicle Blacklist"
                )
                bo = k.PlayerVehicle(bn)
                l.request_ctrl(bo, 100)
                entity.set_entity_god_mode(bo, false)
                entity.set_entity_velocity(bo, v3())
                fire.add_explosion(k.PlayerCoords(bn), 59, false, true, 1, k.PlayerPed(bn))
            elseif t.Feature["Vehicle Blacklist Reaction"].value == 2 then
                z(
                    "Player: " .. k.Name(bn) .. "\nVehicle: " .. bq .. "\nReaction: Vehicle Kick",
                    "Neutral",
                    "2Take1Script Vehicle Blacklist"
                )
                r.Send("Destroy Personal Vehicle", {player.player_id(), bn}, bn)
                r.Send("Vehicle Kick", {player.player_id(), 4294967295, 4294967295, 4294967295}, bn)
            elseif t.Feature["Vehicle Blacklist Reaction"].value == 3 then
                z(
                    "Player: " .. k.Name(bn) .. "\nVehicle: " .. bq .. "\nReaction: Script Kick",
                    "Neutral",
                    "2Take1Script Vehicle Blacklist"
                )
                r.kick(bn)
            elseif t.Feature["Vehicle Blacklist Reaction"].value == 4 then
                z(
                    "Player: " .. k.Name(bn) .. "\nVehicle: " .. bq .. "\nReaction: Desync Kick",
                    "Neutral",
                    "2Take1Script Vehicle Blacklist"
                )
                network.force_remove_player(bn)
            elseif t.Feature["Vehicle Blacklist Reaction"].value == 5 then
                z(
                    "Player: " .. k.Name(bn) .. "\nVehicle: " .. bq .. "\nReaction: Crash",
                    "Neutral",
                    "2Take1Script Vehicle Blacklist"
                )
                r.crash(bn)
            end
            coroutine.yield(30000)
        end
        coroutine.yield(1000)
    end
end
local bt = {}
function bt.LogChat(bu)
    if not bu.player or not bu.body then
        return
    end
    l.write(
        io.open(b["ChatLog"], "a"),
        m.TimePrefix() .. " " .. k.Name(bu.player) .. " [" .. k.SCID(bu.player) .. "]: " .. bu.body
    )
end
function bt.PrintChat(bu)
    if not bu.player or not bu.body then
        return
    end
    print("[Chat] " .. k.Name(bu.player) .. " [" .. k.SCID(bu.player) .. "]: '" .. bu.body .. "'")
end
function bt.AntiChatSpam(bu)
    if not bu.player or not bu.body then
        return
    end
    if #ab > 128 then
        ab = {}
        C("Cleared Spam-Detection.")
    end
    if l.valid_player(bu.player, t.Feature["Exclude Friends"].on) then
        local M = k.SCID(bu.player)
        if not ab[M] then
            ab[M] = {}
        end
        if #ab[M] >= 2 then
            table.remove(ab[M], 1)
        end
        if #ab[M] > 1 then
            local bv = ab[M][1][2]
            local bw = ab[M][2][2]
            local bx = ab[M][2][1] - ab[M][1][1]
            if bv == bw and bx < 1250 or bx < 334 then
                if t.Feature["Anti Chat Spam"].value == 0 then
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Chat Spam\nReaction: Script Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                    r.kick(bu.player)
                elseif t.Feature["Anti Chat Spam"].value == 1 then
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Chat Spam\nReaction: Desync Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                    network.force_remove_player(bu.player)
                else
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Chat Spam\nReaction: Crash",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                    r.crash(bu.player)
                end
                C(
                    "Detected " ..
                        k.Name(bu.player) ..
                            " spamming! Time between last 2 MSGs was " ..
                                bx .. "ms and wrote these two MSG:\n'" .. bv .. "' and '" .. bw .. "'"
                )
            end
        end
    end
end
function bt.PunishRussian(bu)
    if not bu.player or not bu.body then
        return
    end
    if l.valid_player(bu.player, t.Feature["Exclude Friends"].on) then
        for j = 1, #q.russian_characters do
            if string.find(bu.body, q.russian_characters[j], 1) then
                if t.Feature["GEO-Block Russia"].value == 0 then
                    r.kick(bu.player)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Russian\nReaction: Script Kick\nDetected String: " ..
                                    q.russian_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Russian\nReaction: Script Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                elseif t.Feature["GEO-Block Russia"].value == 1 then
                    network.force_remove_player(bu.player)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Russian\nReaction: Desync Kick\nDetected String: " ..
                                    q.russian_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Russian\nReaction: Desync Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                elseif t.Feature["GEO-Block Russia"].value == 2 then
                    r.crash(bu.player)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Russian\nReaction: Script Crash\nDetected String: " ..
                                    q.russian_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Russian\nReaction: Script Crash",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                elseif t.Feature["GEO-Block Russia"].value == 3 then
                    fire.add_explosion(k.PlayerCoords(bu.player), 27, true, false, 1, 0)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Russian\nReaction: Explode\nDetected String: " ..
                                    q.russian_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Russian\nReaction: Explode",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                end
                return
            end
        end
    end
end
function bt.PunishChinese(bu)
    if not bu.player or not bu.body then
        return
    end
    if l.valid_player(bu.player, t.Feature["Exclude Friends"].on) then
        for j = 1, #q.chinese_characters do
            if string.find(bu.body, q.chinese_characters[j], 1) then
                if t.Feature["GEO-Block China"].value == 0 then
                    r.kick(bu.player)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Chinese\nReaction: Script Kick\nDetected String: " ..
                                    q.chinese_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Chinese\nReaction: Script Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                elseif t.Feature["GEO-Block China"].value == 1 then
                    network.force_remove_player(bu.player)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Chinese\nReaction: Desync Kick\nDetected String: " ..
                                    q.chinese_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Chinese\nReaction: Desync Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                elseif t.Feature["GEO-Block China"].value == 2 then
                    r.crash(bu.player)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Chinese\nReaction: Script Crash\nDetected String: " ..
                                    q.chinese_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Chinese\nReaction: Script Crash",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                elseif t.Feature["GEO-Block China"].value == 3 then
                    fire.add_explosion(k.PlayerCoords(bu.player), 27, true, false, 1, 0)
                    C(
                        "Player: " ..
                            k.Name(bu.player) ..
                                "\nReason: Talking Chinese\nReaction: Explode\nDetected String: " ..
                                    q.chinese_characters[j]
                    )
                    z(
                        "Player: " .. k.Name(bu.player) .. "\nReason: Talking Chinese\nReaction: Explode",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                end
                return
            end
        end
    end
end
function bt.DetectByMessage(bu)
    if not bu.player or not bu.body then
        return
    end
    if l.valid_player(bu.player, t.Feature["Exclude Friends"].on) then
        local by = false
        local bz
        local bA = q.ChatStrings.Safe
        if t.Feature["Ad Blacklist Chat Strings"].value == 1 then
            bA = q.ChatStrings.Aggressive
        end
        for j = 1, #bA do
            if string.find(bu.body:lower(), bA[j], 1, true) then
                bz = bA[j]
                by = true
            end
        end
        if by then
            if not t.Feature["Ad Blacklist Disable Notifications"].on then
                z(
                    "Player: " .. k.Name(bu.player) .. "\nReason: Chat Blacklist\nReaction: Kick",
                    "Neutral",
                    "2Take1Script Automod"
                )
            end
            C(
                "Player: " .. k.Name(bu.player) .. "\nReason: Chat Blacklist\nReaction: Kick\nDetails: " .. bz,
                "[Automod]"
            )
            if t.Feature["Ad Blacklist Fake Friends"].on then
                if F(bu.player) then
                    C("Player already exists in Blacklist")
                else
                    l.write(
                        io.open(b["FakeFriends"], "a"),
                        k.Name(bu.player) .. ":" .. m.DecToHex(k.SCID(bu.player)) .. ":c"
                    )
                end
            end
            if t.Feature["Ad Blacklist Kick Type"].value == 0 then
                r.kick(bu.player)
            else
                network.force_remove_player(bu.player)
            end
            by = false
        end
    end
end
function bt.ChatCommands(bu)
    if not bu.player or not bu.body then
        return
    end
    local bB = bu.player
    local bC = bu.body
    if t.Feature["cmd_clearwanted"].on and string.find(bC, "/clearwanted", 1) then
        local bD, bE = aK(bB, nil, "Clear Wanted")
        if bD then
            r.Send("Remove Wanted", {player.player_id(), r.MainGlobal(bB)}, bB)
        end
    end
    if t.Feature["cmd_giveweapons"].on and string.find(bC, "/giveweapons", 1) then
        local bD, bE = aK(bB, nil, "Give Weapons")
        if bD then
            local bF = weapon.get_all_weapon_hashes()
            for j = 1, #bF do
                if not weapon.has_ped_got_weapon(k.PlayerPed(bB), bF[j]) then
                    weapon.give_delayed_weapon_to_ped(k.PlayerPed(bB), bF[j], 0, 0)
                end
            end
        end
    end
    if t.Feature["cmd_removeweapons"].on and string.find(bC, "/removeweapons ", 1) then
        bC = string.gsub(bC, "/removeweapons ", "")
        local bD, bE = aK(bB, bC, "Remove Weapons")
        if bD then
            weapon.remove_all_ped_weapons(k.PlayerPed(bE))
        end
    end
    if t.Feature["cmd_setbounty"].on and string.find(bC, "/setbounty ", 1) then
        bC = string.gsub(bC, "/setbounty ", "")
        local bD, bE = aK(bB, bC, "Set Bounty")
        if bD then
            if script.get_host_of_this_script() == player.player_id() then
                z("Bounty command is not avaliable while you are Script Host", "Error", "")
                return
            end
            r.setBounty(bE, 10000, 1)
        end
    end
    if t.Feature["cmd_explode"].on and string.find(bC, "/explode ", 1) then
        bC = string.gsub(bC, "/explode ", "")
        local bD, bE = aK(bB, bC, "Explode")
        if bD then
            fire.add_explosion(k.PlayerCoords(bE), 59, false, true, 1, k.PlayerPed(bB))
            fire.add_explosion(k.PlayerCoords(bE), 8, false, true, 1, k.PlayerPed(bB))
            fire.add_explosion(k.PlayerCoords(bE), 59, false, true, 1, k.PlayerPed(bB))
        end
    end
    if t.Feature["cmd_trap"].on and string.find(bC, "/trap ", 1) then
        bC = string.gsub(bC, "/trap ", "")
        local bD, bE = aK(bB, bC, "Trap")
        if bD then
            local aV = k.PlayerCoords(bE)
            entity.set_entity_rotation(n.Object(1125864094, v3(aV.x, aV.y, aV.z - 5)), v3(0, 90, 0))
        end
    end
    if t.Feature["cmd_kick"].on and string.find(bC, "/kick ", 1) then
        bC = string.gsub(bC, "/kick ", "")
        local bD, bE = aK(bB, bC, "Kick")
        if bD then
            network.force_remove_player(bE)
        end
    end
    if t.Feature["cmd_crash"].on and string.find(bC, "/crash ", 1) then
        bC = string.gsub(bC, "/crash ", "")
        local bD, bE = aK(bB, bC, "Crash")
        if bD then
            r.crash(bE)
        end
    end
    if t.Feature["cmd_spawn"].on and string.find(bC, "/spawn ", 1) then
        bC = string.gsub(bC, "/spawn ", "")
        local bD, bE = aK(bB, nil, "Spawn")
        if bD then
            local ax = gameplay.get_hash_key(bC)
            if ax == 956849991 or ax == 1133471123 or ax == 2803699023 or ax == 386089410 or ax == 1549009676 then
                return
            end
            if streaming.is_model_a_vehicle(ax) then
                local bG =
                    n.Vehicle(
                    ax,
                    l.OffsetCoords(k.PlayerCoords(bB), player.get_player_heading(bB), 10),
                    player.get_player_heading(bB)
                )
                if l.request_ctrl(bG) then
                    vehicle.set_vehicle_window_tint(bG, 1)
                    decorator.decor_set_int(bG, "MPBitset", 1 << 10)
                    l.MaxVehicle(bG, 2)
                end
            end
        end
    end
    if t.Feature["cmd_vehiclegod"].on and string.find(bC, "/vehiclegod ", 1) then
        local bD, bE = aK(bB, nil, "VehicleGod")
        if bD then
            local bo = k.PlayerVehicle(bB)
            if bo ~= 0 then
                bC = string.gsub(bC, "/vehiclegod ", "")
                local bH
                if bC == "off" then
                    bH = false
                end
                if bC == "on" then
                    bH = true
                end
                if not l.request_ctrl(bo, 5000) then
                    z("Failed to gain control over the Players vehicle.\nThe command might not have worked.", "Error")
                end
                if bH ~= nil then
                    entity.set_entity_god_mode(bo, bH)
                end
            else
                z("Couldnt find the Players vehicle, they might be too far away.", "Error")
            end
        end
    end
    if t.Feature["cmd_upgrade"].on and string.find(bC, "/upgrade", 1) then
        local bD, bE = aK(bB, nil, "Upgrade")
        if bD then
            local bo = k.PlayerVehicle(bB)
            if bo ~= 0 then
                if not l.request_ctrl(bo, 5000) then
                    z("Failed to gain control over the Players vehicle.\nThe command might not have worked.", "Error")
                end
                l.MaxVehicle(bo)
            else
                z("Couldnt find the Players vehicle, they might be too far away.", "Error")
            end
        end
    end
    if t.Feature["cmd_repair"].on and string.find(bC, "/repair", 1) then
        local bD, bE = aK(bB, nil, "Repair")
        if bD then
            local bo = k.PlayerVehicle(bB)
            if bo ~= 0 then
                if not l.request_ctrl(bo, 5000) then
                    z("Failed to gain control over the Players vehicle.\nThe command might not have worked.", "Error")
                end
                l.RepairVehicle(bo)
            else
                z("Couldnt find the Players vehicle, they might be too far away.", "Error")
            end
        end
    end
    if t.Feature["cmd_tp"].on and string.find(bC, "/tp ", 1) and bB == player.player_id() then
        bC = string.gsub(bC, "/tp ", "")
        local bn = l.id_from_name(bC)
        if bn ~= -1 then
            local bI = 10
            local aV = k.PlayerCoords(bn)
            if aV.z < -50 then
                bI = 150
            end
            l.tp(k.PlayerPed(bn), bI)
        end
    end
    if t.Feature["cmd_explode_all"].on and string.find(bC, "/explodeall", 1) and bB == player.player_id() then
        for bB = 0, 31 do
            if l.valid_player(bB, t.Feature["Block Friends as Target"].on) then
                fire.add_explosion(k.PlayerCoords(bB), 59, true, false, 1, k.OwnPed())
            end
        end
    end
    if t.Feature["cmd_scriptkick_all"].on and string.find(bC, "/scriptkickall", 1) and bB == player.player_id() then
        for bB = 0, 31 do
            if l.valid_player(bB, t.Feature["Block Friends as Target"].on) then
                r.kick(bB)
            end
            coroutine.yield(0)
        end
    end
    if t.Feature["cmd_desynckick_all"].on and string.find(bC, "/desynckickall", 1) and bB == player.player_id() then
        for bB = 0, 31 do
            if l.valid_player(bB, t.Feature["Block Friends as Target"].on) then
                network.force_remove_player(bB)
            end
            coroutine.yield(0)
        end
    end
    if t.Feature["cmd_crash_all"].on and string.find(bC, "/crashall", 1) and bB == player.player_id() then
        for bB = 0, 31 do
            if l.valid_player(bB, t.Feature["Block Friends as Target"].on) then
                r.crash(bB)
            end
            coroutine.yield(0)
        end
    end
end
function bt.EchoChat(bu)
    if not bu.player or not bu.body then
        return
    end
    if bu.player ~= player.player_id() then
        for j = 1, t.Feature["Echo Chat"].value do
            network.send_chat_message(bu.body, false)
        end
    end
end
function bt.Profanityfilter(bu)
    if not bu.player or not bu.body then
        return
    end
    if l.valid_modder(bu.player) then
        for j = 1, #q.profanity do
            if string.find(bu.body, q.profanity[j], 1) then
                z(
                    "Player: " .. k.Name(bu.player) .. "\nReason: Profanity Filter Bypass",
                    "Neutral",
                    "2Take1Script Modder Detection"
                )
                C(
                    "Player: " ..
                        k.Name(bu.player) .. "\nReason: Profanity Filter Bypass\nDetected String: " .. q.profanity[j],
                    "[Modder Detection]"
                )
                player.set_player_as_modder(bu.player, d[10][2])
            end
        end
    end
end
local bJ = {}
function bJ.DetectByName(bn)
    if not bn then
        return
    end
    if l.valid_player(bn.player, t.Feature["Exclude Friends"].on) then
        local by = false
        local bz
        local bA = q.NameStrings.Safe
        if t.Feature["Ad Blacklist Name Strings"].value == 1 then
            bA = q.NameStrings.Aggressive
        end
        for j = 1, #bA do
            if string.find(k.Name(bn.player), bA[j]) then
                bz = bA[j]
                by = true
            end
        end
        if by then
            if not t.Feature["Ad Blacklist Disable Notifications"].on then
                z(
                    "Player: " .. k.Name(bn.player) .. "\nReason: Name Blacklist\nReaction: Kick",
                    "Neutral",
                    "2Take1Script Automod"
                )
            end
            C(
                "Player: " .. k.Name(bn.player) .. "\nReason: Name Blacklist\nReaction: Kick\nDetails: " .. bz,
                "[Automod]"
            )
            if t.Feature["Ad Blacklist Fake Friends"].on then
                if F(bn.player) then
                    C("Player already exists in Blacklist")
                else
                    l.write(
                        io.open(b["FakeFriends"], "a"),
                        k.Name(bn.player) .. ":" .. m.DecToHex(k.SCID(bn.player)) .. ":c"
                    )
                end
            end
            if t.Feature["Ad Blacklist Kick Type"].value == 0 then
                r.kick(bn.player)
            else
                network.force_remove_player(bn.player)
            end
            by = false
        end
    end
end
function bJ.Blacklist(bn)
    if not bn or not utils.file_exists(b["Blacklist"]) then
        return
    end
    local by = false
    local bK
    local bB = bn.player
    local bL = k.Name(bB)
    local bM = k.SCID(bB)
    local bN = k.IP(bB)
    local bO = {}
    for bP in io.lines(b["Blacklist"]) do
        local J = {}
        for K in bP:gmatch("[^:]+") do
            J[#J + 1] = K
        end
        if #J == 3 then
            local L = J[1]
            local M = tonumber(J[2])
            local bQ = J[3]
            bO[L] = {SCID = M, IP = bQ}
            bO[M] = {Name = L, IP = bQ}
            bO[bQ] = {Name = L, SCID = M}
        end
    end
    if
        t.Feature["Detection Requirement Name"].on and t.Feature["Detection Requirement SCID"].on and
            t.Feature["Detection Requirement IP"].on
     then
        if bO[k.Name(bB)] and bO[k.Name(bB)].SCID == bM and bO[k.Name(bB)].IP == bN then
            by = true
            bK = "Matching Name, SCID & IP"
        end
    elseif t.Feature["Detection Requirement Name"].on and t.Feature["Detection Requirement SCID"].on then
        if bO[k.Name(bB)] and bO[k.Name(bB)].SCID == bM then
            by = true
            bK = "Matching Name & SCID"
        end
    elseif t.Feature["Detection Requirement SCID"].on and t.Feature["Detection Requirement IP"].on then
        if bO[k.SCID(bB)] and bO[k.SCID(bB)].IP == bN then
            by = true
            bK = "Matching SCID & IP"
        end
    elseif t.Feature["Detection Requirement Name"].on and t.Feature["Detection Requirement IP"].on then
        if bO[k.Name(bB)] and bO[k.Name(bB)].IP == bN then
            by = true
            bK = "Matching Name & IP"
        end
    elseif t.Feature["Detection Requirement Name"].on then
        if bO[k.Name(bB)] then
            by = true
            bK = "Matching Name"
        end
    elseif t.Feature["Detection Requirement SCID"].on then
        if bO[k.SCID(bB)] then
            by = true
            bK = "Matching SCID"
        end
    elseif t.Feature["Detection Requirement IP"].on then
        if bO[k.IP(bB)] then
            by = true
            bK = "Matching IP"
        end
    end
    if by then
        C(
            "Player: " .. k.Name(bB) .. "\nReason: Player Blacklist\nReaction: Kick\nDetails: " .. bK,
            "[Player Blacklist]"
        )
        z(
            "Player: " .. k.Name(bB) .. "\nReason: Player Blacklist\nReaction: Kick",
            "Neutral",
            "2Take1Script Player Blacklist"
        )
        if t.Feature["Player Blacklist Kick Type"].value == 0 then
            r.kick(bB)
        else
            network.force_remove_player(bB)
        end
    end
end
function bJ.remember(bn)
    if not bn or not utils.file_exists(b["Modder"]) then
        return
    end
    local bB = bn.player
    local bR = {}
    if not player.can_player_be_modder(bB) then
        return
    end
    for bP in io.lines(b["Modder"]) do
        local J = {}
        for K in bP:gmatch("[^:]+") do
            J[#J + 1] = K
        end
        if #J >= 3 then
            local L = J[1]
            local M = tonumber(J[2])
            local bS = J[3]
            bR[M] = {Name = L, Flag = bS}
        end
    end
    local M = k.SCID(bB)
    if bR[M] then
        local L = k.Name(bB)
        z("Player: " .. L .. "\nReason: Remembered", "Neutral", "2Take1Script Modder Detection")
        C("Player: " .. L .. "\nReason: Remembered\nModderflag: " .. bR[M].Flag, "[Modder Detection]")
        player.set_player_as_modder(bB, d[1][2])
    end
end
local bT = {}
function bT.godmode(bn)
    local bU = 1
    local bV = k.PlayerCoords(bn)
    coroutine.yield(20000)
    local bW = k.PlayerCoords(bn)
    if l.valid_modder(bn) and k.GodmodeState(bn) and bV:magnitude(bW) > 20 then
        bU = bU + 1
    end
    coroutine.yield(20000)
    bV = k.PlayerCoords(bn)
    if l.valid_modder(bn) and k.GodmodeState(bn) and bV:magnitude(bW) > 20 then
        bU = bU + 1
    end
    coroutine.yield(20000)
    bW = k.PlayerCoords(bn)
    if l.valid_modder(bn) and k.GodmodeState(bn) and bV:magnitude(bW) > 20 then
        bU = bU + 1
    end
    if l.valid_modder(bn) and bU > 3 then
        local O = k.Name(bn)
        if t.Feature["Modder Detection Player Godmode"].value == 0 then
            z(
                "Player: " .. O .. "\nReason: Player Godmode\nReaction: Notify",
                "Neutral",
                "2Take1Script Modder Detection"
            )
            coroutine.yield(60000)
        else
            z(
                "Player: " .. O .. "\nReason: Player Godmode\nReaction: Notify & Mark",
                "Neutral",
                "2Take1Script Modder Detection"
            )
            C("Player: " .. O .. "\nReason: Player Godmode", "[Modder Detection]")
            player.set_player_as_modder(bn, d[8][2])
        end
    end
end
function bT.vehiclegodmode(bn)
    local bU = 1
    local bV = k.PlayerCoords(bn)
    coroutine.yield(20000)
    local bW = k.PlayerCoords(bn)
    if l.valid_modder(bn) and k.VehicleGodmodeState(bn) and bV:magnitude(bW) > 20 then
        bU = bU + 1
    end
    coroutine.yield(20000)
    local bV = k.PlayerCoords(bn)
    if l.valid_modder(bn) and k.VehicleGodmodeState(bn) and bV:magnitude(bW) > 20 then
        bU = bU + 1
    end
    coroutine.yield(20000)
    local bW = k.PlayerCoords(bn)
    if l.valid_modder(bn) and k.VehicleGodmodeState(bn) and bV:magnitude(bW) > 20 then
        bU = bU + 1
    end
    if l.valid_modder(bn) and bU > 3 then
        local O = k.Name(bn)
        if t.Feature["Modder Detection Vehicle Godmode"].value == 0 then
            z(
                "Player: " .. O .. "\nReason: Vehicle Godmode\nReaction: Notify",
                "Neutral",
                "2Take1Script Modder Detection"
            )
            coroutine.yield(60000)
        else
            z(
                "Player: " .. O .. "\nReason: Vehicle Godmode\nReaction: Notify & Mark",
                "Neutral",
                "2Take1Script Modder Detection"
            )
            C("Player: " .. O .. "\nReason: Vehicle Godmode", "[Modder Detection]")
            player.set_player_as_modder(bn, d[4][2])
        end
    end
end
function bT.autokick(bn)
    if not bn then
        return
    end
    local bB = bn.player
    local bX = bn.flag
    local L = player.get_modder_flag_text(bX)
    local bY = {"Kick", "Kick & Blacklist"}
    if L == "Remembered" then
        coroutine.yield(500)
    end
    if l.valid_player(bB, t.Feature["Enable Auto Kick Modder"].value == 1) then
        C(
            "Player: " .. k.Name(bB) .. "\nReason: " .. L .. "\nReaction: " .. bY[t.Feature["Autokick " .. L].value + 1],
            "[Autokick Modder]"
        )
        z(
            "Player: " .. k.Name(bB) .. "\nReason: " .. L .. "\nReaction: " .. bY[t.Feature["Autokick " .. L].value + 1],
            "Neutral",
            "2Take1Script Autokick Modder"
        )
        if t.Feature["Autokick " .. L].value == 1 and not F(bB) then
            l.write(io.open(b["FakeFriends"], "a"), k.Name(bB) .. ":" .. m.DecToHex(k.SCID(bB)) .. ":c")
        end
        network.force_remove_player(bB)
        coroutine.yield(2000)
        if player.is_player_valid(bB) then
            network.force_remove_player(bB)
        end
    end
end
function bT.remember(bn)
    if not bn then
        return
    end
    local bB = bn.player
    local bX = bn.flag
    local bC = player.get_modder_flag_text(bX)
    local L = k.Name(bB)
    local M = k.SCID(bB)
    if not utils.file_exists(b["Modder"]) then
        l.write(io.open(b["Modder"], "a"), L .. ":" .. M .. ":" .. bC)
        if t.Parent["Remember Modder Profiles"] then
            t.Feature[L .. "/" .. bC] =
                menu.add_feature(
                L,
                "action_value_str",
                t.Parent["Remember Modder Profiles"],
                function(V)
                    if V.value == 0 then
                        z(
                            "Name: " .. L .. "\nSCID: " .. M .. "\nReason: " .. bC,
                            "Neutral",
                            "2Take1Script Remember Modder"
                        )
                    elseif V.value == 1 then
                        local bR = {}
                        for bZ in io.lines(b["Modder"]) do
                            bR[bZ] = true
                        end
                        bR[L .. ":" .. M .. ":" .. bC] = nil
                        l.write(io.open(b["Modder"], "w"))
                        for b_ in pairs(bR) do
                            l.write(io.open(b["Modder"], "a"), b_)
                        end
                        menu.delete_feature(V.id)
                        z("Entry Deleted", "Success", "2Take1Script Remember Modder")
                    else
                        utils.to_clipboard(M)
                        z("SCID copied to clipboard", "Success", "2Take1Script Remember Modder")
                    end
                end
            )
            t.Feature[L .. "/" .. bC]:set_str_data({"Show Info", "Delete", "Copy SCID"})
        end
        return
    end
    local bR = {}
    for bP in io.lines(b["Modder"]) do
        local J = {}
        for K in bP:gmatch("[^:]+") do
            J[#J + 1] = K
        end
        if #J >= 3 then
            local L = J[1]
            local M = tonumber(J[2])
            local bS = J[3]
            bR[M] = {Name = L}
        end
    end
    if not bR[M] then
        l.write(io.open(b["Modder"], "a"), L .. ":" .. M .. ":" .. bC)
        if t.Parent["Remember Modder Profiles"] then
            t.Feature[L .. "/" .. bC] =
                menu.add_feature(
                L,
                "action_value_str",
                t.Parent["Remember Modder Profiles"],
                function(V)
                    if V.value == 0 then
                        z(
                            "Name: " .. L .. "\nSCID: " .. M .. "\nReason: " .. bC,
                            "Neutral",
                            "2Take1Script Remember Modder"
                        )
                    elseif V.value == 1 then
                        local bR = {}
                        for bZ in io.lines(b["Modder"]) do
                            bR[bZ] = true
                        end
                        bR[L .. ":" .. M .. ":" .. bC] = nil
                        l.write(io.open(b["Modder"], "w"))
                        for b_ in pairs(bR) do
                            l.write(io.open(b["Modder"], "a"), b_)
                        end
                        menu.delete_feature(V.id)
                        z("Entry Deleted", "Success", "2Take1Script Remember Modder")
                    else
                        utils.to_clipboard(M)
                        z("SCID copied to clipboard", "Success", "2Take1Script Remember Modder")
                    end
                end
            )
            t.Feature[L .. "/" .. bC]:set_str_data({"Show Info", "Delete", "Copy SCID"})
        end
    end
end
bt.listener =
    event.add_event_listener(
    "chat",
    function(c0)
        local bu = {player = c0.player, body = c0.body}
        if t.Feature["Log Chat"].on then
            menu.create_thread(bt.LogChat, bu)
        end
        if t.Feature["Print Chat"].on then
            menu.create_thread(bt.PrintChat, bu)
        end
        if t.Feature["Ad Blacklist Chat Strings"].on then
            menu.create_thread(bt.DetectByMessage, bu)
        end
        if t.Feature["GEO-Block Russia"].on then
            menu.create_thread(bt.PunishRussian, bu)
        end
        if t.Feature["GEO-Block China"].on then
            menu.create_thread(bt.PunishChinese, bu)
        end
        if t.Feature["Enable Commands"].on then
            menu.create_thread(bt.ChatCommands, bu)
        end
        if t.Feature["Echo Chat"].on then
            menu.create_thread(bt.EchoChat, bu)
        end
        if t.Feature["Modder Detection Profanity"].on then
            menu.create_thread(bt.Profanityfilter, bu)
        end
    end
)
bJ.joinlistener =
    event.add_event_listener(
    "player_join",
    function(bn)
        ac[bn.player] = {ID = bn.player, Name = k.Name(bn.player)}
        if t.Feature["Print Joining Players"].on then
            print(
                "[2Take1] Player " ..
                    k.Name(bn.player) .. " [" .. k.SCID(bn.player) .. " / " .. k.IP(bn.player) .. "] joined the lobby"
            )
        end
        if t.Feature["Modder Detection Remember"].on then
            menu.create_thread(bJ.remember, bn)
        end
        if t.Feature["Ad Blacklist Name Strings"].on then
            menu.create_thread(bJ.DetectByName, bn)
        end
        if t.Feature["Enable Player Blacklist"].on then
            menu.create_thread(bJ.Blacklist, bn)
        end
    end
)
bJ.leavelistener =
    event.add_event_listener(
    "player_leave",
    function(bn)
        if t.Feature["Print Leaving Players"].on and ac[bn.player] then
            print("[2Take1] Player " .. ac[bn.player].Name .. " left.")
        end
        ac[bn.player] = nil
    end
)
bT.listener =
    event.add_event_listener(
    "modder",
    function(bn)
        local L = k.Name(bn.player)
        local bC = player.get_modder_flag_text(bn.flag)
        if t.Feature["Log Modder Detections"].on then
            C("[Modder Detection] Player: " .. L .. " [" .. k.SCID(bn.player) .. "]\nReason: " .. bC)
        end
        if t.Feature["Print Modder Detections"].on then
            print("[Modder Detection] Player: " .. L .. "\nReason: " .. bC)
        end
        if t.Feature["Modder Detection Announce"].on then
            local c1
            if t.Feature["Modder Detection Announce"].value == 0 then
                c1 = false
            else
                c1 = true
            end
            network.send_chat_message("Detected '" .. L .. "' as Modder with the Reason '" .. bC .. "'", c1)
        end
        if t.Feature["Announce Crash Attempts"].on and string.find(bC:lower(), "crash") then
            local c2 = {"2Take1", "Modest Menu", "Cherax", "Stand", "Terror"}
            local c3 = c2[t.Feature["Announce Crash Attempts"].value + 1]
            network.send_chat_message(L .. " failed to crash a " .. c3 .. " user", false)
        end
        if t.Feature["Modder Detection Remember"].on and t.Feature["Remember " .. bC].on then
            menu.create_thread(bT.remember, bn)
        end
        if t.Feature["Enable Auto Kick Modder"].on and t.Feature["Autokick " .. bC].on then
            menu.create_thread(bT.autokick, bn)
        end
    end
)
local c4 = {}
local c5 =
    hook.register_script_event_hook(
    function(c6, bn, c7, c8)
        if bn ~= player.player_id() then
            return
        end
        local L = k.Name(c6)
        if c7[1] == r["Typing Begin"] then
            for j = 1, #c4 do
                if c4[j] == L then
                    return
                end
            end
            c4[#c4 + 1] = L
            menu.create_thread(
                function(G)
                    local O = k.Name(G)
                    local c9 = utils.time_ms() + 10000
                    while c9 > utils.time_ms() and player.is_player_valid(G) do
                        coroutine.yield(100)
                    end
                    for j = 1, #c4 do
                        if c4[j] == O then
                            c4[j] = nil
                        end
                    end
                end,
                c6
            )
        elseif c7[1] == r["Typing Stop"] then
            for j = 1, #c4 do
                if c4[j] == L then
                    c4[j] = nil
                end
            end
        end
        if t.Feature["Kick SMS-Sender"].on and l.valid_player(c6, t.Feature["Exclude Friends"].on) then
            if c7[1] == r["SMS"] then
                if t.Feature["Kick SMS-Sender"].value == 0 then
                    z(
                        "Player: " .. L .. "\nReason: Sending SMS\nReaction: Script Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                    r.kick(c6)
                elseif t.Feature["Kick SMS-Sender"].value == 1 then
                    z(
                        "Player: " .. L .. "\nReason: Sending SMS\nReaction: Desync Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                    network.force_remove_player(c6)
                end
            end
        end
        if t.Feature["Modder Detection Script Events"].on and l.valid_modder(c6) then
            local bp = false
            if #c7 < 2 then
                bp = true
                goto ca
            end
            if c6 ~= c7[2] then
                bp = true
                goto ca
            end
            if t.Feature["Modder Detection Script Events"].value == 0 then
                goto ca
            end
            if
                c7[1] == r["Bounty"] and not r.DoesPlayerHaveBounty(c6) and
                    not (c7[5] == 1000 or c7[5] == 3000 or c7[5] == 5000 or c7[5] == 7000 or c7[5] == 9000)
             then
                bp = true
            elseif c7[1] == r["CEO Kick"] and r.CEOID(player.player_id()) ~= c6 then
                bp = true
            elseif c7[1] == r["CEO Ban"] and r.CEOID(player.player_id()) ~= c6 then
                bp = true
            elseif c7[1] == r["CEO Money"] and r.CEOID(player.player_id()) ~= c6 then
                bp = true
            elseif c7[1] == r["Apartment Invite"] and (c7[6] == 115 or c7[6] > 128) then
                bp = true
            elseif c7[1] == r["Destroy Personal Vehicle"] then
                bp = true
            elseif c7[1] == r["Passive Mode"] and c7[3] == 1 then
                bp = true
            elseif c7[1] == r["Transaction Error"] and c7[3] == 5000 then
                bp = true
            elseif c7[1] == r["Camera Manipulation"] and c7[3] == 869796886 then
                bp = true
            elseif c7[1] == r["Force To Island"] then
                bp = true
            elseif c7[1] == r["Force To Island 2"] then
                bp = true
            elseif c7[1] == r["Force To Mission"] then
                bp = true
            elseif c7[1] == r["Force To Mission 2"] then
                bp = true
            elseif c7[1] == r["Casino Cutscene"] then
                bp = true
            end
            ::ca::
            if bp then
                local cb = c7[1] .. ", {"
                for j = 2, #c7 do
                    cb = cb .. c7[j]
                    if j ~= #c7 then
                        cb = cb .. ", "
                    end
                end
                cb = cb .. "}"
                z("Player: " .. L .. "\nReason: Modded Script Event", "Neutral", "2Take1Script Modder Detection")
                C(
                    "Player: " .. L .. "\nReason: Modded Script Event\nDetected Script Event: " .. cb,
                    "[Modder Detection]"
                )
                player.set_player_as_modder(c6, d[6][2])
            end
        end
    end
)
local cc =
    hook.register_net_event_hook(
    function(c6, bn, cd)
        if bn ~= player.player_id() then
            return
        end
        local L = k.Name(c6)
        if t.Feature["Modder Detection Net Events"].on and l.valid_modder(c6) then
            local bp = false
            for j = 1, #an do
                if cd == an[j] then
                    bp = true
                end
            end
            if bp then
                z("Player: " .. L .. "\nReason: Bad Net Event", "Neutral", "2Take1Script Modder Detection")
                C(
                    "Player: " .. L .. "\nReason: Bad Net Event\nDetected Net Event: " .. s.net.GetEventName(cd),
                    "[Modder Detection]"
                )
                player.set_player_as_modder(c6, d[9][2])
            end
        end
        if t.Feature["Kick Vote-Kicker"].on and l.valid_player(c6, t.Feature["Exclude Friends"].on) then
            if cd == 64 then
                C("Player: " .. L .. "\nReason: Kick Votes\nReaction: Kick", "[Automod]")
                if t.Feature["Kick Vote-Kicker"].value == 0 then
                    z(
                        "Player: " .. L .. "\nReason: Kick Votes\nReaction: Script Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                    r.kick(c6)
                elseif t.Feature["Kick Vote-Kicker"].value == 1 then
                    z(
                        "Player: " .. L .. "\nReason: Kick Votes\nReaction: Desync Kick",
                        "Neutral",
                        "2Take1Script Automod"
                    )
                    network.force_remove_player(c6)
                end
            end
        end
    end
)
local ce =
    event.add_event_listener(
    "exit",
    function()
        for j in pairs(am) do
            l.clear({am[j]})
        end
        for j in pairs(Z) do
            l.clear(Z[j])
        end
        l.clear({af})
        l.clear({ah})
        l.clear({ap["fire_ass_ball"]})
        if ap["flamethrower"] then
            graphics.remove_particle_fx(ap["flamethrower"], true)
        end
        if ap["flamethrower_green"] then
            graphics.remove_particle_fx(ap["flamethrower_green"], true)
        end
        if ap["fire_circle"][1] then
            for j = 1, #ap["fire_circle"] do
                graphics.remove_particle_fx(ap["fire_circle"][j], true)
            end
            l.clear(ap["fire_balls"])
        end
        if ap["fire_ass"] then
            graphics.remove_particle_fx(ap["fire_ass"], true)
        end
        for j = 0, 31 do
            if ao.OTR[j] then
                ui.remove_blip(ao.OTR[j])
            end
            if ao.Modder[j] then
                ui.remove_blip(ao.Modder[j])
            end
            if ao.Friends[j] then
                ui.remove_blip(ao.Friends[j])
            end
        end
        for j = 0, 31 do
            if ae.script[j] then
                hook.remove_script_event_hook(ae.script[j])
            end
        end
        for j = 0, 31 do
            if ae.net[j] then
                hook.remove_net_event_hook(ae.net[j])
            end
        end
        hook.remove_script_event_hook(c5)
        hook.remove_net_event_hook(cc)
        event.remove_event_listener("chat", bt.listener)
        event.remove_event_listener("modder", bT.listener)
        event.remove_event_listener("player_join", bJ.joinlistener)
        event.remove_event_listener("player_leave", bJ.leavelistener)
        C("2Take1Script unloaded. Cleanup Successful.")
        z("2Take1Script unloaded.\nCleanup Successful.", "Error")
        _2t1s = false
    end
)
if not utils.file_exists(b["DefaultConfig"]) then
    c["2Take1Script Parent"].Enabled = true
else
    for bP in io.lines(b["DefaultConfig"]) do
        local J = {}
        for K in bP:gmatch("[^:]+") do
            J[#J + 1] = K
        end
        local L = J[1]
        if L == "2Take1Script Parent" then
            if tostring(J[2]) == "nil" then
                c[L].Enabled = true
            elseif J[2] == "true" then
                c[L].Enabled = true
            elseif J[2] == "false" then
                c[L].Enabled = false
            end
            break
        end
    end
end
e.Log("Loading Features...")
local cf =
    menu.create_thread(
    function()
        if c["2Take1Script Parent"].Enabled then
            t.Parent["Main Parent"] = menu.add_feature("2Take1Script", "parent", 0, nil)
            t.Parent["Player Parent"] = menu.add_player_feature("2Take1Script", "parent", 0, nil)
            t.mainparent = t.Parent["Main Parent"].id
            t.playerparent = t.Parent["Player Parent"].id
        end
        t.Parent["local_player"] = menu.add_feature("Player Options", "parent", t.mainparent, nil).id
        t.Parent["local_vehicle"] = menu.add_feature("Vehicle Options", "parent", t.mainparent, nil).id
        t.Parent["local_modelchanger"] =
            menu.add_feature(
            "Animal Model Changer",
            "parent",
            t.mainparent,
            function(V)
                if t.Feature["Revert Outfit"].on then
                    if #_["bac_outfit"]["clothes"] < 1 then
                        if
                            player.get_player_model(player.player_id()) == 0x9C9EFFD8 or
                                player.get_player_model(player.player_id()) == 0x705E61F2
                         then
                            for j = 1, 11 do
                                _["bac_outfit"]["textures"][j] = ped.get_ped_texture_variation(k.OwnPed(), j)
                                _["bac_outfit"]["clothes"][j] = ped.get_ped_drawable_variation(k.OwnPed(), j)
                            end
                            local aE = {0, 1, 2, 6, 7}
                            for aH = 1, #aE do
                                _["bac_outfit"]["prop_ind"][aH] = ped.get_ped_prop_index(k.OwnPed(), aE[aH])
                                _["bac_outfit"]["prop_text"][aH] = ped.get_ped_prop_texture_index(k.OwnPed(), aE[aH])
                            end
                            local cg = "male"
                            if player.is_player_female(player.player_id()) then
                                cg = "female"
                            end
                            _["bac_outfit"]["gender"] = cg
                        end
                    end
                end
            end
        ).id
        t.Parent["local_lobby"] = menu.add_feature("Lobby Options", "parent", t.mainparent, nil).id
        t.Parent["local_automod"] = menu.add_feature("Auto Moderation", "parent", t.mainparent, nil).id
        t.Parent["local_modderdetection"] = menu.add_feature("Modder Detection", "parent", t.mainparent, nil).id
        t.Parent["local_world"] = menu.add_feature("World Management", "parent", t.mainparent, nil).id
        t.Parent["Stats Editor"] = menu.add_feature("Stats Editor", "parent", t.mainparent, nil)
        t.Parent["local_misc"] = menu.add_feature("Miscellaneous", "parent", t.mainparent, nil).id
        t.Parent["local_settings"] = menu.add_feature("Settings", "parent", t.mainparent, nil).id
        t.Feature["Outfit Component Randomizer"] =
            menu.add_feature(
            "Random Outfit Components",
            "action_value_str",
            t.Parent["local_player"],
            function(V)
                if V.value == 0 then
                    l.random_outfit(k.OwnPed(), 1)
                elseif V.value == 1 then
                    l.random_outfit(k.OwnPed(), 3)
                elseif V.value == 2 then
                    l.random_outfit(k.OwnPed(), 11)
                elseif V.value == 3 then
                    l.random_outfit(k.OwnPed(), 8)
                elseif V.value == 4 then
                    l.random_outfit(k.OwnPed(), 4)
                elseif V.value == 5 then
                    l.random_outfit(k.OwnPed(), 6)
                elseif V.value == 6 then
                    l.random_outfit(k.OwnPed(), 9)
                elseif V.value == 7 then
                    l.random_outfit(k.OwnPed(), 5)
                elseif V.value == 8 then
                    l.random_outfit(k.OwnPed(), 10)
                elseif V.value == 9 then
                    l.random_outfit(k.OwnPed(), 7)
                elseif V.value == 10 then
                    ped.set_ped_random_component_variation(k.OwnPed())
                end
            end
        )
        t.Feature["Outfit Component Randomizer"]:set_str_data(
            {
                "Mask",
                "Gloves",
                "Torso",
                "Undershirt",
                "Pants",
                "Shoes",
                "Armor",
                "Parachute",
                "Decal",
                "Accessory",
                "All"
            }
        )
        t.Feature["Outfit Property Randomizer"] =
            menu.add_feature(
            "Random Outfit Properties",
            "action_value_str",
            t.Parent["local_player"],
            function(V)
                if V.value == 0 then
                    ped.set_ped_prop_index(k.OwnPed(), 0, math.random(0, 162), 0, false)
                elseif V.value == 1 then
                    ped.set_ped_prop_index(k.OwnPed(), 1, math.random(0, 41), 0, false)
                elseif V.value == 2 then
                    ped.set_ped_prop_index(k.OwnPed(), 2, math.random(0, 21), 0, false)
                elseif V.value == 3 then
                    ped.set_ped_prop_index(k.OwnPed(), 6, math.random(0, 20), 0, false)
                elseif V.value == 4 then
                    ped.set_ped_prop_index(k.OwnPed(), 7, math.random(0, 20), 0, false)
                else
                    ped.set_ped_prop_index(k.OwnPed(), 0, math.random(0, 162), 0, false)
                    ped.set_ped_prop_index(k.OwnPed(), 1, math.random(0, 41), 0, false)
                    ped.set_ped_prop_index(k.OwnPed(), 2, math.random(0, 21), 0, false)
                    ped.set_ped_prop_index(k.OwnPed(), 6, math.random(0, 20), 0, false)
                    ped.set_ped_prop_index(k.OwnPed(), 7, math.random(0, 20), 0, false)
                end
            end
        )
        t.Feature["Outfit Property Randomizer"]:set_str_data({"Hat", "Glasses", "Ear", "Watch", "Bracelet", "All"})
        t.Feature["Force Police Outfit"] =
            menu.add_feature(
            "Force Police Outfit",
            "toggle",
            t.Parent["local_player"],
            function(V)
                c["Force Police Outfit"] = {Enabled = V.on}
                while V.on do
                    local ch = "male"
                    if player.is_player_female(player.player_id()) then
                        ch = "female"
                    end
                    local ci = _["police_outfit"][ch]
                    for j = 1, #ci["clothes"] do
                        ped.set_ped_component_variation(k.OwnPed(), j, ci["clothes"][j][2], ci["clothes"][j][1], 2)
                    end
                    for j = 1, #ci["props"] do
                        ped.set_ped_prop_index(k.OwnPed(), ci["props"][j][1], ci["props"][j][2], ci["props"][j][3], 0)
                    end
                    coroutine.yield(250)
                end
                c["Force Police Outfit"].Enabled = V.on
            end
        )
        t.Parent["Weapon Loadout"] = menu.add_feature("Weapon Loadout", "parent", t.Parent["local_player"], nil).id
        t.Feature["Weapon Loadout Toggle"] =
            menu.add_feature(
            "Enable Loadout",
            "toggle",
            t.Parent["Weapon Loadout"],
            function(V)
                c["Weapon Loadout Toggle"] = {Enabled = V.on}
                while V.on do
                    for j = 1, #s.weapons do
                        local cj = s.weapons[j]
                        for av = 1, #cj.Children do
                            local ck = cj.Children[av]
                            if t.Feature["Equip " .. ck.Name].on and not weapon.has_ped_got_weapon(k.OwnPed(), ck.Hash) then
                                weapon.give_delayed_weapon_to_ped(k.OwnPed(), ck.Hash, 0, 0)
                                weapon.set_ped_ammo(k.OwnPed(), ck.Hash, 9999)
                            elseif
                                not t.Feature["Equip " .. ck.Name].on and t.Feature["Weapon Loadout Remove"].on and
                                    weapon.has_ped_got_weapon(k.OwnPed(), ck.Hash)
                             then
                                weapon.remove_weapon_from_ped(k.OwnPed(), ck.Hash)
                            end
                            if ck.Components then
                                for b_ = 1, #ck.Components do
                                    local cl = ck.Components[b_]
                                    if t.Feature["Equip " .. ck.Name .. " " .. cl.Name].on then
                                        if
                                            weapon.has_ped_got_weapon(k.OwnPed(), ck.Hash) and
                                                not weapon.has_ped_got_weapon_component(k.OwnPed(), ck.Hash, cl.Hash)
                                         then
                                            weapon.give_weapon_component_to_ped(k.OwnPed(), ck.Hash, cl.Hash)
                                        end
                                    else
                                        if
                                            weapon.has_ped_got_weapon(k.OwnPed(), ck.Hash) and
                                                weapon.has_ped_got_weapon_component(k.OwnPed(), ck.Hash, cl.Hash)
                                         then
                                            weapon.remove_weapon_component_from_ped(k.OwnPed(), ck.Hash, cl.Hash)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                c["Weapon Loadout Toggle"].Enabled = V.on
            end
        )
        t.Feature["Weapon Loadout Remove"] =
            menu.add_feature(
            "Remove not selected weapons",
            "toggle",
            t.Parent["Weapon Loadout"],
            function(V)
                c["Weapon Loadout Remove"] = {Enabled = V.on}
            end
        )
        t.Feature["Weapon Loadout All"] =
            menu.add_feature(
            "Set All",
            "action_value_str",
            t.Parent["Weapon Loadout"],
            function(V)
                if V.value == 0 then
                    for j = 1, #s.weapons do
                        local cj = s.weapons[j]
                        for av = 1, #cj.Children do
                            local ck = cj.Children[av]
                            t.Feature["Equip " .. ck.Name].on = true
                        end
                    end
                elseif V.value == 1 then
                    for j = 1, #s.weapons do
                        local cj = s.weapons[j]
                        for av = 1, #cj.Children do
                            local ck = cj.Children[av]
                            t.Feature["Equip " .. ck.Name].on = false
                        end
                    end
                end
            end
        )
        t.Feature["Weapon Loadout All"]:set_str_data({"Equip", "Unequip"})
        for j = 1, #s.weapons do
            local cj = s.weapons[j]
            t.Parent[cj] = menu.add_feature(cj.Name, "parent", t.Parent["Weapon Loadout"]).id
            for av = 1, #cj.Children do
                local ck = cj.Children[av]
                if ck.Components then
                    t.Parent[ck] = menu.add_feature(ck.Name, "parent", t.Parent[cj], nil).id
                    t.Feature["Equip " .. ck.Name] =
                        menu.add_feature(
                        "Equip",
                        "toggle",
                        t.Parent[ck],
                        function(V)
                            c["Equip " .. ck.Name] = {Enabled = V.on}
                        end
                    )
                    for b_ = 1, #ck.Components do
                        local cl = ck.Components[b_]
                        t.Feature["Equip " .. ck.Name .. " " .. cl.Name] =
                            menu.add_feature(
                            cl.Name,
                            "toggle",
                            t.Parent[ck],
                            function(V)
                                c["Equip " .. ck.Name .. " " .. cl.Name] = {Enabled = V.on}
                            end
                        )
                    end
                else
                    t.Feature["Equip " .. ck.Name] =
                        menu.add_feature(
                        ck.Name,
                        "toggle",
                        t.Parent[cj],
                        function(V)
                            c["Equip " .. ck.Name] = {Enabled = V.on}
                        end
                    )
                end
            end
        end
        t.Parent["Weapon Modifier"] = menu.add_feature("Weapon Modifier", "parent", t.Parent["local_player"], nil).id
        t.Parent["Flamethrower"] = menu.add_feature("Flamethrower", "parent", t.Parent["Weapon Modifier"], nil).id
        t.Feature["Flamethrower Scale"] =
            menu.add_feature(
            "Scale",
            "autoaction_value_i",
            t.Parent["Flamethrower"],
            function(V)
                c["Flamethrower Scale"] = {Value = V.value}
            end
        )
        t.Feature["Flamethrower Scale"].min = 1
        t.Feature["Flamethrower Scale"].max = 25
        t.Feature["Flamethrower"] =
            menu.add_feature(
            "Flamethrower",
            "toggle",
            t.Parent["Flamethrower"],
            function(V)
                c["Flamethrower"] = {Enabled = V.on}
                while V.on do
                    if player.is_player_free_aiming(player.player_id()) then
                        graphics.set_next_ptfx_asset("weap_xs_vehicle_weapons")
                        while not graphics.has_named_ptfx_asset_loaded("weap_xs_vehicle_weapons") do
                            graphics.request_named_ptfx_asset("weap_xs_vehicle_weapons")
                            coroutine.yield(0)
                        end
                        if not ap["alien"] then
                            ap["alien"] = n.Object(1803116220, k.OwnCoords())
                            entity.set_entity_collision(ap["alien"], false, false, false)
                            entity.set_entity_visible(ap["alien"], false)
                        end
                        local cm = m.GetPedBoneCoords(k.OwnPed(), 0xdead)
                        l.set_coords(ap["alien"], cm)
                        entity.set_entity_rotation(ap["alien"], cam.get_gameplay_cam_rot())
                        if not ap["flamethrower"] then
                            ap["flamethrower"] =
                                graphics.start_networked_ptfx_looped_on_entity(
                                "muz_xs_turret_flamethrower_looping",
                                ap["alien"],
                                v3(),
                                v3(),
                                t.Feature["Flamethrower Scale"].value
                            )
                            graphics.set_particle_fx_looped_scale(
                                ap["flamethrower"],
                                t.Feature["Flamethrower Scale"].value
                            )
                        end
                    else
                        if ap["flamethrower"] then
                            graphics.remove_particle_fx(ap["flamethrower"], true)
                            ap["flamethrower"] = nil
                            l.clear({ap["alien"]})
                            ap["alien"] = nil
                        end
                    end
                    coroutine.yield(0)
                end
                if ap["flamethrower"] then
                    graphics.remove_particle_fx(ap["flamethrower"], true)
                    ap["flamethrower"] = nil
                    l.clear({ap["alien"]})
                    ap["alien"] = nil
                end
                c["Flamethrower"].Enabled = V.on
            end
        )
        t.Feature["Flamethrower Green"] =
            menu.add_feature(
            "Flamethrower - Green",
            "toggle",
            t.Parent["Flamethrower"],
            function(V)
                c["Flamethrower Green"] = {Enabled = V.on}
                while V.on do
                    if player.is_player_free_aiming(player.player_id()) then
                        graphics.set_next_ptfx_asset("weap_xs_vehicle_weapons")
                        while not graphics.has_named_ptfx_asset_loaded("weap_xs_vehicle_weapons") do
                            graphics.request_named_ptfx_asset("weap_xs_vehicle_weapons")
                            coroutine.yield(0)
                        end
                        if not ap["alien"] then
                            ap["alien"] = n.Object(1803116220, k.OwnCoords())
                            entity.set_entity_collision(ap["alien"], false, false, false)
                            entity.set_entity_visible(ap["alien"], false)
                        end
                        local cm = m.GetPedBoneCoords(k.OwnPed(), 0xdead)
                        l.set_coords(ap["alien"], cm)
                        entity.set_entity_rotation(ap["alien"], cam.get_gameplay_cam_rot())
                        if not ap["flamethrower_green"] then
                            ap["flamethrower_green"] =
                                graphics.start_networked_ptfx_looped_on_entity(
                                "muz_xs_turret_flamethrower_looping_sf",
                                ap["alien"],
                                v3(),
                                v3(),
                                t.Feature["Flamethrower Scale"].value
                            )
                        end
                    else
                        if ap["flamethrower_green"] then
                            graphics.remove_particle_fx(ap["flamethrower_green"], true)
                            ap["flamethrower_green"] = nil
                            l.clear({ap["alien"]})
                            ap["alien"] = nil
                        end
                    end
                    coroutine.yield(0)
                end
                if ap["flamethrower_green"] then
                    graphics.remove_particle_fx(ap["flamethrower_green"], true)
                    ap["flamethrower_green"] = nil
                    l.clear({ap["alien"]})
                    ap["alien"] = nil
                end
                c["Flamethrower Green"].Enabled = V.on
            end
        )
        t.Parent["Shoot Objects"] = menu.add_feature("Shoot Objects", "parent", t.Parent["Weapon Modifier"], nil).id
        t.Feature["Shoot Objects"] =
            menu.add_feature(
            "Enable Object Shoot",
            "toggle",
            t.Parent["Shoot Objects"],
            function(V)
                c["Shoot Objects"] = {Enabled = V.on}
                while V.on do
                    for j = 1, #p.shoot_entitys do
                        if t.Feature[p.shoot_entitys[j].Name].on and ped.is_ped_shooting(k.OwnPed()) then
                            if #Z["shooting"] > 128 then
                                l.clear(Z["shooting"])
                                Z["shooting"] = {}
                            end
                            local aV = k.OwnCoords()
                            local cn = cam.get_gameplay_cam_rot()
                            cn:transformRotToDir()
                            cn = cn * 8
                            aV = aV + cn
                            if streaming.is_model_an_object(p.shoot_entitys[j].Hash) then
                                Z["shooting"][#Z["shooting"] + 1] = n.Object(p.shoot_entitys[j].Hash, aV)
                            end
                            cn = nil
                            local co = k.OwnCoords()
                            cn = cam.get_gameplay_cam_rot()
                            cn:transformRotToDir()
                            cn = cn * 100
                            co = co + cn
                            local cp = co - aV
                            entity.apply_force_to_entity(
                                Z["shooting"][#Z["shooting"]],
                                3,
                                cp.x,
                                cp.y,
                                cp.z,
                                0.0,
                                0.0,
                                0.0,
                                true,
                                true
                            )
                        end
                    end
                    coroutine.yield(0)
                end
                l.clear(Z["shooting"])
                Z["shooting"] = {}
                c["Shoot Objects"].Enabled = V.on
            end
        )
        t.Feature["Delete Objects"] =
            menu.add_feature(
            "Delete Objects",
            "action",
            t.Parent["Shoot Objects"],
            function()
                l.clear(Z["shooting"])
                Z["shooting"] = {}
            end
        )
        for j = 1, #p.shoot_entitys do
            if streaming.is_model_an_object(p.shoot_entitys[j].Hash) then
                t.Feature[p.shoot_entitys[j].Name] =
                    menu.add_feature(
                    "Shoot " .. p.shoot_entitys[j].Name,
                    "toggle",
                    t.Parent["Shoot Objects"],
                    function(V)
                        c[p.shoot_entitys[j].Name] = {Enabled = V.on}
                    end
                )
            else
                print("Shoot Objects preset " .. p.shoot_entitys[j].Name .. " is invalid.")
            end
        end
        t.Feature["Delete Gun"] =
            menu.add_feature(
            "Delete Gun",
            "toggle",
            t.Parent["Weapon Modifier"],
            function(V)
                c["Delete Gun"] = {Enabled = V.on}
                while V.on do
                    if ped.is_ped_shooting(k.OwnPed()) then
                        local cq = player.get_entity_player_is_aiming_at(player.player_id())
                        if cq then
                            if entity.is_entity_a_ped(cq) then
                                local bo = ped.get_vehicle_ped_is_using(cq)
                                if bo ~= 0 then
                                    ped.clear_ped_tasks_immediately(cq)
                                    cq = bo
                                end
                            end
                            if not ped.is_ped_a_player(cq) then
                                l.clear({cq})
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                c["Delete Gun"].Enabled = V.on
            end
        )
        t.Feature["Kick Gun"] =
            menu.add_feature(
            "Kick Gun",
            "toggle",
            t.Parent["Weapon Modifier"],
            function(V)
                c["Kick Gun"] = {Enabled = V.on}
                while V.on do
                    if ped.is_ped_shooting(k.OwnPed()) then
                        local cr = player.get_entity_player_is_aiming_at(player.player_id())
                        if ped.is_ped_a_player(cr) then
                            z("Kick-Gun hit: " .. k.Name(player.get_player_from_ped(cr)), "Neutral")
                            r.kick(player.get_player_from_ped(cr))
                        end
                    end
                    coroutine.yield(0)
                end
                c["Kick Gun"].Enabled = V.on
            end
        )
        t.Feature["Drive it Gun"] =
            menu.add_feature(
            "Drive it Gun",
            "toggle",
            t.Parent["Weapon Modifier"],
            function(V)
                c["Drive it Gun"] = {Enabled = V.on}
                while V.on do
                    local cs = k.OwnPed()
                    if ped.is_ped_shooting(cs) then
                        local ct = player.get_entity_player_is_aiming_at(player.player_id())
                        if ct ~= 0 then
                            if entity.is_entity_a_ped(ct) then
                                local cu = ped.get_vehicle_ped_is_using(ct)
                                if cu ~= 0 then
                                    ped.clear_ped_tasks_immediately(ct)
                                    ct = cu
                                end
                            end
                            if entity.is_entity_a_vehicle(ct) then
                                ped.set_ped_into_vehicle(cs, ct, -1)
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                c["Drive it Gun"].Enabled = V.on
            end
        )
        t.Feature["Anti Gravity Gun"] =
            menu.add_feature(
            "Anti Gravity Gun",
            "value_str",
            t.Parent["Weapon Modifier"],
            function(V)
                c["Anti Gravity Gun"] = {Enabled = V.on, Value = V.value}
                local cv = {0, -10, 10}
                while V.on do
                    local cs = k.OwnPed()
                    if ped.is_ped_shooting(cs) then
                        local ct = player.get_entity_player_is_aiming_at(player.player_id())
                        if ct ~= 0 then
                            if entity.is_entity_a_ped(ct) then
                                local cu = ped.get_vehicle_ped_is_using(ct)
                                if cu ~= 0 then
                                    ct = cu
                                end
                            end
                            l.request_ctrl(ct, 100)
                            entity.freeze_entity(ct, false)
                            if entity.is_entity_a_vehicle(ct) then
                                entity.set_entity_gravity(ct, false)
                                vehicle.set_vehicle_gravity_amount(ct, cv[V.value + 1])
                            end
                        end
                    end
                    c["Anti Gravity Gun"].Value = V.value
                    coroutine.yield(0)
                end
                c["Anti Gravity Gun"].Enabled = V.on
            end
        )
        t.Feature["Anti Gravity Gun"]:set_str_data({"Remove", "Reverse", "Normalise"})
        t.Feature["Force Gun"] =
            menu.add_feature(
            "Force Gun",
            "toggle",
            t.Parent["Weapon Modifier"],
            function(V)
                c["Force Gun"] = {Enabled = V.on}
                while V.on do
                    local cs = k.OwnPed()
                    if ped.is_ped_shooting(cs) then
                        local ct = player.get_entity_player_is_aiming_at(player.player_id())
                        if ct ~= 0 then
                            if entity.is_entity_a_ped(ct) then
                                local cu = ped.get_vehicle_ped_is_using(ct)
                                if cu ~= 0 then
                                    ct = cu
                                end
                            end
                            entity.freeze_entity(ct, false)
                            local cw = entity.get_entity_coords(ct)
                            local cx = player.get_player_coords(player.player_id())
                            local cy = cx:magnitude(cw)
                            local cz = (cw - cx) * 80 / cy
                            l.request_ctrl(ct, 100)
                            entity.set_entity_velocity(ct, cz)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Force Gun"].Enabled = V.on
            end
        )
        t.Feature["Airstrike Gun"] =
            menu.add_feature(
            "Airstrike Gun",
            "toggle",
            t.Parent["Weapon Modifier"],
            function(V)
                c["Airstrike Gun"] = {Enabled = V.on}
                while V.on do
                    local cs = k.OwnPed()
                    if ped.is_ped_shooting(cs) then
                        local cA = gameplay.get_hash_key("weapon_airstrike_rocket")
                        local aV = k.OwnCoords()
                        local cn = cam.get_gameplay_cam_rot()
                        cn:transformRotToDir()
                        cn = cn * 1000
                        aV = aV + cn
                        local cB, cC, cD, ax, aU =
                            worldprobe.raycast(
                            l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 1) + v3(0, 0, 1),
                            aV,
                            -1,
                            0
                        )
                        while not cB do
                            aV = k.OwnCoords()
                            cn = cam.get_gameplay_cam_rot()
                            cn:transformRotToDir()
                            cn = cn * 1000
                            aV = aV + cn
                            cB, cC, cD, ax, aU =
                                worldprobe.raycast(
                                l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 1) + v3(0, 0, 1),
                                aV,
                                -1,
                                0
                            )
                            coroutine.yield(0)
                        end
                        local cE = cC + v3(0, 0, 50)
                        gameplay.shoot_single_bullet_between_coords(cE, cC, 1000, cA, k.OwnPed(), true, false, 5000)
                    end
                    coroutine.yield(0)
                end
                c["Airstrike Gun"].Enabled = V.on
            end
        )
        t.Parent["Model Gun"] = menu.add_feature("Model Gun", "parent", t.Parent["Weapon Modifier"], nil).id
        t.Feature["Model Gun"] =
            menu.add_feature(
            "Standard Model Gun (Peds)",
            "toggle",
            t.Parent["Model Gun"],
            function(V)
                c["Model Gun"] = {Enabled = V.on}
                while V.on do
                    if ag then
                        entity.set_entity_visible(k.OwnPed(), false)
                        if af then
                            entity.set_entity_visible(af, true)
                        end
                    else
                        entity.set_entity_visible(k.OwnPed(), true)
                    end
                    if player.is_player_free_aiming(player.player_id()) then
                        local cF = player.get_entity_player_is_aiming_at(player.player_id())
                        if cF ~= 0 then
                            cF = entity.get_entity_model_hash(cF)
                            if streaming.is_model_a_ped(cF) then
                                if af then
                                    l.clear({af})
                                    af = nil
                                end
                                local cG = entity.get_entity_model_hash(k.OwnPed())
                                if cF ~= cG then
                                    ag = false
                                    coroutine.yield(50)
                                    local cH = ped.get_current_ped_weapon(k.OwnPed())
                                    aw(cF)
                                    coroutine.yield(25)
                                    weapon.give_delayed_weapon_to_ped(k.OwnPed(), cH, 0, 1)
                                end
                            elseif streaming.is_model_a_vehicle(cF) and t.Feature["Extended Model Gun"].on then
                                l.clear({af})
                                af = nil
                                ag = true
                                af = n.Vehicle(cF, k.OwnCoords())
                                entity.attach_entity_to_entity(
                                    af,
                                    k.OwnPed(),
                                    0,
                                    v3(),
                                    v3(),
                                    true,
                                    true,
                                    false,
                                    0,
                                    true
                                )
                            elseif streaming.is_model_an_object(cF) and t.Feature["Extended Model Gun"].on then
                                l.clear({af})
                                af = nil
                                af = n.Object(cF, k.OwnCoords())
                                ag = true
                                entity.attach_entity_to_entity(
                                    af,
                                    k.OwnPed(),
                                    0,
                                    v3(),
                                    v3(),
                                    true,
                                    true,
                                    false,
                                    0,
                                    true
                                )
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                l.clear({af})
                af = nil
                entity.set_entity_visible(k.OwnPed(), true)
                c["Model Gun"].Enabled = V.on
            end
        )
        t.Feature["Extended Model Gun"] =
            menu.add_feature(
            "Add Objects and Vehicles to Model Gun",
            "toggle",
            t.Parent["Model Gun"],
            function(V)
                c["Extended Model Gun"] = {Enabled = V.on}
            end
        )
        t.Feature["Rapid Fire"] =
            menu.add_feature(
            "Rapid Fire",
            "value_str",
            t.Parent["Weapon Modifier"],
            function(V)
                c["Rapid Fire"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    if V.value == 0 and player.is_player_free_aiming(player.player_id()) then
                        if ped.is_ped_shooting(k.OwnPed()) then
                            for j = 1, 25 do
                                local cI = m.GetPedBoneCoords(k.OwnPed(), 0x67f2)
                                local cn = cam.get_gameplay_cam_rot()
                                cn:transformRotToDir()
                                cn = cn * 1.5
                                cI = cI + cn
                                cn = nil
                                local cJ = k.OwnCoords()
                                cn = cam.get_gameplay_cam_rot()
                                cn:transformRotToDir()
                                cn = cn * 1500
                                cJ = cJ + cn
                                local cK = ped.get_current_ped_weapon(k.OwnPed())
                                gameplay.shoot_single_bullet_between_coords(
                                    cI,
                                    cJ,
                                    1,
                                    cK,
                                    k.OwnPed(),
                                    true,
                                    false,
                                    1000
                                )
                                coroutine.yield(0)
                            end
                        end
                    elseif V.value == 1 and k.OwnVehicle() == 0 then
                        if ped.is_ped_shooting(k.OwnPed()) then
                            for j = 1, 25 do
                                local cI = m.GetPedBoneCoords(k.OwnPed(), 0x67f2)
                                local cn = cam.get_gameplay_cam_rot()
                                cn:transformRotToDir()
                                cn = cn * 1.5
                                cI = cI + cn
                                cn = nil
                                local cJ = k.OwnCoords()
                                cn = cam.get_gameplay_cam_rot()
                                cn:transformRotToDir()
                                cn = cn * 1500
                                cJ = cJ + cn
                                local cK = ped.get_current_ped_weapon(k.OwnPed())
                                gameplay.shoot_single_bullet_between_coords(
                                    cI,
                                    cJ,
                                    1,
                                    cK,
                                    k.OwnPed(),
                                    true,
                                    false,
                                    1000
                                )
                                coroutine.yield(0)
                            end
                        end
                    end
                    c["Rapid Fire"].Value = V.value
                    coroutine.yield(0)
                end
                c["Rapid Fire"].Enabled = V.on
            end
        )
        t.Feature["Rapid Fire"]:set_str_data({"v1", "v2"})
        t.Parent["Health Features"] = menu.add_feature("Health Modifier", "parent", t.Parent["local_player"], nil).id
        t.Feature["Player Godmode v2"] =
            menu.add_feature(
            "Godmode v2",
            "toggle",
            t.Parent["Health Features"],
            function(V)
                while V.on do
                    native.call(0xFAEE099C6F890BB8, k.OwnPed(), 1, 1, 1, 1, 1, 0, 1, 0)
                    coroutine.yield(500)
                end
                native.call(0xFAEE099C6F890BB8, k.OwnPed(), 0, 0, 0, 0, 0, 0, 1, 0)
            end
        )
        t.Feature["Fill Health"] =
            menu.add_feature(
            "Fill Health",
            "action",
            t.Parent["Health Features"],
            function()
                if player.get_player_max_health(player.player_id()) ~= player.get_player_health(player.player_id()) then
                    ped.set_ped_health(k.OwnPed(), max)
                    z("Filled health!", "Success")
                end
            end
        )
        t.Feature["Quick Regeneration"] =
            menu.add_feature(
            "Quick Regeneration",
            "toggle",
            t.Parent["Health Features"],
            function(V)
                c["Quick Regeneration"] = {Enabled = V.on}
                while V.on do
                    local max = player.get_player_max_health(player.player_id())
                    local cL = player.get_player_health(player.player_id())
                    if max > cL then
                        ped.set_ped_health(k.OwnPed(), cL + 1)
                    end
                    coroutine.yield(0)
                end
                c["Quick Regeneration"].Enabled = V.on
            end
        )
        t.Feature["Set Health"] =
            menu.add_feature(
            "Set Health: Input",
            "action",
            t.Parent["Health Features"],
            function()
                local cM = k.Input("Enter Custom Health Value (100 - 1000000000)", 10, 3)
                if not cM then
                    z("Input canceled.", "Error", "")
                    return
                end
                if tonumber(cM) < 100 or tonumber(cM) > 1000000000 then
                    z("Value must be between 100 and 1000000000", "Error", "")
                    return
                end
                ped.set_ped_health(k.OwnPed(), cM)
                ped.set_ped_max_health(k.OwnPed(), cM)
                z("Health successfully set to: " .. cM, "Success")
            end
        )
        t.Feature["Unlimited regeneration"] =
            menu.add_feature(
            "Unlimited Health regeneration",
            "toggle",
            t.Parent["Health Features"],
            function(V)
                c["Unlimited regeneration"] = {Enabled = V.on}
                while V.on do
                    local cL = player.get_player_health(player.player_id())
                    local cN = cL + cL * 0.005
                    if cN < 500000000 then
                        ped.set_ped_health(k.OwnPed(), cN)
                        ped.set_ped_max_health(k.OwnPed(), cN)
                    end
                    coroutine.yield(0)
                end
                c["Unlimited regeneration"].Enabled = V.on
                if t.Feature["Revert Health"].on then
                    ped.set_ped_max_health(k.OwnPed(), 328)
                    ped.set_ped_health(k.OwnPed(), 328)
                end
            end
        )
        t.Feature["Revert Health"] =
            menu.add_feature(
            "Revert health after disabling Health regeneration",
            "toggle",
            t.Parent["Health Features"],
            function(V)
                c["Revert Health"] = {Enabled = V.on}
            end
        )
        t.Feature["Undead OTR"] =
            menu.add_feature(
            "Undead OTR",
            "toggle",
            t.Parent["Health Features"],
            function(V)
                c["Undead OTR"] = {Enabled = V.on}
                while V.on do
                    local max = player.get_player_max_health(player.player_id())
                    if max ~= 0 then
                        ped.set_ped_max_health(k.OwnPed(), 0)
                    end
                    coroutine.yield(0)
                end
                c["Undead OTR"].Enabled = V.on
                ped.set_ped_max_health(k.OwnPed(), 328)
            end
        )
        t.Feature["Ragdoll Self"] =
            menu.add_feature(
            "Ragdoll Self",
            "action",
            t.Parent["local_player"],
            function()
                ped.set_ped_to_ragdoll(k.OwnPed(), 2500, 0, 0)
            end
        )
        t.Feature["Ragdoll Self Loop"] =
            menu.add_feature(
            "Ragdoll Self (Loop)",
            "toggle",
            t.Parent["local_player"],
            function(V)
                while V.on do
                    ped.set_ped_to_ragdoll(k.OwnPed(), 2500, 0, 0)
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Fake Wanted Level"] =
            menu.add_feature(
            "Fake Wanted Level",
            "action_value_i",
            t.Parent["local_player"],
            function(V)
                native.call(0x1454F2448DE30163, V.value)
            end
        )
        t.Feature["Fake Wanted Level"].min = 0
        t.Feature["Fake Wanted Level"].max = 6
        t.Feature["Always have Parachute"] =
            menu.add_feature(
            "Always have Parachute",
            "toggle",
            t.Parent["local_player"],
            function(V)
                c["Always have Parachute"] = {Enabled = V.on}
                while V.on do
                    local bk = k.OwnPed()
                    if not weapon.has_ped_got_weapon(bk, 0xFBAB5776) then
                        weapon.give_delayed_weapon_to_ped(bk, 0xFBAB5776, 1, 1)
                    end
                    coroutine.yield(1000)
                end
                c["Always have Parachute"].Enabled = V.on
            end
        )
        t.Feature["Respawn at Position of Death"] =
            menu.add_feature(
            "Respawn at Position of Death",
            "toggle",
            t.Parent["local_player"],
            function(V)
                c["Respawn at Position of Death"] = {Enabled = V.on}
                while V.on do
                    local aV = k.OwnCoords()
                    if player.get_player_health(player.player_id()) == 0 then
                        while player.get_player_health(player.player_id()) ~=
                            player.get_player_max_health(player.player_id()) do
                            coroutine.yield(0)
                        end
                        aV.z = m.GetGroundZ(aV.x, aV.y) + 1
                        l.tp(aV)
                    end
                    coroutine.yield(0)
                end
                c["Respawn at Position of Death"].Enabled = V.on
            end
        )
        t.Parent["Aim Protection"] = menu.add_feature("Aim Protection", "parent", t.Parent["local_player"], nil).id
        t.Feature["Enable Aim Protection"] =
            menu.add_feature(
            "Enable Aim Protection",
            "value_str",
            t.Parent["Aim Protection"],
            function(V)
                c["Enable Aim Protection"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    local cO
                    if V.value == 0 then
                        cO = false
                    else
                        cO = true
                    end
                    for bB = 0, 31 do
                        if l.valid_player(bB, cO) then
                            local bn = player.get_entity_player_is_aiming_at(bB)
                            if bn ~= 0 then
                                if bn == k.OwnPed() then
                                    if t.Feature["Aim Protection Notify"].on then
                                        z(
                                            "Detected " ..
                                                k.Name(bB) .. " aiming at you! Applying chosen punishments...",
                                            "Neutral",
                                            "2Take1Script Aim Protection"
                                        )
                                    end
                                    if t.Feature["Aim Protection Anonymous Explosion"].on then
                                        fire.add_explosion(k.PlayerCoords(bB), 8, false, true, 0, k.PlayerPed(bB))
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Named Explosion"].on then
                                        fire.add_explosion(k.PlayerCoords(bB), 8, false, true, 0, k.OwnPed())
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Freeze"].on then
                                        ped.clear_ped_tasks_immediately(k.PlayerPed(bB))
                                        coroutine.yield(0)
                                    end
                                    if t.Feature["Aim Protection Ragdoll"].on then
                                        fire.add_explosion(k.PlayerCoords(bB), 13, false, true, 0, 0)
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Fire"].on then
                                        graphics.set_next_ptfx_asset("scr_recrash_rescue")
                                        while not graphics.has_named_ptfx_asset_loaded("scr_recrash_rescue") do
                                            graphics.request_named_ptfx_asset("scr_recrash_rescue")
                                            coroutine.yield(0)
                                        end
                                        graphics.start_networked_ptfx_looped_on_entity(
                                            "scr_recrash_rescue_fire",
                                            k.PlayerPed(bB),
                                            v3(),
                                            v3(),
                                            1
                                        )
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Remove Weapon"].on then
                                        local cP = k.PlayerPed(bB)
                                        ped.set_ped_can_switch_weapons(cP, false)
                                        weapon.remove_weapon_from_ped(cP, ped.get_current_ped_weapon(cP))
                                        ped.set_ped_can_switch_weapons(cP, false)
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Warehouse Invite"].on then
                                        r.Send("Warehouse Invite", {player.player_id(), 0, 1, math.random(1, 22)}, bB)
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Apartment Invite"].on then
                                        r.Send(
                                            "Apartment Invite",
                                            {player.player_id(), bB, 1, 0, math.random(1, 113), 1, 1, 1},
                                            bB
                                        )
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Electrocute"].on then
                                        local aV = k.PlayerCoords(bB)
                                        gameplay.shoot_single_bullet_between_coords(
                                            aV + v3(0, 0, 2),
                                            aV,
                                            0,
                                            0x3656C8C1,
                                            k.OwnPed(),
                                            true,
                                            false,
                                            10000
                                        )
                                        coroutine.yield(75)
                                    end
                                    if t.Feature["Aim Protection Kick"].on then
                                        if t.Feature["Aim Protection Kick"].value == 0 then
                                            r.kick(bB)
                                        else
                                            network.force_remove_player(bB)
                                        end
                                        coroutine.yield(500)
                                    end
                                    if t.Feature["Aim Protection Crash"].on then
                                        r.crash(bB)
                                        coroutine.yield(500)
                                    end
                                end
                            end
                        end
                    end
                    c["Enable Aim Protection"].Value = V.value
                    coroutine.yield(0)
                end
                c["Enable Aim Protection"].Enabled = V.on
            end
        )
        t.Feature["Enable Aim Protection"]:set_str_data({"All Players", "Exclude Friends"})
        t.Feature["Aim Protection Notify"] =
            menu.add_feature(
            "Notify Triggered Protections",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Notify"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Anonymous Explosion"] =
            menu.add_feature(
            "Anonymous Explosion",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Anonymous Explosion"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Named Explosion"] =
            menu.add_feature(
            "Named Explosion",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Named Explosion"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Freeze"] =
            menu.add_feature(
            "Freeze",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Freeze"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Ragdoll"] =
            menu.add_feature(
            "Ragdoll",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Ragdoll"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Fire"] =
            menu.add_feature(
            "Set on Fire",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Fire"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Remove Weapon"] =
            menu.add_feature(
            "Remove Weapon",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Remove Weapon"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Apartment Invite"] =
            menu.add_feature(
            "Apartment Invite",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Apartment Invite"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Warehouse Invite"] =
            menu.add_feature(
            "Warehouse Invite",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Warehouse Invite"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Electrocute"] =
            menu.add_feature(
            "Electrocute",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Electrocute"] = {Enabled = V.on}
            end
        )
        t.Feature["Aim Protection Kick"] =
            menu.add_feature(
            "Kick",
            "value_str",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Kick"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Aim Protection Kick"]:set_str_data({"Script Kick", "Desync Kick"})
        t.Feature["Aim Protection Crash"] =
            menu.add_feature(
            "Crash",
            "toggle",
            t.Parent["Aim Protection"],
            function(V)
                c["Aim Protection Crash"] = {Enabled = V.on}
            end
        )
        t.Parent["Bodyguards"] = menu.add_feature("Bodyguards", "parent", t.Parent["local_player"], nil).id
        t.Parent["Bodyguard Spawn Settings"] =
            menu.add_feature("Spawn Settings", "parent", t.Parent["Bodyguards"], nil).id
        t.Feature["Bodyguard Godmode"] =
            menu.add_feature(
            "Godmode Bodyguards",
            "toggle",
            t.Parent["Bodyguard Spawn Settings"],
            function(V)
                c["Bodyguard Godmode"] = {Enabled = V.on}
            end
        )
        t.Feature["Bodyguard No Ragdoll"] =
            menu.add_feature(
            "Disable Ragdoll",
            "toggle",
            t.Parent["Bodyguard Spawn Settings"],
            function(V)
                c["Bodyguard No Ragdoll"] = {Enabled = V.on}
            end
        )
        t.Feature["Bodyguard Marker"] =
            menu.add_feature(
            "Add Map Marker",
            "toggle",
            t.Parent["Bodyguard Spawn Settings"],
            function(V)
                c["Bodyguard Marker"] = {Enabled = V.on}
            end
        )
        t.Feature["Bodyguard Health"] =
            menu.add_feature(
            "Health",
            "action_value_i",
            t.Parent["Bodyguard Spawn Settings"],
            function(V)
                local cM = tonumber(k.Input("Enter Bodyguards Health Value (100 - 1000000)", 7, 3))
                if not cM then
                    z("Input canceled.", "Error", "")
                    return
                end
                if cM < 100 or cM > 1000000 then
                    z("Value must be between 100 and 1000000", "Error", "")
                    return
                end
                V.value = cM
                z("Bodyguards Health set to: " .. V.value, "Success")
                c["Bodyguard Health"] = {Value = V.value}
            end
        )
        t.Feature["Bodyguard Health"].min = 100
        t.Feature["Bodyguard Health"].max = 1000000
        for j = 1, #p.Bodyguards do
            local L = p.Bodyguards[j].Name
            local cQ = {}
            for av = 1, #p.Bodyguards[j].Children do
                cQ[av] = p.Bodyguards[j].Children[av].Name
            end
            t.Feature["Bodyguard " .. L] =
                menu.add_feature(
                L,
                "autoaction_value_str",
                t.Parent["Bodyguard Spawn Settings"],
                function(V)
                    c["Bodyguard " .. L] = {Value = V.value}
                end
            )
            t.Feature["Bodyguard " .. L]:set_str_data(cQ)
        end
        t.Feature["Bodyguard Aim Shot"] =
            menu.add_feature(
            "Shoot at your Aim Target",
            "toggle",
            t.Parent["Bodyguards"],
            function(V)
                c["Bodyguard Aim Shot"] = {Enabled = V.on}
            end
        )
        t.Feature["Bodyguard Behavior"] =
            menu.add_feature(
            "Combat Behavior",
            "autoaction_value_str",
            t.Parent["Bodyguards"],
            function(V)
                c["Bodyguard Behavior"] = {Value = V.value}
            end
        )
        t.Feature["Bodyguard Behavior"]:set_str_data({"Stationary", "Defensive", "Offensive"})
        t.Feature["Bodyguard Distance"] =
            menu.add_feature(
            "Max Distance To Player",
            "autoaction_value_i",
            t.Parent["Bodyguards"],
            function(V)
                c["Bodyguard Distance"] = {Value = V.value}
            end
        )
        t.Feature["Bodyguard Distance"].min = 50
        t.Feature["Bodyguard Distance"].max = 500
        t.Feature["Bodyguard Distance"].mod = 50
        t.Feature["Bodyguard Formation"] =
            menu.add_feature(
            "Formation",
            "autoaction_value_str",
            t.Parent["Bodyguards"],
            function(V)
                c["Bodyguard Formation"] = {Value = V.value}
            end
        )
        t.Feature["Bodyguard Formation"]:set_str_data({"Nothing", "Circle 1", "Circle 2", "Line"})
        t.Feature["Bodyguard Count"] =
            menu.add_feature(
            "Amount of Bodyguards",
            "autoaction_value_i",
            t.Parent["Bodyguards"],
            function(V)
                c["Bodyguard Count"] = {Value = V.value}
            end
        )
        t.Feature["Bodyguard Count"].min = 1
        t.Feature["Bodyguard Count"].max = 7
        t.Feature["Enable Bodyguards"] =
            menu.add_feature(
            "Enable Bodyguards",
            "toggle",
            t.Parent["Bodyguards"],
            function(V)
                while V.on do
                    local cR = player.get_player_group(player.player_id())
                    local cS = p.Bodyguards[1].Children[t.Feature["Bodyguard Ped Type"].value + 1].Hash
                    local cT = p.Bodyguards[2].Children[t.Feature["Bodyguard Primary Weapon"].value + 1].Hash
                    local cU = p.Bodyguards[3].Children[t.Feature["Bodyguard Secondary Weapon"].value + 1].Hash
                    local cV = {}
                    for cg = 1, #Z["bodyguards"] do
                        if cg > t.Feature["Bodyguard Count"].value then
                            l.clear(Z["bodyguards"][cg])
                            Z["bodyguards"][cg] = nil
                        end
                    end
                    for j = 1, t.Feature["Bodyguard Count"].value do
                        if not Z["bodyguards"][j] or entity.is_entity_dead(Z["bodyguards"][j]) then
                            if Z["bodyguards"][j] and entity.is_entity_dead(Z["bodyguards"][j]) then
                                l.clear({Z["bodyguards"][j]})
                            end
                            local aV = k.OwnCoords()
                            aV.x = aV.x + math.random(-5, 5)
                            aV.y = aV.y + math.random(-5, 5)
                            aV.z = m.GetGroundZ(aV.x, aV.y)
                            if cS == -1 then
                                local cW = k.OwnPed()
                                local cX = entity.get_entity_model_hash(cW)
                                if cX ~= 2627665880 and cX ~= 1885233650 then
                                    z("Clones are disabled for non player models", "Error", "")
                                    V.on = false
                                    return
                                end
                                Z["bodyguards"][j] = ped.clone_ped(cW)
                                l.set_coords(Z["bodyguards"][j], aV)
                            elseif cS == -2 then
                                local ax = p.Bodyguards[1].Children[math.random(#p.Bodyguards[1].Children)].Hash
                                while ax == -1 or ax == -2 do
                                    ax = p.Bodyguards[1].Children[math.random(#p.Bodyguards[1].Children)].Hash
                                end
                                Z["bodyguards"][j] = n.Ped(ax, aV, 29)
                                if ax == 2633130371 or ax == 0x81441B71 then
                                    ped.set_ped_component_variation(Z["bodyguards"][j], 8, 1, 1, 1)
                                end
                            else
                                Z["bodyguards"][j] = n.Ped(cS, aV, 29)
                                if cS == 2633130371 or cS == 0x81441B71 then
                                    ped.set_ped_component_variation(Z["bodyguards"][j], 8, 1, 1, 1)
                                end
                            end
                            if t.Feature["Bodyguard Godmode"].on then
                                entity.set_entity_god_mode(Z["bodyguards"][j], true)
                            else
                                ped.set_ped_max_health(Z["bodyguards"][j], t.Feature["Bodyguard Health"].value)
                                ped.set_ped_health(Z["bodyguards"][j], t.Feature["Bodyguard Health"].value)
                            end
                            if t.Feature["Bodyguard No Ragdoll"].on then
                                for av = 1, 26 do
                                    ped.set_ped_ragdoll_blocking_flags(Z["bodyguards"][j], av)
                                end
                            end
                            if t.Feature["Bodyguard Marker"].on then
                                local cY = ui.add_blip_for_entity(Z["bodyguards"][j])
                                ui.set_blip_sprite(cY, 310)
                                ui.set_blip_colour(cY, 80)
                            end
                            if cT ~= -1 then
                                if cT == -2 then
                                    local ax = p.Bodyguards[2].Children[math.random(#p.Bodyguards[2].Children)].Hash
                                    while ax == -1 or ax == -2 do
                                        ax = p.Bodyguards[2].Children[math.random(#p.Bodyguards[2].Children)].Hash
                                    end
                                    weapon.give_delayed_weapon_to_ped(Z["bodyguards"][j], ax, 0, 1)
                                else
                                    weapon.give_delayed_weapon_to_ped(Z["bodyguards"][j], cT, 0, 1)
                                end
                            end
                            if cU ~= -1 then
                                if cU == -2 then
                                    local ax = p.Bodyguards[3].Children[math.random(#p.Bodyguards[3].Children)].Hash
                                    while ax == -1 or ax == -2 do
                                        ax = p.Bodyguards[3].Children[math.random(#p.Bodyguards[3].Children)].Hash
                                    end
                                    weapon.give_delayed_weapon_to_ped(Z["bodyguards"][j], ax, 0, 1)
                                else
                                    weapon.give_delayed_weapon_to_ped(Z["bodyguards"][j], cU, 0, 1)
                                end
                            end
                            ped.set_ped_combat_ability(Z["bodyguards"][j], 100)
                            ped.set_can_attack_friendly(Z["bodyguards"][j], false, false)
                            entity.set_entity_as_mission_entity(Z["bodyguards"][j], 1, 1)
                        end
                        if not cV[j] or menu.has_thread_finished(cV[j]) then
                            cV[j] =
                                menu.create_thread(
                                function(cZ)
                                    if not entity.is_entity_dead(cZ) then
                                        l.request_ctrl(cZ)
                                        if ped.get_ped_group(cZ) ~= cR then
                                            ped.set_ped_as_group_member(cZ, cR)
                                            ped.set_ped_never_leaves_group(cZ, true)
                                        end
                                        ped.set_ped_combat_movement(cZ, t.Feature["Bodyguard Behavior"].value)
                                        ped.set_group_formation(cR, t.Feature["Bodyguard Formation"].value)
                                        if t.Feature["Bodyguard Aim Shot"].on then
                                            if player.is_player_free_aiming(player.player_id()) then
                                                local bn = player.get_entity_player_is_aiming_at(player.player_id())
                                                if bn ~= 0 then
                                                    ai.task_shoot_at_entity(cZ, bn, 100, 0xC6EE6B4C)
                                                else
                                                    local aV = k.OwnCoords()
                                                    local cn = cam.get_gameplay_cam_rot()
                                                    cn:transformRotToDir()
                                                    cn = cn * math.random(1, 50)
                                                    aV = aV + cn
                                                    ai.task_shoot_gun_at_coord(cZ, aV, 100, 0xC6EE6B4C)
                                                end
                                            end
                                        end
                                        if
                                            k.OwnCoords():magnitude(entity.get_entity_coords(cZ)) >
                                                t.Feature["Bodyguard Distance"].value
                                         then
                                            l.set_coords(cZ, l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), -5))
                                        end
                                    end
                                    coroutine.yield(100)
                                end,
                                Z["bodyguards"][j]
                            )
                        end
                    end
                    coroutine.yield(200)
                end
                l.clear(Z["bodyguards"])
                Z["bodyguards"] = {}
            end
        )
        t.Parent["Personal Vehicle"] = menu.add_feature("Personal Vehicle", "parent", t.Parent["local_vehicle"], nil).id
        t.Feature["Teleport To Personal Vehicle"] =
            menu.add_feature(
            "Teleport to Personal Vehicle",
            "action",
            t.Parent["Personal Vehicle"],
            function(V)
                local bo = player.get_personal_vehicle()
                local c_ = k.OwnVehicle()
                if bo ~= 0 then
                    if c_ ~= bo then
                        l.tp(
                            l.OffsetCoords(entity.get_entity_coords(bo), entity.get_entity_heading(bo), -5),
                            0,
                            entity.get_entity_heading(bo)
                        )
                    end
                else
                    z("No Personal Vehicle found!", "Error", "")
                end
            end
        )
        t.Feature["Drive Personal Vehicle"] =
            menu.add_feature(
            "Drive Personal Vehicle",
            "action",
            t.Parent["Personal Vehicle"],
            function()
                local bo = player.get_personal_vehicle()
                local c_ = k.OwnVehicle()
                if bo ~= 0 then
                    if c_ ~= bo then
                        ped.set_ped_into_vehicle(k.OwnPed(), bo, -1)
                    end
                else
                    z("No Personal Vehicle found!", "Error", "")
                end
            end
        )
        t.Feature["Teleport Personal Vehicle To Me"] =
            menu.add_feature(
            "Teleport Personal Vehicle to me",
            "action",
            t.Parent["Personal Vehicle"],
            function()
                local bo = player.get_personal_vehicle()
                local c_ = k.OwnVehicle()
                if bo ~= 0 then
                    if c_ ~= bo then
                        l.set_coords(bo, l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 5))
                        entity.set_entity_heading(bo, k.OwnHeading())
                    end
                else
                    z("No Personal Vehicle found!", "Error", "")
                end
            end
        )
        t.Feature["TP Personal Vehicle To Me And Drive"] =
            menu.add_feature(
            "Teleport Personal Vehicle to me and drive",
            "action",
            t.Parent["Personal Vehicle"],
            function()
                local bo = player.get_personal_vehicle()
                local c_ = k.OwnVehicle()
                if bo ~= 0 then
                    if c_ ~= bo then
                        l.set_coords(bo, k.OwnCoords())
                        entity.set_entity_heading(bo, k.OwnHeading())
                        ped.set_ped_into_vehicle(k.OwnPed(), bo, -1)
                    end
                else
                    z("No Personal Vehicle found!", "Error", "")
                end
            end
        )
        t.Parent["Vehice Colors"] = menu.add_feature("Vehicle Colors", "parent", t.Parent["local_vehicle"], nil).id
        t.Feature["Vehicle Colors Speed"] =
            menu.add_feature(
            "Speed in Milliseconds",
            "autoaction_value_i",
            t.Parent["Vehice Colors"],
            function(V)
                c["Vehicle Colors Speed"] = {Value = V.value}
            end
        )
        t.Feature["Vehicle Colors Speed"].min = 100
        t.Feature["Vehicle Colors Speed"].max = 10000
        t.Feature["Vehicle Colors Speed"].mod = 100
        t.Parent["Random Colors"] = menu.add_feature("Random Colors", "parent", t.Parent["Vehice Colors"], nil).id
        t.Feature["Random Primary Color"] =
            menu.add_feature(
            "Random Primary",
            "toggle",
            t.Parent["Random Colors"],
            function(V)
                aI({"Synced Colors", "Rainbow Primary Color", "100 Black"})
                c["Random Primary Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        vehicle.set_vehicle_custom_primary_colour(bo, math.random(0, 0xffffff))
                        coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                    end
                    coroutine.yield(0)
                end
                c["Random Primary Color"].Enabled = V.on
            end
        )
        t.Feature["Random Secondary Color"] =
            menu.add_feature(
            "Random Secondary",
            "toggle",
            t.Parent["Random Colors"],
            function(V)
                aI({"Synced Colors", "Rainbow Secondary Color", "100 Black"})
                c["Random Secondary Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        vehicle.set_vehicle_custom_secondary_colour(bo, math.random(0, 0xffffff))
                        coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                    end
                    coroutine.yield(0)
                end
                c["Random Secondary Color"].Enabled = V.on
            end
        )
        t.Feature["Random Wheel Color"] =
            menu.add_feature(
            "Random Wheel",
            "toggle",
            t.Parent["Random Colors"],
            function(V)
                aI({"Synced Colors", "Rainbow Wheel Color", "100 Black"})
                c["Random Wheel Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        vehicle.set_vehicle_custom_wheel_colour(bo, math.random(0, 0xffffff))
                        coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                    end
                    coroutine.yield(0)
                end
                c["Random Wheel Color"].Enabled = V.on
            end
        )
        t.Feature["Random Pearlescent Color"] =
            menu.add_feature(
            "Random Pearlescent",
            "toggle",
            t.Parent["Random Colors"],
            function(V)
                aI({"Synced Colors", "Rainbow Pearlescent Color", "100 Black"})
                c["Random Pearlescent Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        vehicle.set_vehicle_custom_pearlescent_colour(bo, math.random(0, 0xffffff))
                        coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                    end
                    coroutine.yield(0)
                end
                c["Random Pearlescent Color"].Enabled = V.on
            end
        )
        t.Feature["Random Neon Color"] =
            menu.add_feature(
            "Random Neon Lights",
            "toggle",
            t.Parent["Random Colors"],
            function(V)
                aI({"Synced Colors", "Rainbow Neon Color", "100 Black"})
                c["Random Neon Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        local be = math.random(0, 0xffffff)
                        vehicle.set_vehicle_neon_lights_color(bo, be)
                        coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                    end
                    coroutine.yield(0)
                end
                c["Random Neon Color"].Enabled = V.on
            end
        )
        t.Feature["Random Smoke Color"] =
            menu.add_feature(
            "Random Smoke",
            "toggle",
            t.Parent["Random Colors"],
            function(V)
                aI({"Synced Colors", "Rainbow Smoke Color", "100 Black"})
                c["Random Smoke Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        local d0 = math.random(0, 255)
                        local d1 = math.random(0, 255)
                        local d2 = math.random(0, 255)
                        vehicle.set_vehicle_tire_smoke_color(bo, d0, d1, d2)
                        coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                    end
                    coroutine.yield(0)
                end
                c["Random Smoke Color"].Enabled = V.on
            end
        )
        t.Feature["Random Xenon Color"] =
            menu.add_feature(
            "Random Xenon",
            "toggle",
            t.Parent["Random Colors"],
            function(V)
                aI({"Synced Colors", "Rainbow Xenon Color", "100 Black"})
                c["Random Xenon Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        vehicle.set_vehicle_headlight_color(bo, math.random(0, 12))
                        coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                    end
                    coroutine.yield(0)
                end
                c["Random Xenon Color"].Enabled = V.on
            end
        )
        t.Parent["Rainbow Colors"] = menu.add_feature("Rainbow Colors", "parent", t.Parent["Vehice Colors"], nil).id
        t.Feature["Rainbow Primary Color"] =
            menu.add_feature(
            "Rainbow Primary",
            "toggle",
            t.Parent["Rainbow Colors"],
            function(V)
                aI({"Synced Colors", "Random Primary Color", "100 Black"})
                c["Rainbow Primary Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 1, #X do
                            vehicle.set_vehicle_custom_primary_colour(bo, m.RGBToHex({X[j][1], X[j][2], X[j][3]}))
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Rainbow Primary Color"].Enabled = V.on
            end
        )
        t.Feature["Rainbow Secondary Color"] =
            menu.add_feature(
            "Rainbow Secondary",
            "toggle",
            t.Parent["Rainbow Colors"],
            function(V)
                aI({"Synced Colors", "Random Secondary Color", "100 Black"})
                c["Rainbow Secondary Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 1, #X do
                            vehicle.set_vehicle_custom_secondary_colour(bo, m.RGBToHex({X[j][1], X[j][2], X[j][3]}))
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Rainbow Secondary Color"].Enabled = V.on
            end
        )
        t.Feature["Rainbow Wheel Color"] =
            menu.add_feature(
            "Rainbow Wheel",
            "toggle",
            t.Parent["Rainbow Colors"],
            function(V)
                aI({"Synced Colors", "Random Wheel Color", "100 Black"})
                c["Rainbow Wheel Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 1, #X do
                            vehicle.set_vehicle_custom_wheel_colour(bo, m.RGBToHex({X[j][1], X[j][2], X[j][3]}))
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Rainbow Wheel Color"].Enabled = V.on
            end
        )
        t.Feature["Rainbow Pearlescent Color"] =
            menu.add_feature(
            "Rainbow Pearlescent",
            "toggle",
            t.Parent["Rainbow Colors"],
            function(V)
                aI({"Synced Colors", "Random Pearlescent Color", "100 Black"})
                c["Rainbow Pearlescent Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 1, #X do
                            vehicle.set_vehicle_custom_pearlescent_colour(bo, m.RGBToHex({X[j][1], X[j][2], X[j][3]}))
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Rainbow Pearlescent Color"].Enabled = V.on
            end
        )
        t.Feature["Rainbow Neon Color"] =
            menu.add_feature(
            "Rainbow Neon Lights",
            "toggle",
            t.Parent["Rainbow Colors"],
            function(V)
                aI({"Synced Colors", "Random Neon Color", "100 Black"})
                c["Rainbow Neon Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 1, #X do
                            vehicle.set_vehicle_neon_lights_color(bo, m.RGBToHex({X[j][1], X[j][2], X[j][3]}))
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Rainbow Neon Color"].Enabled = V.on
            end
        )
        t.Feature["Rainbow Smoke Color"] =
            menu.add_feature(
            "Rainbow Smoke",
            "toggle",
            t.Parent["Rainbow Colors"],
            function(V)
                aI({"Synced Colors", "Random Smoke Color", "100 Black"})
                c["Rainbow Smoke Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 1, #X do
                            local d3 = X[j]
                            vehicle.set_vehicle_tire_smoke_color(bo, d3[1], d3[2], d3[3])
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Rainbow Smoke Color"].Enabled = V.on
            end
        )
        t.Feature["Rainbow Xenon Color"] =
            menu.add_feature(
            "Rainbow Xenon",
            "toggle",
            t.Parent["Rainbow Colors"],
            function(V)
                aI({"Synced Colors", "Random Xenon Color", "100 Black"})
                c["Rainbow Xenon Color"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 0, 12 do
                            vehicle.set_vehicle_headlight_color(bo, j)
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Rainbow Xenon Color"].Enabled = V.on
            end
        )
        t.Feature["Synced Colors"] =
            menu.add_feature(
            "Synced Colors",
            "value_str",
            t.Parent["Vehice Colors"],
            function(V)
                aI(a4)
                aI(a3)
                aI({"100 Black"})
                c["Synced Colors"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    if V.value == 0 then
                        local bo = k.OwnVehicle()
                        if l.valid_vehicle(bo) then
                            l.color_veh(bo, {math.random(0, 255), math.random(0, 255), math.random(0, 255)})
                            coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                        end
                    end
                    if V.value == 1 then
                        local bo = k.OwnVehicle()
                        if l.valid_vehicle(bo) then
                            for j = 1, #X do
                                if bo ~= k.OwnVehicle() or V.value ~= 1 then
                                    break
                                end
                                if not V.on then
                                    c["Synced Colors"].Enabled = V.on
                                    return
                                end
                                local d3 = X[j]
                                l.color_veh(bo, {d3[1], d3[2], d3[3]}, j)
                                coroutine.yield(t.Feature["Vehicle Colors Speed"].value)
                            end
                        end
                    end
                    if V.value == 2 then
                        local bo = k.OwnVehicle()
                        if l.valid_vehicle(bo) then
                            local d4
                            d4 = math.floor((101 - t.Feature["Vehicle Colors Speed"].value / 25) / 2)
                            if d4 < 1 then
                                d4 = 1
                            end
                            for j = 0, 255, d4 do
                                if not V.on then
                                    c["Synced Colors"].Enabled = V.on
                                    return
                                end
                                l.color_veh(bo, {255, j, 0})
                            end
                            d4 = math.floor((101 - t.Feature["Vehicle Colors Speed"].value / 25) / 2)
                            if d4 < 1 then
                                d4 = 1
                            end
                            for j = 255, 0, -d4 do
                                if not V.on then
                                    c["Synced Colors"].Enabled = V.on
                                    return
                                end
                                l.color_veh(bo, {j, 255, 0})
                            end
                            d4 = math.floor((101 - t.Feature["Vehicle Colors Speed"].value / 25) / 2)
                            if d4 < 1 then
                                d4 = 1
                            end
                            for j = 0, 255, d4 do
                                if not V.on then
                                    c["Synced Colors"].Enabled = V.on
                                    return
                                end
                                l.color_veh(bo, {0, 255, j})
                            end
                            d4 = math.floor((101 - t.Feature["Vehicle Colors Speed"].value / 25) / 2)
                            if d4 < 1 then
                                d4 = 1
                            end
                            for j = 255, 0, -d4 do
                                if not V.on then
                                    c["Synced Colors"].Enabled = V.on
                                    return
                                end
                                l.color_veh(bo, {0, j, 255})
                            end
                            d4 = math.floor((101 - t.Feature["Vehicle Colors Speed"].value / 25) / 2)
                            if d4 < 1 then
                                d4 = 1
                            end
                            for j = 0, 255, d4 do
                                if not V.on then
                                    c["Synced Colors"].Enabled = V.on
                                    return
                                end
                                l.color_veh(bo, {j, 0, 255})
                            end
                            d4 = math.floor((101 - t.Feature["Vehicle Colors Speed"].value / 25) / 2)
                            if d4 < 1 then
                                d4 = 1
                            end
                            for j = 255, 0, -d4 do
                                if not V.on then
                                    c["Synced Colors"].Enabled = V.on
                                    return
                                end
                                l.color_veh(bo, {255, 0, j})
                            end
                        end
                    end
                    c["Synced Colors"].Value = V.value
                    coroutine.yield(0)
                end
                c["Synced Colors"].Enabled = V.on
            end
        )
        t.Feature["Synced Colors"]:set_str_data({"Random", "Rainbow", "Smooth Rainbow"})
        t.Feature["100 Black Single"] =
            menu.add_feature(
            "100% Black",
            "action",
            t.Parent["Vehice Colors"],
            function()
                local bo = k.OwnVehicle()
                if l.valid_vehicle(bo) then
                    l.color_veh(bo, {0, 0, 0}, 0)
                    vehicle.set_vehicle_tire_smoke_color(bo, 1, 1, 1)
                else
                    z("No valid vehicle found.", "Error")
                end
            end
        )
        t.Feature["100 Black"] =
            menu.add_feature(
            "100% Black",
            "toggle",
            t.Parent["Vehice Colors"],
            function(V)
                c["100 Black"] = {Enabled = V.on}
                aI(a4)
                aI(a3)
                aI({"Synced Colors"})
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.color_veh(bo, {0, 0, 0}, 0)
                        vehicle.set_vehicle_tire_smoke_color(bo, 1, 1, 1)
                    end
                    coroutine.yield(0)
                end
                c["100 Black"].Enabled = V.on
            end
        )
        t.Parent["Explosive Horn Beam"] =
            menu.add_feature("Explosive Horn Beam", "parent", t.Parent["local_vehicle"], nil).id
        t.Feature["Enable Horn Beam"] =
            menu.add_feature(
            "Enable Horn Beam",
            "toggle",
            t.Parent["Explosive Horn Beam"],
            function(V)
                c["Enable Horn Beam"] = {Enabled = V.on}
                while V.on do
                    local d5 = player.player_id()
                    if k.SCID(t.Feature["Horn Beam For Others"].value) ~= -1 then
                        d5 = t.Feature["Horn Beam For Others"].value
                    end
                    local bo, aV, d6, d7, d8
                    local cp = v3()
                    local d9, da, db, dc, dd, de
                    if player.is_player_pressing_horn(d5) then
                        bo = k.PlayerVehicle(d5)
                        for j = 0, 5 do
                            aV = entity.get_entity_coords(bo)
                            coroutine.yield(5)
                            if j > 0 then
                                d6 = entity.get_entity_coords(bo)
                                cp.x = d6.x - aV.x
                                cp.y = d6.y - aV.y
                                cp.z = d6.z - aV.z
                                if cp.x ~= 0 and cp.y ~= 0 and cp.z ~= 0 then
                                    d7 = 1 / (cp.x * cp.x + cp.y * cp.y + cp.z * cp.z) ^ 0.5
                                    d8 =
                                        math.random(
                                        t.Feature["Horn Beam Min Range"].value,
                                        t.Feature["Horn Beam Max Range"].value
                                    )
                                    d6.x = d6.x + d8 * d7 * cp.x
                                    d6.y = d6.y + d8 * d7 * cp.y
                                    d6.z = d6.z + d8 * d7 * cp.z
                                    d9 = math.floor(d6.x - t.Feature["Horn Beam Radius"].value)
                                    da = math.floor(d6.x + t.Feature["Horn Beam Radius"].value)
                                    db = math.floor(d6.y - t.Feature["Horn Beam Radius"].value)
                                    dc = math.floor(d6.y + t.Feature["Horn Beam Radius"].value)
                                    dd = math.floor(d6.z - t.Feature["Horn Beam Radius"].value)
                                    de = math.floor(d6.z + t.Feature["Horn Beam Radius"].value)
                                    d6.x = math.random(d9, da)
                                    d6.y = math.random(db, dc)
                                    d6.z = math.random(dd, de)
                                    fire.add_explosion(d6, t.Feature["Horn Beam Type"].value, true, false, 0.1, 0)
                                    d6.x = math.random(d9, da)
                                    d6.y = math.random(db, dc)
                                    d6.z = math.random(dd, de)
                                    fire.add_explosion(d6, t.Feature["Horn Beam Type 2"].value, true, false, 0.1, 0)
                                end
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                c["Enable Horn Beam"].Enabled = V.on
            end
        )
        t.Feature["Horn Beam Type"] =
            menu.add_feature(
            "Select Explosion",
            "action_value_i",
            t.Parent["Explosive Horn Beam"],
            function(V)
                c["Horn Beam Type"] = {Value = V.value}
                z("Beam Explosion Type 1: " .. V.value, "Success")
            end
        )
        t.Feature["Horn Beam Type"].max = 74
        t.Feature["Horn Beam Type"].min = 0
        t.Feature["Horn Beam Type 2"] =
            menu.add_feature(
            "Select Explosion 2",
            "action_value_i",
            t.Parent["Explosive Horn Beam"],
            function(V)
                c["Horn Beam Type 2"] = {Value = V.value}
                z("Beam Explosion Type 2: " .. V.value, "Success")
            end
        )
        t.Feature["Horn Beam Type 2"].max = 74
        t.Feature["Horn Beam Type 2"].min = 0
        t.Feature["Horn Beam Radius"] =
            menu.add_feature(
            "Select Scattering",
            "action_value_i",
            t.Parent["Explosive Horn Beam"],
            function(V)
                c["Horn Beam Radius"] = V.value
                z("Beam Radius: " .. V.value, "Success")
            end
        )
        t.Feature["Horn Beam Radius"].max = 10
        t.Feature["Horn Beam Radius"].min = 1
        t.Feature["Horn Beam Min Range"] =
            menu.add_feature(
            "Select Min Range",
            "action_value_i",
            t.Parent["Explosive Horn Beam"],
            function(V)
                c["Horn Beam Min Range"] = {Value = V.value}
                z("Beam Min Range: " .. V.value, "Success")
            end
        )
        t.Feature["Horn Beam Min Range"].max = 100
        t.Feature["Horn Beam Min Range"].min = 10
        t.Feature["Horn Beam Min Range"].mod = 5
        t.Feature["Horn Beam Max Range"] =
            menu.add_feature(
            "Select Max Range",
            "action_value_i",
            t.Parent["Explosive Horn Beam"],
            function(V)
                c["Horn Beam Max Range"] = {Value = V.value}
                z("Beam Max Range: " .. V.value, "Success")
            end
        )
        t.Feature["Horn Beam Max Range"].max = 300
        t.Feature["Horn Beam Max Range"].min = 100
        t.Feature["Horn Beam Max Range"].mod = 5
        t.Feature["Horn Beam For Others"] =
            menu.add_feature(
            "Enable Horn for Player",
            "action_value_i",
            t.Parent["Explosive Horn Beam"],
            function(V)
                if k.SCID(V.value) ~= -1 then
                    z("Selected Player: " .. k.Name(V.value), "Success")
                else
                    z("Invalid Player.", "Error")
                end
            end
        )
        t.Feature["Horn Beam For Others"].max = 31
        t.Feature["Horn Beam For Others"].min = -1
        t.Feature["Horn Beam For Others"].value = -1
        t.Parent["License Plates"] = menu.add_feature("License Plates", "parent", t.Parent["local_vehicle"], nil).id
        t.Feature["2Take1 License Plate"] =
            menu.add_feature(
            "2Take1 License Plate",
            "toggle",
            t.Parent["License Plates"],
            function(V)
                aI({"Force Plate Text", "License Speedometer"})
                local df = {
                    {
                        "       2",
                        "      2T",
                        "     2TA",
                        "    2TAK",
                        "   2TAKE",
                        "  2TAKE1",
                        " 2TAKE1 ",
                        "2TAKE1 M",
                        "TAKE1 ME",
                        "AKE1 MEN",
                        "KE1 MENU",
                        "E1 MENU ",
                        "1 MENU  ",
                        " MENU   ",
                        "MENU    ",
                        "ENU     ",
                        "NU      ",
                        "U      ",
                        " ",
                        " 2Take1 ",
                        " ",
                        " 2Take1 ",
                        " ",
                        " 2Take1 ",
                        " ",
                        " 2Take1 ",
                        " ",
                        " 2Take1 ",
                        " "
                    }
                }
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        for j = 1, #df[1] do
                            if V.on and bo == k.OwnVehicle() then
                                vehicle.set_vehicle_number_plate_text(bo, df[1][j])
                                coroutine.yield(200)
                            else
                                break
                            end
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Force Plate Text"] =
            menu.add_feature(
            "Force License Plate Text",
            "toggle",
            t.Parent["License Plates"],
            function(V)
                aI({"2Take1 License Plate", "License Speedometer"})
                local bC = k.Input("Enter License Plate Text", 8, 0)
                if not bC then
                    z("Input canceled.", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        vehicle.set_vehicle_number_plate_text(bo, bC)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["License Speedometer"] =
            menu.add_feature(
            "License Plate Speedometer",
            "value_str",
            t.Parent["License Plates"],
            function(V)
                aI({"Force Plate Text", "2Take1 License Plate"})
                c["License Speedometer"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    local dg
                    local dh
                    if V.value == 0 then
                        dg = 3.6
                        dh = "KMH"
                    end
                    if V.value == 1 then
                        dg = 2.23694
                        dh = "MPH"
                    end
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        local di = entity.get_entity_speed(bo) * dg
                        if di < 10 and di > 0.01 then
                            di = string.format("%.2f", di)
                        elseif di >= 10 and di < 100 then
                            di = string.format("%.1f", di)
                        elseif di < 0.01 and V.value == 7 then
                            di = string.format("%.5f", di)
                        else
                            di = math.floor(di)
                        end
                        l.request_ctrl(bo)
                        vehicle.set_vehicle_number_plate_text(bo, tostring(di) .. dh)
                    end
                    c["License Speedometer"].Value = V.value
                    coroutine.yield(0)
                end
                c["License Speedometer"].Enabled = V.on
            end
        )
        t.Feature["License Speedometer"]:set_str_data({"KMH", "MPH"})
        t.Parent["AI Driving"] = menu.add_feature("AI Driving", "parent", t.Parent["local_vehicle"], nil).id
        t.Feature["AI Driving Style"] =
            menu.add_feature("Driving Style", "autoaction_value_str", t.Parent["AI Driving"])
        t.Feature["AI Driving Style"]:set_str_data(
            {"Normal", "Avoid Traffic", "Rushed", "Extremly Rushed", "Backwards"}
        )
        t.Feature["AI Driving Start"] =
            menu.add_feature(
            "Enable AI Driving",
            "value_str",
            t.Parent["AI Driving"],
            function(V)
                local dj = {786859, 572, 786469, 786980, 263595}
                local bo = 0
                local dk
                while V.on do
                    if vehicle.is_vehicle_stuck_on_roof(bo) then
                        vehicle.set_vehicle_on_ground_properly(bo)
                    end
                    if k.OwnVehicle() ~= bo then
                        dk = false
                    end
                    bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        if dk then
                            goto ca
                        end
                        if V.value == 0 then
                            ai.task_vehicle_drive_wander(
                                k.OwnPed(),
                                bo,
                                100,
                                dj[t.Feature["AI Driving Style"].value + 1]
                            )
                            dk = true
                        else
                            local dl = ui.get_waypoint_coord()
                            if dl.x == 16000 then
                                goto ca
                            end
                            while V.on and V.value == 1 and dl.x ~= 16000 do
                                dl = ui.get_waypoint_coord()
                                local c_ = entity.get_entity_model_hash(bo)
                                ai.task_vehicle_drive_to_coord(
                                    k.OwnPed(),
                                    bo,
                                    v3(dl.x, dl.y, 0),
                                    100,
                                    10,
                                    c_,
                                    dj[t.Feature["AI Driving Style"].value + 1],
                                    1,
                                    1
                                )
                                coroutine.yield(500)
                            end
                            local bo = k.OwnVehicle()
                            ped.clear_ped_tasks_immediately(k.OwnPed())
                            ped.set_ped_into_vehicle(k.OwnPed(), bo, -1)
                        end
                    end
                    ::ca::
                    coroutine.yield(2500)
                end
                local bo = k.OwnVehicle()
                ped.clear_ped_tasks_immediately(k.OwnPed())
                ped.set_ped_into_vehicle(k.OwnPed(), bo, -1)
            end
        )
        t.Feature["AI Driving Start"]:set_str_data({"Wander Around", "To Waypoint"})
        t.Feature["AI Driving Stop"] =
            menu.add_feature(
            "Force Stop",
            "action",
            t.Parent["AI Driving"],
            function(V)
                local bo = k.OwnVehicle()
                if l.valid_vehicle(bo) then
                    aI({"AI Driving Start"})
                    ped.clear_ped_tasks_immediately(k.OwnPed())
                    ped.set_ped_into_vehicle(k.OwnPed(), bo, -1)
                end
            end
        )
        t.Parent["Vehicle Boosts"] = menu.add_feature("Boosts", "parent", t.Parent["local_vehicle"], nil).id
        t.Feature["Infinite F1 Boost"] =
            menu.add_feature(
            "Infinite F1 Boost",
            "toggle",
            t.Parent["Vehicle Boosts"],
            function(V)
                c["Infinite F1 Boost"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        if
                            entity.get_entity_model_hash(bo) == 0x1446590A or
                                entity.get_entity_model_hash(bo) == 0x8B213907 or
                                entity.get_entity_model_hash(bo) == 0x58F77553 or
                                entity.get_entity_model_hash(bo) == 0x4669D038
                         then
                            local di = entity.get_entity_speed(bo)
                            l.request_ctrl(bo)
                            vehicle.set_vehicle_fixed(bo)
                            if di > 75.0 then
                                vehicle.set_vehicle_forward_speed(bo, di)
                            end
                        end
                    end
                    coroutine.yield(2500)
                end
                c["Infinite F1 Boost"].Enabled = V.on
            end
        )
        t.Feature["Instant Horn Boost"] =
            menu.add_feature(
            "Instant Horn Boost",
            "slider",
            t.Parent["Vehicle Boosts"],
            function(V)
                aI({"Extreme Horn Boost"})
                c["Instant Horn Boost"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) and player.is_player_pressing_horn(player.player_id()) then
                        local di = entity.get_entity_speed(bo)
                        if di < V.value then
                            l.request_ctrl(bo)
                            vehicle.set_vehicle_forward_speed(bo, V.value)
                        end
                    end
                    c["Instant Horn Boost"].Value = V.value
                    coroutine.yield(0)
                end
                c["Instant Horn Boost"].Enabled = V.on
            end
        )
        t.Feature["Instant Horn Boost"].max = 150
        t.Feature["Instant Horn Boost"].min = 25
        t.Feature["Instant Horn Boost"].mod = 25
        t.Feature["Extreme Horn Boost"] =
            menu.add_feature(
            "Extreme Horn Boost",
            "slider",
            t.Parent["Vehicle Boosts"],
            function(V)
                aI({"Instant Horn Boost"})
                c["Extreme Horn Boost"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) and player.is_player_pressing_horn(player.player_id()) then
                        l.request_ctrl(bo)
                        entity.set_entity_max_speed(bo, V.value)
                        vehicle.set_vehicle_forward_speed(bo, V.value)
                    end
                    c["Extreme Horn Boost"].Value = V.value
                    coroutine.yield(0)
                end
                c["Extreme Horn Boost"].Enabled = V.on
            end
        )
        t.Feature["Extreme Horn Boost"].max = 5000
        t.Feature["Extreme Horn Boost"].min = 250
        t.Feature["Extreme Horn Boost"].mod = 250
        t.Feature["Upgrade Vehicle"] =
            menu.add_feature(
            "Upgrade Vehicle",
            "action_value_str",
            t.Parent["local_vehicle"],
            function(V)
                local bo = k.OwnVehicle()
                if not l.valid_vehicle(bo) then
                    z("No valid vehicle found.", "Error", "")
                    return
                end
                if V.value == 0 then
                    l.MaxVehicle(bo)
                else
                    l.MaxVehicle(bo, 3)
                end
            end
        )
        t.Feature["Upgrade Vehicle"]:set_str_data({"Full", "Random"})
        t.Feature["Set Custom Tires"] =
            menu.add_feature(
            "Set Custom Tires",
            "action_value_str",
            t.Parent["local_vehicle"],
            function(V)
                local bo = k.OwnVehicle()
                if not l.valid_vehicle(bo) then
                    z("No valid vehicle found.", "Error", "")
                    return
                end
                local dm = vehicle.get_vehicle_mod(bo, 23)
                if dm == -1 then
                    z("This doesnt work on default tires", "Error", "")
                    return
                end
                local dn = vehicle.get_vehicle_wheel_type(bo)
                if dn > 7 then
                    z("This doesnt work on your current wheel type", "Error", "")
                    return
                end
                local dp
                if V.value == 0 then
                    dp = true
                else
                    dp = false
                end
                vehicle.set_vehicle_mod_kit_type(bo, 0)
                vehicle.set_vehicle_mod(bo, 23, dm, dp)
            end
        )
        t.Feature["Set Custom Tires"]:set_str_data({"Add", "Remove"})
        t.Feature["Vehicle Parachute"] =
            menu.add_feature(
            "Parachute on all Cars",
            "toggle",
            t.Parent["local_vehicle"],
            function(V)
                local ax
                local bo
                while V.on do
                    bo = k.OwnVehicle()
                    if not l.valid_vehicle(bo) then
                        goto ca
                    end
                    ax = entity.get_entity_model_hash(bo)
                    if not streaming.is_model_a_car(ax) then
                        goto ca
                    end
                    if not streaming.does_vehicle_model_have_parachute(ax) then
                        streaming.set_vehicle_model_has_parachute(ax, true)
                    end
                    ::ca::
                    coroutine.yield(500)
                end
                if l.valid_vehicle(bo) then
                    while not vehicle.is_vehicle_on_all_wheels(bo) do
                        coroutine.yield(0)
                    end
                    streaming.set_vehicle_model_has_parachute(entity.get_entity_model_hash(bo), false)
                end
            end
        )
        t.Feature["Vehicle Godmode v2"] =
            menu.add_feature(
            "Vehicle Godmode v2",
            "toggle",
            t.Parent["local_vehicle"],
            function(V)
                c["Vehicle Godmode v2"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        native.call(0xFAEE099C6F890BB8, bo, 1, 1, 1, 1, 1, 1, 1, 1)
                    end
                    c["Vehicle Godmode v2"].Enabled = V.on
                    coroutine.yield(500)
                end
                local bo = k.OwnVehicle()
                if l.valid_vehicle(bo) then
                    native.call(0xFAEE099C6F890BB8, bo, 0, 0, 0, 0, 0, 0, 1, 0)
                end
                c["Vehicle Godmode v2"].Enabled = V.on
            end
        )
        t.Feature["Auto Repair Vehicle"] =
            menu.add_feature(
            "Auto Repair Vehicle",
            "toggle",
            t.Parent["local_vehicle"],
            function(V)
                c["Auto Repair Vehicle"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    if l.valid_vehicle(bo) then
                        l.request_ctrl(bo)
                        l.RepairVehicle(bo)
                    end
                    coroutine.yield(2000)
                end
                c["Auto Repair Vehicle"].Enabled = V.on
            end
        )
        t.Feature["Weird Entity"] =
            menu.add_feature(
            "Weird Entity",
            "toggle",
            t.Parent["local_vehicle"],
            function(V)
                c["Weird Entity"] = {Enabled = V.on}
                while V.on do
                    local bo = k.OwnVehicle()
                    local aU = k.OwnPed()
                    if l.valid_vehicle(bo) and not ah then
                        local ax = entity.get_entity_model_hash(bo)
                        ah = n.Vehicle(ax, k.OwnCoords())
                        l.SetVehicleMods(ah, l.GetVehicleMods(bo))
                        aU = bo
                    elseif not ah then
                        ah = ped.clone_ped(k.OwnPed())
                    end
                    entity.set_entity_visible(aU, false)
                    entity.set_entity_collision(ah, false, false, false)
                    entity.set_entity_rotation(
                        ah,
                        v3(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180))
                    )
                    l.set_coords(ah, k.OwnCoords())
                    coroutine.yield(0)
                end
                l.clear({ah})
                ah = nil
                entity.set_entity_visible(k.OwnPed(), true)
                entity.set_entity_visible(k.OwnVehicle(), true)
                c["Weird Entity"].Enabled = V.on
            end
        )
        t.Feature["Instantly Enter Vehicles"] =
            menu.add_feature(
            "Warp into Vehicles",
            "toggle",
            t.Parent["local_vehicle"],
            function(V)
                c["Instantly Enter Vehicles"] = {Enabled = V.on}
                while V.on do
                    if controls.is_control_pressed(2, 75) and k.OwnVehicle() == 0 then
                        local bo
                        local dq = 5
                        local cx = k.OwnCoords()
                        local dr = vehicle.get_all_vehicles()
                        for j = 1, #dr do
                            local ds = entity.get_entity_coords(dr[j])
                            local cy = cx:magnitude(ds)
                            if cy < dq then
                                dq = cy
                                bo = dr[j]
                            end
                        end
                        if bo then
                            local dt = vehicle.get_ped_in_vehicle_seat(bo, -1)
                            if dt ~= 0 then
                                ped.clear_ped_tasks_immediately(dt)
                            end
                            ped.set_ped_into_vehicle(k.OwnPed(), bo, -1)
                        end
                    end
                    c["Instantly Enter Vehicles"].Enabled = V.on
                    coroutine.yield(0)
                end
                c["Instantly Enter Vehicles"].Enabled = V.on
            end
        )
        t.Feature["Swap Vehicle Seats"] =
            menu.add_feature(
            "Swap Vehicle Seat",
            "action_value_i",
            t.Parent["local_vehicle"],
            function(V)
                local bo = k.OwnVehicle()
                if bo ~= 0 then
                    ped.set_ped_into_vehicle(k.OwnPed(), bo, t.Feature["Swap Vehicle Seats"].value)
                end
            end
        )
        t.Feature["Swap Vehicle Seats"].min = -1
        t.Feature["Swap Vehicle Seats"].value = -1
        t.Feature["Swap Vehicle Seats"].max = 15
        t.Feature["Delete Current Vehicle"] =
            menu.add_feature(
            "Delete Current Vehicle",
            "action",
            t.Parent["local_vehicle"],
            function()
                local bo = k.OwnVehicle()
                if l.valid_vehicle(bo) then
                    l.request_ctrl(bo)
                    entity.delete_entity(bo)
                else
                    z("No vehicle found.", "Error")
                end
            end
        )
        t.Parent["Custom Vehicles"] = menu.add_feature("Custom Vehicles", "parent", t.Parent["local_vehicle"], nil).id
        t.Parent["Moveable Robot"] = menu.add_feature("Moveable Robot", "parent", t.Parent["Custom Vehicles"], nil).id
        t.Feature["Enable Robot"] =
            menu.add_feature(
            "Enable Robot",
            "toggle",
            t.Parent["Moveable Robot"],
            function(V)
                if V.on then
                    if not am["tampa"] then
                        menu.set_menu_can_navigate(false)
                        local du = true
                        local bo = k.OwnVehicle()
                        if bo ~= 0 then
                            if 3084515313 == entity.get_entity_model_hash(bo) then
                                am["tampa"] = bo
                                du = false
                            end
                        end
                        if du then
                            am["tampa"] = n.Vehicle(3084515313, k.OwnCoords(), k.OwnHeading())
                            decorator.decor_set_int(am["tampa"], "MPBitset", 1 << 10)
                            entity.set_entity_god_mode(am["tampa"], true)
                            l.MaxVehicle(bo)
                            if t.Feature["Spawn in Custom Vehicle"].on then
                                ped.set_ped_into_vehicle(k.OwnPed(), am["tampa"], -1)
                            end
                            vehicle.set_vehicle_mod_kit_type(am["tampa"], 0)
                            for j = 0, 18 do
                                local dv = vehicle.get_num_vehicle_mods(am["tampa"], j) - 1
                                vehicle.set_vehicle_mod(am["tampa"], j, dv, true)
                                vehicle.toggle_vehicle_mod(am["tampa"], dv, true)
                            end
                            vehicle.set_vehicle_bulletproof_tires(am["tampa"], true)
                            vehicle.set_vehicle_window_tint(am["tampa"], 1)
                            vehicle.set_vehicle_number_plate_index(bo, 1)
                            vehicle.set_vehicle_number_plate_text(am["tampa"], "2Take1")
                        end
                    end
                    if am["ppdump"] == nil then
                        am["ppdump"] = n.Vehicle(0x810369E2)
                        entity.set_entity_god_mode(am["ppdump"], true)
                        entity.attach_entity_to_entity(
                            am["ppdump"],
                            am["tampa"],
                            0,
                            v3(0, 0, 12.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["llbone"] == nil then
                        am["llbone"] = n.Object(1803116220)
                        entity.attach_entity_to_entity(
                            am["llbone"],
                            am["tampa"],
                            0,
                            v3(-4.25, 0, 12.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["rlbone"] == nil then
                        am["rlbone"] = n.Object(1803116220)
                        entity.attach_entity_to_entity(
                            am["rlbone"],
                            am["tampa"],
                            0,
                            v3(4.25, 0, 12.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["lltrain"] == nil then
                        am["lltrain"] = n.Vehicle(1030400667)
                        entity.set_entity_god_mode(am["lltrain"], true)
                        entity.attach_entity_to_entity(
                            am["lltrain"],
                            am["llbone"],
                            0,
                            v3(0, 0, -5),
                            v3(90),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["lfoot"] == nil then
                        am["lfoot"] = n.Vehicle(782665360)
                        entity.set_entity_god_mode(am["lfoot"], true)
                        entity.attach_entity_to_entity(
                            am["lfoot"],
                            am["llbone"],
                            0,
                            v3(0, 2, -12.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["rltrain"] == nil then
                        am["rltrain"] = n.Vehicle(1030400667)
                        entity.set_entity_god_mode(am["rltrain"], true)
                        entity.attach_entity_to_entity(
                            am["rltrain"],
                            am["rlbone"],
                            0,
                            v3(0, 0, -5),
                            v3(90),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["rfoot"] == nil then
                        am["rfoot"] = n.Vehicle(782665360)
                        entity.set_entity_god_mode(am["rfoot"], true)
                        entity.attach_entity_to_entity(
                            am["rfoot"],
                            am["rlbone"],
                            0,
                            v3(0, 2, -12.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["body"] == nil then
                        am["body"] = n.Vehicle(1030400667)
                        entity.set_entity_god_mode(am["body"], true)
                        entity.attach_entity_to_entity(
                            am["body"],
                            am["tampa"],
                            0,
                            v3(0, 0, 22.5),
                            v3(90),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["shoulder"] == nil then
                        am["shoulder"] = n.Vehicle(0x810369E2)
                        entity.set_entity_god_mode(am["shoulder"], true)
                        entity.attach_entity_to_entity(
                            am["shoulder"],
                            am["tampa"],
                            0,
                            v3(0, 0, 27.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["lheadbone"] == nil then
                        am["lheadbone"] = n.Object(1803116220)
                        entity.attach_entity_to_entity(
                            am["lheadbone"],
                            am["tampa"],
                            0,
                            v3(-3.25, 0, 27.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["rheadbone"] == nil then
                        am["rheadbone"] = n.Object(1803116220)
                        entity.attach_entity_to_entity(
                            am["rheadbone"],
                            am["tampa"],
                            0,
                            v3(3.25, 0, 27.5),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["lheadtrain"] == nil then
                        am["lheadtrain"] = n.Vehicle(1030400667)
                        entity.set_entity_god_mode(am["lheadtrain"], true)
                        entity.attach_entity_to_entity(
                            am["lheadtrain"],
                            am["lheadbone"],
                            0,
                            v3(-3, 4, -5),
                            v3(325, 0, 45),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["lhand"] == nil then
                        am["lhand"] = n.Vehicle(782665360)
                        entity.set_entity_god_mode(am["lhand"], true)
                        entity.attach_entity_to_entity(
                            am["lhand"],
                            am["lheadtrain"],
                            0,
                            v3(0, 7.5, 0),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["rheadtrain"] == nil then
                        am["rheadtrain"] = n.Vehicle(1030400667)
                        entity.set_entity_god_mode(am["rheadtrain"], true)
                        entity.attach_entity_to_entity(
                            am["rheadtrain"],
                            am["rheadbone"],
                            0,
                            v3(3, 4, -5),
                            v3(325, 0, 315),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["rhand"] == nil then
                        am["rhand"] = n.Vehicle(782665360)
                        entity.set_entity_god_mode(am["rhand"], true)
                        entity.attach_entity_to_entity(
                            am["rhand"],
                            am["rheadtrain"],
                            0,
                            v3(0, 7.5, 0),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["head"] == nil then
                        am["head"] = n.Object(-543669801)
                        entity.attach_entity_to_entity(
                            am["head"],
                            am["tampa"],
                            0,
                            v3(0, 0, 35),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    menu.set_menu_can_navigate(true)
                    return HANDLER_CONTINUE
                end
                if not V.on then
                    for j in pairs(am) do
                        l.clear({am[j]})
                        am[j] = nil
                    end
                    if #Z["robot_weapon_left"] ~= 0 then
                        l.clear(Z["robot_weapon_left"])
                        Z["robot_weapon_left"] = {}
                    end
                    if #Z["robot_weapon_right"] ~= 0 then
                        l.clear(Z["robot_weapon_right"])
                        Z["robot_weapon_right"] = {}
                    end
                end
            end
        )
        t.Feature["Controllable Blasts"] =
            menu.add_feature(
            "Controllable Blasts",
            "toggle",
            t.Parent["Moveable Robot"],
            function(V)
                if V.on then
                    if not t.Feature["Enable Robot"].on then
                        coroutine.yield(2500)
                    end
                    local cA = gameplay.get_hash_key("weapon_airstrike_rocket")
                    local aV = k.OwnCoords()
                    local cn = cam.get_gameplay_cam_rot()
                    cn:transformRotToDir()
                    cn = cn * 1000
                    aV = aV + cn
                    local cB, cC, cD, ax, aU =
                        worldprobe.raycast(l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 2) + v3(0, 0, 4), aV, -1, 0)
                    while not cB do
                        aV = k.OwnCoords()
                        cn = cam.get_gameplay_cam_rot()
                        cn:transformRotToDir()
                        cn = cn * 1000
                        aV = aV + cn
                        cB, cC, cD, ax, aU =
                            worldprobe.raycast(
                            l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 2) + v3(0, 0, 4),
                            aV,
                            -1,
                            0
                        )
                        coroutine.yield(0)
                    end
                    if ped.is_ped_shooting(k.OwnPed()) and k.OwnVehicle() == am["tampa"] then
                        if t.Feature["Robot Equip Weapons"].on then
                            local dw = Z["robot_weapon_left"][1]
                            local dx = entity.get_entity_heading(dw)
                            local dy = l.OffsetCoords(entity.get_entity_coords(dw), dx, 12) + v3(0, 0, 3)
                            gameplay.shoot_single_bullet_between_coords(
                                dy,
                                cC,
                                1000,
                                cA,
                                k.OwnPed(),
                                true,
                                false,
                                50000
                            )
                            coroutine.yield(100)
                            local dz = Z["robot_weapon_right"][1]
                            local dA = entity.get_entity_heading(dz)
                            local dB = l.OffsetCoords(entity.get_entity_coords(dz), dA, 12) + v3(0, 0, 3)
                            gameplay.shoot_single_bullet_between_coords(
                                dB,
                                cC,
                                1000,
                                cA,
                                k.OwnPed(),
                                true,
                                false,
                                50000
                            )
                        else
                            local cE = l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 8) + v3(0, 0, 15)
                            gameplay.shoot_single_bullet_between_coords(
                                cE,
                                cC,
                                1000,
                                cA,
                                k.OwnPed(),
                                true,
                                false,
                                10000
                            )
                        end
                    end
                end
                c["Controllable Blasts"] = {Enabled = V.on}
                return HANDLER_CONTINUE
            end
        )
        t.Feature["Moveable Legs"] =
            menu.add_feature(
            "Moveable Legs",
            "toggle",
            t.Parent["Moveable Robot"],
            function(V)
                c["Moveable Legs"] = {Enabled = V.on}
                if V.on then
                    if am["llbone"] and am["rlbone"] and am["tampa"] then
                        local di
                        local a_ = am["llbone"]
                        local b0 = am["rlbone"]
                        local b1 = am["tampa"]
                        local b2 = v3(-4.25, 0, 12.5)
                        local b3 = v3(4.25, 0, 12.5)
                        for j = 0, 50 do
                            if am["tampa"] then
                                di = entity.get_entity_speed(am["tampa"])
                                if not V.on or di < 2.5 then
                                    aZ()
                                    return HANDLER_CONTINUE
                                end
                                l.request_ctrl(a_)
                                l.request_ctrl(b0)
                                l.request_ctrl(b1)
                                entity.attach_entity_to_entity(
                                    a_,
                                    b1,
                                    0,
                                    b2,
                                    v3(j, 0, 0),
                                    true,
                                    t.Feature["Robot Collision"].on,
                                    false,
                                    2,
                                    true
                                )
                                entity.attach_entity_to_entity(
                                    b0,
                                    b1,
                                    0,
                                    b3,
                                    v3(360 - j, 0, 0),
                                    true,
                                    t.Feature["Robot Collision"].on,
                                    false,
                                    2,
                                    true
                                )
                                local dC = math.floor(51 - di / 1)
                                if dC < 1 then
                                    dC = 0
                                end
                                coroutine.yield(dC)
                            end
                        end
                        for j = 50, -50, -1 do
                            if am["tampa"] then
                                di = entity.get_entity_speed(am["tampa"])
                                if not V.on or di < 2.5 then
                                    aZ()
                                    return HANDLER_CONTINUE
                                end
                                l.request_ctrl(a_)
                                l.request_ctrl(b0)
                                l.request_ctrl(b1)
                                entity.attach_entity_to_entity(
                                    a_,
                                    b1,
                                    0,
                                    b2,
                                    v3(j, 0, 0),
                                    true,
                                    t.Feature["Robot Collision"].on,
                                    false,
                                    2,
                                    true
                                )
                                entity.attach_entity_to_entity(
                                    b0,
                                    b1,
                                    0,
                                    b3,
                                    v3(360 - j, 0, 0),
                                    true,
                                    t.Feature["Robot Collision"].on,
                                    false,
                                    2,
                                    true
                                )
                                local dC = math.floor(51 - di / 1)
                                if dC < 1 then
                                    dC = 0
                                end
                                coroutine.yield(dC)
                            end
                        end
                        for j = -50, 0 do
                            if am["tampa"] then
                                di = entity.get_entity_speed(am["tampa"])
                                if not V.on or di < 2.5 then
                                    aZ()
                                    return HANDLER_CONTINUE
                                end
                                l.request_ctrl(a_)
                                l.request_ctrl(b0)
                                l.request_ctrl(b1)
                                entity.attach_entity_to_entity(
                                    a_,
                                    b1,
                                    0,
                                    b2,
                                    v3(j, 0, 0),
                                    true,
                                    t.Feature["Robot Collision"].on,
                                    false,
                                    2,
                                    true
                                )
                                entity.attach_entity_to_entity(
                                    b0,
                                    b1,
                                    0,
                                    b3,
                                    v3(360 - j, 0, 0),
                                    true,
                                    t.Feature["Robot Collision"].on,
                                    false,
                                    2,
                                    true
                                )
                                local dC = math.floor(51 - di / 1)
                                if dC < 1 then
                                    dC = 0
                                end
                                coroutine.yield(dC)
                            end
                        end
                    end
                    return HANDLER_CONTINUE
                end
                if not V.on then
                    aZ()
                end
            end
        )
        t.Feature["Robot Collision"] =
            menu.add_feature(
            "Collision",
            "toggle",
            t.Parent["Moveable Robot"],
            function(V)
                c["Robot Collision"] = {Enabled = V.on}
                if k.OwnVehicle() == am["tampa"] then
                    z("Re-enable Robot to take effect of collision!", "Neutral")
                end
            end
        )
        t.Feature["Rocket Propulsion"] =
            menu.add_feature(
            "Rocket Propulsion (Visual)",
            "toggle",
            t.Parent["Moveable Robot"],
            function(V)
                if V.on and am["body"] then
                    if am["spinning_1"] == nil then
                        am["spinning_1"] = n.Vehicle(0xFB133A17, k.OwnCoords())
                        entity.set_entity_god_mode(am["spinning_1"], true)
                        entity.set_entity_visible(am["spinning_1"], false)
                        entity.attach_entity_to_entity(
                            am["spinning_1"],
                            am["body"],
                            0,
                            v3(0, -5, 0),
                            v3(-180, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    vehicle.set_heli_blades_speed(am["spinning_1"], 100)
                    if am["spinning_middle"] == nil then
                        am["spinning_middle"] = n.Object(94602826)
                        entity.set_entity_god_mode(am["spinning_middle"], true)
                        entity.attach_entity_to_entity(
                            am["spinning_middle"],
                            am["spinning_1"],
                            0,
                            v3(0, 0, 0),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["spinning_middle2"] == nil then
                        am["spinning_middle2"] = n.Object(94602826)
                        entity.set_entity_god_mode(am["spinning_middle2"], true)
                        entity.attach_entity_to_entity(
                            am["spinning_middle2"],
                            am["spinning_1"],
                            0,
                            v3(0, 0, 1.5),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["spinning_middle3"] == nil then
                        am["spinning_middle3"] = n.Object(94602826)
                        entity.set_entity_god_mode(am["spinning_middle3"], true)
                        entity.attach_entity_to_entity(
                            am["spinning_middle3"],
                            am["spinning_1"],
                            0,
                            v3(0, 0, 3),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    local dD = entity.get_entity_bone_index_by_name(am["spinning_1"], "rotor_main")
                    if am["glow_1"] == nil then
                        am["glow_1"] = n.Object(2655881418)
                        entity.set_entity_god_mode(am["glow_1"], true)
                        entity.attach_entity_to_entity(
                            am["glow_1"],
                            am["spinning_1"],
                            dD,
                            v3(2, 3, 3),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["glow_2"] == nil then
                        am["glow_2"] = n.Object(2655881418)
                        entity.set_entity_god_mode(am["glow_2"], true)
                        entity.attach_entity_to_entity(
                            am["glow_2"],
                            am["spinning_1"],
                            dD,
                            v3(2, -3, 3),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["glow_3"] == nil then
                        am["glow_3"] = n.Object(2655881418)
                        entity.set_entity_god_mode(am["glow_3"], true)
                        entity.attach_entity_to_entity(
                            am["glow_3"],
                            am["spinning_1"],
                            dD,
                            v3(4, 0, 3),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["glow_4"] == nil then
                        am["glow_4"] = n.Object(2655881418)
                        entity.set_entity_god_mode(am["glow_4"], true)
                        entity.attach_entity_to_entity(
                            am["glow_4"],
                            am["spinning_1"],
                            dD,
                            v3(-2, 3, 3),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["glow_5"] == nil then
                        am["glow_5"] = n.Object(2655881418)
                        entity.set_entity_god_mode(am["glow_5"], true)
                        entity.attach_entity_to_entity(
                            am["glow_5"],
                            am["spinning_1"],
                            dD,
                            v3(-2, -3, 3),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    if am["glow_6"] == nil then
                        am["glow_6"] = n.Object(2655881418)
                        entity.set_entity_god_mode(am["glow_6"], true)
                        entity.attach_entity_to_entity(
                            am["glow_6"],
                            am["spinning_1"],
                            dD,
                            v3(-4, 0, 3),
                            v3(0, 0, 0),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                    end
                    return HANDLER_CONTINUE
                end
                if not V.on then
                    local dE = {
                        "spinning_1",
                        "glow_1",
                        "glow_2",
                        "glow_3",
                        "glow_4",
                        "glow_5",
                        "glow_6",
                        "spinning_middle",
                        "spinning_middle2",
                        "spinning_middle3"
                    }
                    for j = 1, #dE do
                        if am[dE[j]] then
                            l.clear({am[dE[j]]})
                            am[dE[j]] = nil
                        end
                    end
                    return
                end
                c["Rocket Propulsion"] = {Enabled = V.on}
            end
        )
        t.Feature["Robot Equip Weapons"] =
            menu.add_feature(
            "Equip Miniguns on hands",
            "toggle",
            t.Parent["Moveable Robot"],
            function(V)
                c["Robot Equip Weapons"] = {Enabled = V.on}
                if V.on and am["lheadtrain"] and am["rheadtrain"] then
                    if #Z["robot_weapon_left"] == 0 and #Z["robot_weapon_right"] == 0 then
                        local dF = false
                        if t.Feature["Custom Vehicles Preview"].on then
                            dF = true
                            c["Custom Vehicles Preview"] = {Enabled = false}
                        end
                        local dG = false
                        if t.Feature["Spawn in Custom Vehicle"].on then
                            dG = true
                            c["Spawn in Custom Vehicle"] = {Enabled = false}
                        end
                        local b5 = p.custom_vehicles[1][2]
                        b4(b5, "robot_weapon_left")
                        b4(b5, "robot_weapon_right")
                        local dH = Z["robot_weapon_left"][1]
                        local dI = Z["robot_weapon_right"][1]
                        local dJ = am["lheadtrain"]
                        local dK = am["rheadtrain"]
                        l.request_ctrl(dH)
                        l.request_ctrl(dI)
                        l.request_ctrl(dJ)
                        l.request_ctrl(dK)
                        entity.attach_entity_to_entity(
                            dH,
                            dJ,
                            0,
                            v3(0, 5, 0),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                        entity.attach_entity_to_entity(
                            dI,
                            dK,
                            0,
                            v3(0, 5, 0),
                            v3(),
                            true,
                            t.Feature["Robot Collision"].on,
                            false,
                            2,
                            true
                        )
                        if dF then
                            t.Feature["Custom Vehicles Preview"].on = true
                        end
                        if dG then
                            t.Feature["Spawn in Custom Vehicle"].on = true
                        end
                    end
                    return HANDLER_CONTINUE
                end
                if not V.on then
                    if #Z["robot_weapon_left"] ~= 0 then
                        l.clear(Z["robot_weapon_left"])
                        Z["robot_weapon_left"] = {}
                    end
                    if #Z["robot_weapon_right"] ~= 0 then
                        l.clear(Z["robot_weapon_right"])
                        Z["robot_weapon_right"] = {}
                    end
                    return
                end
            end
        )
        t.Feature["Drive Robot"] =
            menu.add_feature(
            "Drive Robot",
            "action",
            t.Parent["Moveable Robot"],
            function()
                if am["tampa"] then
                    ped.set_ped_into_vehicle(k.OwnPed(), am["tampa"], -1)
                end
            end
        )
        t.Feature["Self Destruction"] =
            menu.add_feature(
            "Self Destruction",
            "action",
            t.Parent["Moveable Robot"],
            function()
                if am["tampa"] then
                    for j = 1, #Z["robot_weapon_left"] do
                        entity.detach_entity(Z["robot_weapon_left"][j])
                        entity.freeze_entity(Z["robot_weapon_left"][j], false)
                        entity.set_entity_god_mode(Z["robot_weapon_left"][j], false)
                        coroutine.yield(0)
                    end
                    for j = 1, #Z["robot_weapon_right"] do
                        entity.detach_entity(Z["robot_weapon_right"][j])
                        entity.freeze_entity(Z["robot_weapon_right"][j], false)
                        entity.set_entity_god_mode(Z["robot_weapon_right"][j], false)
                        coroutine.yield(0)
                    end
                    for j in pairs(am) do
                        entity.detach_entity(am[j])
                        entity.freeze_entity(am[j], false)
                        entity.set_entity_god_mode(am[j], false)
                        coroutine.yield(0)
                    end
                    for j = 1, #Z["robot_weapon_left"] do
                        fire.add_explosion(entity.get_entity_coords(Z["robot_weapon_left"][j]), 8, true, false, 0, 0)
                        coroutine.yield(33)
                    end
                    for j = 1, #Z["robot_weapon_right"] do
                        fire.add_explosion(entity.get_entity_coords(Z["robot_weapon_right"][j]), 8, true, false, 0, 0)
                        coroutine.yield(33)
                    end
                    for j in pairs(am) do
                        fire.add_explosion(entity.get_entity_coords(am[j]), 8, true, false, 0, 0)
                        coroutine.yield(33)
                    end
                    Z["robot_weapon_left"] = {}
                    Z["robot_weapon_right"] = {}
                    am = {}
                    t.Feature["Enable Robot"].on = false
                end
            end
        )
        t.Parent["Custom Vehicles Spawner"] =
            menu.add_feature("Custom Vehicles", "parent", t.Parent["Custom Vehicles"], nil).id
        t.Feature["Custom Vehicles Preview"] =
            menu.add_feature(
            "Preview Custom Vehicles",
            "toggle",
            t.Parent["Custom Vehicles Spawner"],
            function(V)
                if #Z["preview_veh"] > 0 and V.on then
                    if ped.is_ped_in_any_vehicle(k.OwnPed()) then
                        ped.clear_ped_tasks_immediately(k.OwnPed())
                    end
                    local aV = k.OwnCoords()
                    if not a6 then
                        for j = 1, #Z["preview_veh"] do
                            entity.set_entity_no_collsion_entity(Z["preview_veh"][j], k.OwnPed(), true)
                        end
                        a6 = true
                    end
                    aV.z = aV.z + a5
                    local bb = k.OwnHeading()
                    aV = l.OffsetCoords(aV, bb, a7)
                    l.set_coords(Z["preview_veh"][1], aV)
                    entity.set_entity_rotation(Z["preview_veh"][1], a8)
                    a8.z = a8.z + 1
                    if a8.z > 360 then
                        a8.z = 0
                    end
                    return HANDLER_CONTINUE
                end
                if not V.on then
                    l.clear(Z["preview_veh"])
                    Z["preview_veh"] = {}
                    a6 = false
                    return
                end
            end
        )
        menu.add_feature(
            "Delete Custom Vehicles",
            "action",
            t.Parent["Custom Vehicles Spawner"],
            function()
                C("Clearing Custom Vehicles.")
                l.clear(Z["Custom Vehicles"])
                Z["Custom Vehicles"] = {}
                l.clear(Z["preview_veh"])
                Z["preview_veh"] = {}
                a6 = false
                z("Cleared Custom Vehicles.", "Success")
            end
        )
        for j = 1, #p.custom_vehicles do
            menu.add_feature(
                p.custom_vehicles[j][1],
                "action",
                t.Parent["Custom Vehicles Spawner"],
                function()
                    local b5 = p.custom_vehicles[j][2]
                    b4(b5)
                end
            )
        end
        t.Parent["Custom Vehicles Options"] = menu.add_feature("Options", "parent", t.Parent["Custom Vehicles"], nil).id
        t.Feature["Spawn in Custom Vehicle"] =
            menu.add_feature(
            "Spawn in Custom Vehicle",
            "toggle",
            t.Parent["Custom Vehicles Options"],
            function(V)
                c["Spawn in Custom Vehicle"] = {Enabled = V.on}
            end
        )
        t.Feature["Use Own Vehicles"] =
            menu.add_feature(
            "Use Own Vehicle for Custom ones",
            "toggle",
            t.Parent["Custom Vehicles Options"],
            function(V)
                c["Use Own Vehicles"] = {Enabled = V.on}
            end
        )
        t.Feature["Custom Vehicles Godmode"] =
            menu.add_feature(
            "Godmode on Custom Vehicles",
            "toggle",
            t.Parent["Custom Vehicles Options"],
            function(V)
                c["Custom Vehicles Godmode"] = {Enabled = V.on}
            end
        )
        t.Parent["Ground Animals"] =
            menu.add_feature("Ground Animals", "parent", t.Parent["local_modelchanger"], nil).id
        for dL = 1, #aq.Animals.Ground do
            t.Feature["AMC" .. aq.Animals.Ground[dL].Name] =
                menu.add_feature(
                aq.Animals.Ground[dL].Name,
                "action",
                t.Parent["Ground Animals"],
                function()
                    aw(aq.Animals.Ground[dL].Hash, nil, true)
                end
            )
        end
        t.Parent["Water Animals"] =
            menu.add_feature(
            "Water Animals",
            "parent",
            t.Parent["local_modelchanger"],
            function()
                z("Note that these Models will only work in Water!", "Neutral")
            end
        ).id
        for dM = 1, #aq.Animals.Water do
            t.Feature["AMC" .. aq.Animals.Water[dM].Name] =
                menu.add_feature(
                aq.Animals.Water[dM].Name,
                "action",
                t.Parent["Water Animals"],
                function()
                    aw(aq.Animals.Water[dM].Hash, true, true)
                end
            )
        end
        t.Parent["Flying Animals"] =
            menu.add_feature("Flying Animals", "parent", t.Parent["local_modelchanger"], nil).id
        for dN = 1, #aq.Animals.Air do
            t.Feature["AMC" .. aq.Animals.Air[dN].Name] =
                menu.add_feature(
                aq.Animals.Air[dN].Name,
                "action",
                t.Parent["Flying Animals"],
                function()
                    aw(aq.Animals.Air[dN].Hash, nil, true)
                end
            )
        end
        t.Parent["Standard Models"] =
            menu.add_feature("Standard Models", "parent", t.Parent["local_modelchanger"], nil).id
        for dO = 1, #aq.Animals.Standard do
            t.Feature["AMC" .. aq.Animals.Standard[dO].Name] =
                menu.add_feature(
                aq.Animals.Standard[dO].Name,
                "action",
                t.Parent["Standard Models"],
                function()
                    aw(aq.Animals.Standard[dO].Hash, nil, true)
                end
            )
        end
        t.Feature["Model Change Input"] =
            menu.add_feature(
            "Model Change: Input",
            "action",
            t.Parent["local_modelchanger"],
            function(V)
                local dP = k.Input("Enter Ped Model Name or Hash")
                if not dP then
                    z("Input canceled.", "Error", "")
                    return
                end
                local ax = dP
                if not tonumber(dP) then
                    ax = gameplay.get_hash_key(dP)
                end
                if not streaming.is_model_a_ped(ax) then
                    z("Input is not a valid ped.", "Error", "")
                    return
                end
                aw(ax, nil, true)
            end
        )
        t.Feature["Safe Model Change"] =
            menu.add_feature(
            "Safe Model Change",
            "toggle",
            t.Parent["local_modelchanger"],
            function(V)
                c["Safe Model Change"] = {Enabled = V.on}
            end
        )
        t.Feature["Revert Outfit"] =
            menu.add_feature(
            "Revert Outfit",
            "toggle",
            t.Parent["local_modelchanger"],
            function(V)
                c["Revert Outfit"] = {Enabled = V.on}
            end
        )
        t.Feature["Fix Loading Screen"] =
            menu.add_feature(
            "Fix endless loading Screen",
            "action",
            t.Parent["local_modelchanger"],
            function()
                aw(0x9B22DBAF)
                coroutine.yield(100)
                ped.set_ped_health(k.OwnPed(), 0)
            end
        )
        t.Parent["Block Areas"] = menu.add_feature("Block Areas", "parent", t.Parent["local_lobby"], nil).id
        t.Feature["Teleport to Block"] =
            menu.add_feature(
            "Teleport to Block",
            "toggle",
            t.Parent["Block Areas"],
            function(V)
                c["Teleport to Block"] = {Enabled = V.on}
            end
        )
        t.Feature["Clear blocking Objects"] =
            menu.add_feature(
            "Clear blocking Objects",
            "action",
            t.Parent["Block Areas"],
            function()
                l.clear(Z["bl_objects"])
                Z["bl_objects"] = {}
            end
        )
        for j = 1, #p.block_locations do
            local dQ = p.block_locations[j]
            local dR = menu.add_feature(dQ.Name, "parent", t.Parent["Block Areas"]).id
            for av = 1, #dQ.Children do
                local dS = dQ.Children[av]
                menu.add_feature(dS.Name, "action", dR, aR).data = dS
            end
        end
        t.Parent["Lobby Trolling"] = menu.add_feature("Trolling", "parent", t.Parent["local_lobby"], nil).id
        t.Feature["Lobby Fake Typing Indicator"] =
            menu.add_feature(
            "Fake Typing Indicator",
            "toggle",
            t.Parent["Lobby Trolling"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Typing Begin", {player.player_id(), 0, math.random(0, 10000)}, bB)
                        end
                    end
                    coroutine.yield(2000)
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Typing Stop", {player.player_id(), 0, math.random(0, 10000)}, bB)
                    end
                end
            end
        )
        t.Parent["Lobby Fake Invites"] = menu.add_feature("Fake Invites", "parent", t.Parent["Lobby Trolling"], nil).id
        t.Feature["Lobby Fake Invite"] =
            menu.add_feature(
            "Fake Invite (Named)",
            "action_value_str",
            t.Parent["Lobby Fake Invites"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Fake Invite", {player.player_id(), V.value + 1}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Fake Invite"]:set_str_data(
            {"Yacht", "Office", "Clubhouse", "Office Garage", "Custom Auto Shop", "Apartment"}
        )
        t.Feature["Lobby Fake Invite 2"] =
            menu.add_feature(
            "Fake Invite 2 (Named)",
            "action_value_str",
            t.Parent["Lobby Fake Invites"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Fake Invite 2", {player.player_id(), V.value}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Fake Invite 2"]:set_str_data({"Scramble", "Head-to-Head Race", "Sprint", "ERROR"})
        t.Feature["Lobby Fake Invite 3"] =
            menu.add_feature(
            "Anonymous Fake Invite",
            "action_value_str",
            t.Parent["Lobby Fake Invites"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send(
                            "Fake Invite 3",
                            {player.player_id(), math.random(0, 179), aq.smslocations[V.value + 1]},
                            bB
                        )
                    end
                end
            end
        )
        t.Feature["Lobby Fake Invite 3"]:set_str_data(
            {
                "Business",
                "Vehicle Warehouse",
                "Bunker",
                "Mobile Operations Center",
                "Hangar",
                "Avenger",
                "Facility",
                "Nightclub",
                "Terrorbyte",
                "Arena Workshop",
                "Penthouse",
                "Arcade",
                "Kosatka",
                "Record A Studios",
                "Auto Shop",
                "LS Car Meet",
                "Agency",
                "ERROR"
            }
        )
        t.Feature["Lobby Fake Invite Spam"] =
            menu.add_feature(
            "Fake Invite Spam",
            "toggle",
            t.Parent["Lobby Fake Invites"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send(
                                "Fake Invite 3",
                                {
                                    player.player_id(),
                                    math.random(0, 179),
                                    aq.smslocations[math.random(#aq.smslocations)]
                                },
                                bB
                            )
                        end
                    end
                    coroutine.yield(200)
                end
            end
        )
        t.Parent["Lobby Notifications"] =
            menu.add_feature("Notifications", "parent", t.Parent["Lobby Trolling"], nil).id
        t.Feature["Lobby Job Notification"] =
            menu.add_feature(
            "Job Notification: Input",
            "action",
            t.Parent["Lobby Notifications"],
            function(V, bB)
                local dT = tostring(k.Input("Enter Job Name", 100))
                if not dT then
                    z("Input canceled.", "Error", "")
                    return
                end
                local au = utils.str_to_vecu64(dT)
                local dU = {player.player_id()}
                for j = 1, #au do
                    dU[j + 1] = au[j]
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Force To Mission 2", dU, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Cash Removed"] =
            menu.add_feature(
            "Cash Removed",
            "action_value_str",
            t.Parent["Lobby Notifications"],
            function(V)
                if V.value == 0 then
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send(
                                "Notification",
                                {player.player_id(), 689178114, math.random(-2147483647, 2147483647)},
                                bB
                            )
                        end
                    end
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Notification", {player.player_id(), 689178114, dV}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Cash Removed"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Lobby Cash Stolen"] =
            menu.add_feature(
            "Cash Stolen",
            "action_value_str",
            t.Parent["Lobby Notifications"],
            function(V)
                if V.value == 0 then
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send(
                                "Notification",
                                {player.player_id(), 2187973097, math.random(-2147483647, 2147483647)},
                                bB
                            )
                        end
                    end
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Notification", {player.player_id(), 2187973097, dV}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Cash Stolen"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Lobby Cash Banked"] =
            menu.add_feature(
            "Cash Banked",
            "action_value_str",
            t.Parent["Lobby Notifications"],
            function(V)
                if V.value == 0 then
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send(
                                "Notification",
                                {player.player_id(), 1990572980, math.random(-2147483647, 2147483647)},
                                bB
                            )
                        end
                    end
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Notification", {player.player_id(), 1990572980, dV}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Cash Banked"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Lobby Insurance Notification"] =
            menu.add_feature(
            "Insurance Notification",
            "action_value_str",
            t.Parent["Lobby Notifications"],
            function(V)
                if V.value == 0 then
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Insurance Notification", {player.player_id(), math.random(1, 20000)}, bB)
                        end
                    end
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Insurance Notification", {player.player_id(), dV}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Insurance Notification"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Lobby Notification Spam"] =
            menu.add_feature(
            "Notification Spam",
            "value_str",
            t.Parent["Lobby Notifications"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send(
                                "Notification",
                                {player.player_id(), 689178114, math.random(-2147483647, 2147483647)},
                                bB
                            )
                            r.Send(
                                "Notification",
                                {player.player_id(), 2187973097, math.random(-2147483647, 2147483647)},
                                bB
                            )
                            r.Send(
                                "Notification",
                                {player.player_id(), 1990572980, math.random(-2147483647, 2147483647)},
                                bB
                            )
                            if V.value == 0 then
                                r.Send("Insurance Notification", {player.player_id(), math.random(1, 20000)}, bB)
                            end
                        end
                        coroutine.yield(0)
                    end
                    coroutine.yield(200)
                end
            end
        )
        t.Feature["Lobby Notification Spam"]:set_str_data({"Named", "Anonymous"})
        t.Parent["Lobby Teleports"] = menu.add_feature("Teleports", "parent", t.Parent["Lobby Trolling"], nil).id
        t.Feature["Lobby Random Apartment Invite"] =
            menu.add_feature(
            "Random Apartment Invite",
            "action",
            t.Parent["Lobby Teleports"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Apartment Invite", {player.player_id(), bB, 1, 0, math.random(1, 114), 1, 1, 1}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Apartment Invite Loop"] =
            menu.add_feature(
            "Apartment Invite Loop",
            "toggle",
            t.Parent["Lobby Teleports"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Apartment Invite", {player.player_id(), bB, 1, 0, math.random(1, 114), 1, 1, 1}, bB)
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Lobby Warehouse Invite"] =
            menu.add_feature(
            "Warehouse Invite",
            "action_value_str",
            t.Parent["Lobby Teleports"],
            function(V, bB)
                if V.value == 22 then
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Warehouse Invite", {player.player_id(), 0, 1, math.random(1, 22)}, bB)
                        end
                    end
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Warehouse Invite", {player.player_id(), 0, 1, V.value + 1}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Warehouse Invite"]:set_str_data(
            {
                "Elysian Island North",
                "La Puerta North",
                "La Mesa Mid",
                "Rancho West",
                "West Vinewood",
                "LSIA North",
                "Del Perro",
                "LSIA South",
                "Elysian Island South",
                "El Burro Heights",
                "Elysian Island West",
                "Textile City",
                "La Puerta South",
                "Strawberry",
                "Downtown Vinewood North",
                "La Mesa South",
                "La Mesa North",
                "Cypress Flats North",
                "Cypress Flats South",
                "West Vinewood West",
                "Rancho East",
                "Banning",
                "Random"
            }
        )
        t.Feature["Lobby Warehouse Invite Loop"] =
            menu.add_feature(
            "Warehouse Invite Loop",
            "toggle",
            t.Parent["Lobby Teleports"],
            function(V, bB)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Warehouse Invite", {player.player_id(), 0, 1, math.random(1, 22)}, bB)
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Lobby Force Island"] =
            menu.add_feature(
            "Send to Cayo Perico v1",
            "action",
            t.Parent["Lobby Teleports"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Force To Island", {player.player_id(), 1}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Force Island 2"] =
            menu.add_feature(
            "Send to Cayo Perico v2",
            "action_value_str",
            t.Parent["Lobby Teleports"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        if V.value == 0 then
                            r.Send("Force To Island 2", {player.player_id(), 0, 0, 3, 1}, bB)
                        elseif V.value == 1 then
                            r.Send("Force To Island 2", {player.player_id(), 0, 0, 4, 1}, bB)
                        elseif V.value == 2 then
                            r.Send("Force To Island 2", {player.player_id(), 0, 0, 3, 0}, bB)
                        elseif V.value == 3 then
                            r.Send("Force To Island 2", {player.player_id(), 0, 0, 4, 0}, bB)
                        end
                    end
                end
            end
        )
        t.Feature["Lobby Force Island 2"]:set_str_data(
            {"Beach Party (Plane)", "Beach Party (Instant)", "Back Home (Airport)", "Back Home (Beach)"}
        )
        t.Feature["Lobby Force Mission"] =
            menu.add_feature(
            "Force to Mission",
            "action_value_str",
            t.Parent["Lobby Teleports"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Force To Mission", {player.player_id(), V.value}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Force Mission"]:set_str_data(
            {
                "Severe Weather Patterns",
                "Half-track Bully",
                "Exit Strategy",
                "Offshore Assets",
                "Cover Blown",
                "Mole Hunt",
                "Data Breach",
                "Work Dispute"
            }
        )
        t.Parent["Sound Spam"] = menu.add_feature("Sound Spam", "parent", t.Parent["Lobby Trolling"], nil).id
        t.Feature["Sound Spam Speed"] =
            menu.add_feature(
            "Spam Delay (ms)",
            "autoaction_value_i",
            t.Parent["Sound Spam"],
            function(V)
                c["Sound Spam Speed"] = {Value = V.value}
            end
        )
        t.Feature["Sound Spam Speed"].min = 0
        t.Feature["Sound Spam Speed"].max = 10000
        t.Feature["Sound Spam Speed"].mod = 100
        t.Feature["Sound Rape 1"] =
            menu.add_feature(
            "Sound Rape",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(-1, "07", v3(75, 2000, 150), "DLC_GR_CS2_Sounds", true, 10000, false)
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Short Transition In"] =
            menu.add_feature(
            "Short Transition In",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "Short_Transition_In",
                        v3(75, 2000, 150),
                        "PLAYER_SWITCH_CUSTOM_SOUNDSET",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound 1st Person Transition"] =
            menu.add_feature(
            "1st Person Transition",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "1st_Person_Transition",
                        v3(75, 2000, 150),
                        "PLAYER_SWITCH_CUSTOM_SOUNDSET",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Mission Pass Notify"] =
            menu.add_feature(
            "Mission Pass Notify",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "Mission_Pass_Notify",
                        v3(75, 2000, 150),
                        "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound MP Impact"] =
            menu.add_feature(
            "MP Impact",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(-1, "MP_Impact", v3(75, 2000, 150), "WastedSounds", true, 10000, false)
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Wasted"] =
            menu.add_feature(
            "Wasted",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "Wasted",
                        v3(75, 2000, 150),
                        "DLC_IE_VV_General_Sounds",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Wasted 2"] =
            menu.add_feature(
            "Wasted 2",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(-1, "Bed", v3(75, 2000, 150), "WastedSounds", true, 10000, false)
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound 10 Second Countdown"] =
            menu.add_feature(
            "10 Second Countdown",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "10s",
                        v3(75, 2000, 150),
                        "MP_MISSION_COUNTDOWN_SOUNDSET",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound 5 Second Warning"] =
            menu.add_feature(
            "5 Second Warning",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "5_SEC_WARNING",
                        v3(75, 2000, 150),
                        "HUD_MINI_GAME_SOUNDSET",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound 5 Second Event Start"] =
            menu.add_feature(
            "5 Second Event Start Countdown",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "5s_To_Event_Start_Countdown",
                        v3(75, 2000, 150),
                        "GTAO_FM_Events_Soundset",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Arming Countdown"] =
            menu.add_feature(
            "Arming Countdown",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "Arming_Countdown",
                        v3(75, 2000, 150),
                        "GTAO_Speed_Convoy_Soundset",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Click Special"] =
            menu.add_feature(
            "Click Special",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "Click_Special",
                        v3(75, 2000, 150),
                        "WEB_NAVIGATION_SOUNDS_PHONE",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Base Jump Passed"] =
            menu.add_feature(
            "Base Jump Passed",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "BASE_JUMP_PASSED",
                        v3(75, 2000, 150),
                        "HUD_AWARDS",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Put Phone Away"] =
            menu.add_feature(
            "Put Phone Away",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "Put_Away",
                        v3(75, 2000, 150),
                        "Phone_SoundSet_Michael",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Rank Up"] =
            menu.add_feature(
            "Rank Up",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(-1, "RANK_UP", v3(75, 2000, 150), "HUD_AWARDS", true, 10000, false)
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Waypoint Set"] =
            menu.add_feature(
            "Waypoint Set",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "WAYPOINT_SET",
                        v3(75, 2000, 150),
                        "HUD_FRONTEND_DEFAULT_SOUNDSET",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Strong Wind"] =
            menu.add_feature(
            "Strong Wind",
            "toggle",
            t.Parent["Sound Spam"],
            function(V)
                while V.on do
                    audio.play_sound_from_coord(
                        -1,
                        "Whoosh_1s_L_to_R",
                        v3(75, 2000, 150),
                        "MP_LOBBY_SOUNDS",
                        true,
                        10000,
                        false
                    )
                    audio.play_sound_from_coord(
                        -1,
                        "Whoosh_1s_R_to_L",
                        v3(75, 2000, 150),
                        "MP_LOBBY_SOUNDS",
                        true,
                        10000,
                        false
                    )
                    coroutine.yield(t.Feature["Sound Spam Speed"].value)
                end
            end
        )
        t.Feature["Sound Phone Ringing"] =
            menu.add_feature(
            "Infinite Phone Ringing",
            "action",
            t.Parent["Sound Spam"],
            function(V)
                audio.play_sound_from_coord(
                    -1,
                    "Remote_Ring",
                    v3(75, 2000, 150),
                    "Phone_SoundSet_Michael",
                    true,
                    10000,
                    false
                )
            end
        )
        t.Feature["Lobby Script Freeze"] =
            menu.add_feature(
            "Script Freeze",
            "value_str",
            t.Parent["Lobby Trolling"],
            function(V, bB)
                while V.on do
                    if V.value == 0 then
                        for bB = 0, 31 do
                            if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                                r.Send("Warehouse Invite", {player.player_id(), 0, 1, 0}, bB)
                            end
                        end
                    else
                        for bB = 0, 31 do
                            if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                                r.Send("Force To Island 2", {player.player_id()}, bB)
                            end
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Lobby Script Freeze"]:set_str_data({"v1", "v2"})
        t.Feature["Lobby Start Cutscene"] =
            menu.add_feature(
            "Start Casino Cutscene",
            "action",
            t.Parent["Lobby Trolling"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Casino Cutscene", {player.player_id()}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Force Camera Forward"] =
            menu.add_feature(
            "Force Camera Forward",
            "toggle",
            t.Parent["Lobby Trolling"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Camera Manipulation", {player.player_id(), 869796886, 0}, bB)
                        end
                    end
                    coroutine.yield(200)
                end
            end
        )
        t.Feature["Lobby Transaction Error"] =
            menu.add_feature(
            "Transaction Error",
            "toggle",
            t.Parent["Lobby Trolling"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send(
                                "Transaction Error",
                                {player.player_id(), 50000, 0, 1, r.MainGlobal(bB), r.GlobalPair()},
                                bB
                            )
                        end
                    end
                    coroutine.yield(1000)
                end
            end
        )
        t.Feature["Lobby Vehicle Kick"] =
            menu.add_feature(
            "Vehicle Kick",
            "action",
            t.Parent["Lobby Trolling"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Vehicle Kick", {player.player_id(), 4294967295, 4294967295, 4294967295}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Vehicle EMP"] =
            menu.add_feature(
            "Vehicle EMP",
            "action",
            t.Parent["Lobby Trolling"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        local aV = k.PlayerCoords(bB)
                        r.Send("Vehicle EMP", {player.player_id(), m.ToInt(aV.x), m.ToInt(aV.y), m.ToInt(aV.z), 0}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby Destroy Personal Vehicle"] =
            menu.add_feature(
            "Destroy Personal Vehicle",
            "action",
            t.Parent["Lobby Trolling"],
            function()
                for bB = 0, 31 do
                    if r.GetPersonalVehicle(bB) == 0 or not l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        goto ca
                    end
                    r.Send("Destroy Personal Vehicle", {player.player_id(), bB}, bB)
                    r.Send("Vehicle Kick", {player.player_id(), 4294967295, 4294967295, 4294967295}, bB)
                    ::ca::
                end
            end
        )
        t.Parent["Lobby Griefing"] = menu.add_feature("Griefing", "parent", t.Parent["local_lobby"], nil).id
        t.Feature["Explosion Blame"] =
            menu.add_feature(
            "Player Blame",
            "action_value_str",
            t.Parent["Lobby Griefing"],
            function(V)
                if V.value == 0 then
                    aa = 0
                    z("Explosion Kills are now anonymous.", "Success", "")
                elseif V.value == 1 then
                    aa = k.OwnPed()
                    z("You are now earning the blame for any Explosion Kills.", "Success", "")
                elseif V.value == 2 then
                    z("Explosion Kill blame is now random.", "Success", "")
                else
                    local bB = k.Input("Enter the Targets Player ID", 2, 3)
                    if not bB then
                        z("Input canceled.", "Error", "")
                        return
                    end
                    if not player.is_player_valid(bB) then
                        z("Invalid Player!", "Error", "")
                        return
                    end
                    aa = k.PlayerPed(bB)
                    z("Now blaming " .. k.Name(bB) .. " for any Kills.", "Success", "")
                end
            end
        )
        t.Feature["Explosion Blame"]:set_str_data({"Anonymous", "Self", "Random", "ID Input"})
        t.Parent["Explosion Settings"] =
            menu.add_feature("Custom Explosion", "parent", t.Parent["Lobby Griefing"], nil).id
        t.Feature["Explosion Delay"] =
            menu.add_feature(
            "Explosion Delay (ms)",
            "autoaction_value_i",
            t.Parent["Explosion Settings"],
            function(V)
                c["Explosion Delay"] = {Value = V.value}
            end
        )
        t.Feature["Explosion Delay"].min = 100
        t.Feature["Explosion Delay"].max = 10000
        t.Feature["Explosion Delay"].mod = 100
        t.Feature["Explosion Invisibility"] =
            menu.add_feature(
            "Invisible Explosions ",
            "toggle",
            t.Parent["Explosion Settings"],
            function(V)
                c["Explosion Invisibility"] = {Enabled = V.on}
            end
        )
        t.Feature["Explosion Silent"] =
            menu.add_feature(
            "Silent Explosions",
            "toggle",
            t.Parent["Explosion Settings"],
            function(V)
                c["Explosion Silent"] = {Enabled = V.on}
            end
        )
        t.Feature["Explosion Camshake"] =
            menu.add_feature(
            "Cam Shake Intensity",
            "autoaction_value_i",
            t.Parent["Explosion Settings"],
            function(V)
                c["Explosion Camshake"] = {Value = V.value}
            end
        )
        t.Feature["Explosion Camshake"].min = 0.00
        t.Feature["Explosion Camshake"].max = 100.00
        t.Feature["Explosion Camshake"].mod = 5.00
        t.Feature["Explosion Custom"] =
            menu.add_feature(
            "Explode Lobby",
            "value_str",
            t.Parent["Explosion Settings"],
            function(V)
                while V.on do
                    local dW = true
                    if t.Feature["Explosion Silent"].on then
                        dW = false
                    end
                    local dX = aa
                    for bB = 0, 31 do
                        if t.Feature["Explosion Blame"].value == 2 then
                            local bB = -1
                            while not l.valid_player(bB) do
                                bB = math.random(0, 31)
                                coroutine.yield(0)
                            end
                            dX = k.PlayerPed(bB)
                        end
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            fire.add_explosion(
                                k.PlayerCoords(bB),
                                V.value,
                                dW,
                                t.Feature["Explosion Invisibility"].on,
                                t.Feature["Explosion Camshake"].value,
                                dX
                            )
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Explosion Custom"]:set_str_data(
            {
                "Grenade",
                "Grenade Launcher",
                "Stickybomb",
                "Molotov",
                "Rocket",
                "Tankshell",
                "Octane",
                "Car",
                "Plane",
                "Petrol Pump",
                "Bike",
                "Water",
                "Flame",
                "Water Hydrant",
                "Flame Canister",
                "Boat",
                "Ship Destroy",
                "Truck",
                "Bullet",
                "Smoke Launcher",
                "Smoke Grenade",
                "BZ Gas",
                "Flase",
                "Gas Canister 2",
                "Extinguisher",
                "Programmable AR",
                "Train",
                "Barrel",
                "Propane",
                "Blimp",
                "Flame 2",
                "Tanker",
                "Plane Rocket",
                "Vehicle Bullet",
                "Gas Tank",
                "Bird Crap",
                "Railgun",
                "Blimp 2",
                "Firework",
                "Snowball",
                "Proxmine",
                "Valkyrie Cannon",
                "Air Defence",
                "Pipe Bomb",
                "Vehicle Mine",
                "Explosive Ammo",
                "APC Shell",
                "Bomb Cluster",
                "Bomb Gas",
                "Bomb Incendiary",
                "Bomb Standard",
                "Torpedo",
                "Torpedo Underwater",
                "Bombushka Canon",
                "Bomb Cluster Secondary",
                "Hunter Barrage",
                "Hunter Cannon",
                "Rogue Cannon",
                "Mine Underwater",
                "Orbital Canon",
                "Bomb Std Wide",
                "Explosive Shotgun",
                "Oppressor MK II Cannon",
                "Mortar Kinetic",
                "Vehicle Mine Kinetic",
                "Vehicle Mine EMP",
                "Vehicle Mine Spike",
                "Vehicle Mine Slick",
                "Vehicle Mine Tar",
                "Script Drone",
                "Up-n-Atomizer",
                "Buried Mine",
                "Script Missile",
                "RC Tank Rocket",
                "Bomb Water",
                "Bomb Water Secondary",
                "Extinguisher 2",
                "Extinguisher 3",
                "Extinguisher 4",
                "Extinguisher 5",
                "Extinguisher 6",
                "Script Missile Large",
                "Submarine Big",
                "EMP"
            }
        )
        local dY = {
            {Name = "Explode Lobby", Type = 27, Camshake = 1},
            {Name = "Set Lobby on Fire", Type = 14, Camshake = 0},
            {Name = "Orbital Cannon Spam", Type = 59, Camshake = 10},
            {Name = "Water Hydrant Spam", Type = 13, Camshake = 0}
        }
        for j = 1, #dY do
            local O = dY[j].Name
            local dZ = dY[j].Type
            local d_ = dY[j].Camshake
            t.Feature[O] =
                menu.add_feature(
                O,
                "toggle",
                t.Parent["Lobby Griefing"],
                function(V)
                    local dX = aa
                    if t.Feature["Explosion Blame"].value == 2 then
                        local bB = -1
                        while not l.valid_player(bB) do
                            bB = math.random(0, 31)
                            coroutine.yield(0)
                        end
                        dX = k.PlayerPed(bB)
                    end
                    while V.on do
                        for bB = 0, 31 do
                            if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                                fire.add_explosion(k.PlayerCoords(bB), dZ, true, false, d_, dX)
                            end
                        end
                        coroutine.yield(500)
                    end
                end
            )
        end
        t.Feature["Freeze Lobby"] =
            menu.add_feature(
            "Freeze Lobby",
            "toggle",
            t.Parent["Lobby Griefing"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            ped.clear_ped_tasks_immediately(k.PlayerPed(bB))
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Lobby Infinite Apartment Invite"] =
            menu.add_feature(
            "Infinite Apartment Invite",
            "action",
            t.Parent["Lobby Griefing"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Apartment Invite", {player.player_id(), bB, 4294967295, 1, 115, 0, 0, 0}, bB)
                    end
                end
            end
        )
        t.Feature["Lobby CEO"] =
            menu.add_feature(
            "CEO Removal",
            "action_value_str",
            t.Parent["Lobby Griefing"],
            function(V)
                local e0 = {
                    {"CEO Kick", {player.player_id(), 1, 5}},
                    {"CEO Kick", {player.player_id(), 1, 6}},
                    {"CEO Ban", {player.player_id(), 1}}
                }
                local L = e0[V.value + 1][1]
                local bu = e0[V.value + 1][2]
                for bB = 0, 31 do
                    if
                        l.valid_player(bB, t.Feature["Exclude Friends"].on) and
                            (V.value == 2 or V.value ~= 2 and r.CEOID(bB) ~= -1)
                     then
                        r.Send(L, bu, bB)
                    end
                end
            end
        )
        t.Feature["Lobby CEO"]:set_str_data({"Dismiss", "Terminate", "Ban"})
        t.Feature["Lobby Set Bounty"] =
            menu.add_feature(
            "Set Bounty: Input",
            "action_value_str",
            t.Parent["Lobby Griefing"],
            function(V)
                if script.get_host_of_this_script() == player.player_id() then
                    z("This doesnt work while you are Script Host!", "Error", "")
                    return
                end
                local dV = tonumber(k.Input("Enter Bounty Value (0 - 10000)", 5, 3, "10000"))
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                if dV > 10000 then
                    z("Value cannot be more than 10000!", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) and not r.DoesPlayerHaveBounty(bB) then
                        r.setBounty(bB, dV, V.value)
                    end
                    coroutine.yield(100)
                end
            end
        )
        t.Feature["Lobby Set Bounty"]:set_str_data({"Named", "Anonymous"})
        t.Feature["Lobby Bounty After Death"] =
            menu.add_feature(
            "Reapply Bounty after Death",
            "value_str",
            t.Parent["Lobby Griefing"],
            function(V)
                if script.get_host_of_this_script() == player.player_id() then
                    z("This doesnt work while you are Script Host!", "Error", "")
                    V.on = false
                    return
                end
                local e1 = k.Input("Enter Bounty Value (0 - 10000)", 5, 3, "10000")
                if not e1 then
                    z("Input canceled.", "Error", "")
                    V.on = false
                    return
                end
                if tonumber(e1) > 10000 then
                    z("Value cannot be more than 10000!", "Error", "")
                    V.on = false
                    return
                end
                local e2 = {}
                while V.on do
                    for bB = 0, 31 do
                        if
                            l.valid_player(bB, t.Feature["Exclude Friends"].on) and
                                entity.is_entity_dead(k.PlayerPed(bB))
                         then
                            if not e2[bB] or menu.has_thread_finished(e2[bB]) then
                                e2[bB] =
                                    menu.create_thread(
                                    function(bn)
                                        z(k.Name(bn) .. " is dead!\nReapplying bounty...", "Neutral")
                                        C(k.Name(bn) .. " is dead!\nReapplying bounty...")
                                        r.setBounty(bn, e1, V.value)
                                        while player.get_player_health(bn) == 0 do
                                            coroutine.yield(0)
                                        end
                                    end,
                                    bB
                                )
                            end
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Lobby Bounty After Death"]:set_str_data({"Named", "Anonymous"})
        t.Feature["Lobby Passive Mode"] =
            menu.add_feature(
            "Block Passive Mode",
            "toggle",
            t.Parent["Lobby Griefing"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Passive Mode", {player.player_id(), 1}, bB)
                        end
                    end
                    coroutine.yield(200)
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send("Passive Mode", {player.player_id(), 0}, bB)
                    end
                end
            end
        )
        t.Parent["Lobby Friendly"] = menu.add_feature("Friendly", "parent", t.Parent["local_lobby"], nil).id
        t.Parent["Lobby Spawn Vehicles"] =
            menu.add_feature("Spawn Vehicles", "parent", t.Parent["Lobby Friendly"], nil).id
        t.Parent["Lobby Spawn Vehicle Settings"] =
            menu.add_feature("Spawn Settings", "parent", t.Parent["Lobby Spawn Vehicles"], nil).id
        t.Feature["Lobby Spawn Vehicle Upgraded"] =
            menu.add_feature(
            "Upgraded",
            "value_str",
            t.Parent["Lobby Spawn Vehicle Settings"],
            function(V)
                c["Lobby Spawn Vehicle Upgraded"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Lobby Spawn Vehicle Upgraded"]:set_str_data({"Max", "Performance"})
        t.Feature["Lobby Spawn Vehicle Godmode"] =
            menu.add_feature(
            "Godmode",
            "toggle",
            t.Parent["Lobby Spawn Vehicle Settings"],
            function(V)
                c["Lobby Spawn Vehicle Godmode"] = {Enabled = V.on}
            end
        )
        t.Feature["Lobby Spawn Vehicle Lockon"] =
            menu.add_feature(
            "Lock-on Disabled",
            "toggle",
            t.Parent["Lobby Spawn Vehicle Settings"],
            function(V)
                c["Lobby Spawn Vehicle Lockon"] = {Enabled = V.on}
            end
        )
        t.Feature["Spawn Vehicle for All"] =
            menu.add_feature(
            "Model/Hash Input",
            "action",
            t.Parent["Lobby Spawn Vehicles"],
            function()
                local dP = k.Input("Enter Vehicle Name, Model Name or Hash")
                if not dP then
                    z("Input canceled.", "Error", "")
                    return
                end
                local ax = dP
                if not tonumber(dP) then
                    if s.veh.GetHashFromName(dP) ~= nil then
                        ax = s.veh.GetHashFromName(dP)
                    else
                        ax = gameplay.get_hash_key(dP)
                    end
                end
                if not streaming.is_model_a_vehicle(ax) then
                    z("Input is not a valid vehicle.", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if player.is_player_valid(bB) and bB ~= player.player_id() and not k.GodmodeState(bB) then
                        local aV = k.PlayerCoords(bB)
                        aV.z = m.GetGroundZ(aV.x, aV.y)
                        local bo = n.Vehicle(ax, l.OffsetCoords(aV, k.PlayerHeading(bB), 10))
                        l.request_ctrl(bo)
                        decorator.decor_set_int(bo, "MPBitset", 1 << 10)
                        if t.Feature["Lobby Spawn Vehicle Upgraded"].on then
                            l.MaxVehicle(bo, t.Feature["Lobby Spawn Vehicle Upgraded"].value + 1)
                        end
                        if t.Feature["Lobby Spawn Vehicle Godmode"].on then
                            entity.set_entity_god_mode(bo, true)
                        end
                        if t.Feature["Lobby Spawn Vehicle Lockon"].on then
                            vehicle.set_vehicle_can_be_locked_on(bo, false, false)
                        end
                    end
                end
            end
        )
        t.Parent["Lobby CEO Money"] =
            menu.add_feature(
            "CEO Money",
            "parent",
            t.Parent["Lobby Friendly"],
            function()
                if not t.Feature["Disable Warning Messages"].on then
                    z(
                        "Only Players who are an associate in any Organisation will receive the Money.\nEnabling multiple Loops at once can cause Transaction Errors!",
                        "Neutral"
                    )
                    coroutine.yield(5000)
                end
            end
        ).id
        t.Feature["Lobby CEO Loop Preset"] =
            menu.add_feature(
            "Preset",
            "toggle",
            t.Parent["Lobby CEO Money"],
            function(V)
                menu.create_thread(
                    function()
                        while V.on do
                            for bB = 0, 31 do
                                if l.valid_player(bB, false) and r.IsPlayerAssociate(bB) then
                                    r.Send(
                                        "CEO Money",
                                        {player.player_id(), 10000, -1292453789, 1, r.MainGlobal(bB), r.GlobalPair()},
                                        bB
                                    )
                                end
                            end
                            coroutine.yield(40000)
                        end
                    end,
                    nil
                )
                coroutine.yield(5000)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, false) and r.IsPlayerAssociate(bB) then
                            r.Send(
                                "CEO Money",
                                {player.player_id(), 30000, 198210293, 1, r.MainGlobal(bB), r.GlobalPair()},
                                bB
                            )
                        end
                    end
                    coroutine.yield(150000)
                end
            end
        )
        for j = 1, #aq.ceomoney do
            t.Feature["Lobby CEO Loop " .. j] =
                menu.add_feature(
                aq.ceomoney[j][1] .. " (ms)",
                "value_i",
                t.Parent["Lobby CEO Money"],
                function(V)
                    c["Lobby CEO Loop " .. j] = {Value = V.value}
                    while V.on do
                        for bB = 0, 31 do
                            if l.valid_player(bB, false) and r.IsPlayerAssociate(bB) then
                                r.Send(
                                    "CEO Money",
                                    {
                                        player.player_id(),
                                        aq.ceomoney[j][2],
                                        aq.ceomoney[j][3],
                                        aq.ceomoney[j][4],
                                        r.MainGlobal(bB),
                                        r.GlobalPair()
                                    },
                                    bB
                                )
                            end
                        end
                        c["Lobby CEO Loop " .. j].Value = V.value
                        coroutine.yield(V.value)
                    end
                end
            )
            t.Feature["Lobby CEO Loop " .. j].min = 10000
            t.Feature["Lobby CEO Loop " .. j].max = 300000
            t.Feature["Lobby CEO Loop " .. j].mod = 10000
            t.Feature["Lobby CEO Loop " .. j].value = aq.ceomoney[j][5]
        end
        t.Feature["Lobby Off The Radar"] =
            menu.add_feature(
            "Off The Radar",
            "action",
            t.Parent["Lobby Friendly"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, false) and not r.IsPlayerOTR(bB) then
                        r.Send(
                            "Off The Radar",
                            {player.player_id(), utils.time() - 60, utils.time(), 1, 1, r.MainGlobal(bB)},
                            bB
                        )
                    end
                end
            end
        )
        t.Feature["Lobby Off The Radar Loop"] =
            menu.add_feature(
            "Off The Radar",
            "toggle",
            t.Parent["Lobby Friendly"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, false) and not r.IsPlayerOTR(bB) then
                            r.Send(
                                "Off The Radar",
                                {player.player_id(), utils.time() - 60, utils.time(), 1, 1, r.MainGlobal(bB)},
                                bB
                            )
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Lobby Bribe Authorities"] =
            menu.add_feature(
            "Bribe Authorities",
            "toggle",
            t.Parent["Lobby Friendly"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send(
                                "Bribe Authorities",
                                {player.player_id(), 0, 0, utils.time_ms(), 0, r.MainGlobal(bB)},
                                bB
                            )
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Lobby Remove Wanted"] =
            menu.add_feature(
            "Remove Wanted",
            "toggle",
            t.Parent["Lobby Friendly"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if
                            l.valid_player(bB, t.Feature["Exclude Friends"].on) and
                                player.get_player_wanted_level(bB) > 0
                         then
                            r.Send("Remove Wanted", {player.player_id(), r.MainGlobal(bB)}, bB)
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Parent["Chat Commands"] = menu.add_feature("Chat Commands", "parent", t.Parent["local_lobby"], nil).id
        t.Feature["Enable Commands"] =
            menu.add_feature(
            "Enable Chat Commands",
            "value_str",
            t.Parent["Chat Commands"],
            function(V)
                c["Enable Commands"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Enable Commands"]:set_str_data({"All Players", "Friends Only"})
        t.Feature["Block Friends as Target"] =
            menu.add_feature(
            "Block Friends as Target",
            "toggle",
            t.Parent["Chat Commands"],
            function(V)
                c["Block Friends as Target"] = {Enabled = V.on}
            end
        )
        t.Parent["Command List"] = menu.add_feature("Command List", "parent", t.Parent["Chat Commands"], nil).id
        for j = 1, #Y.all do
            t.Feature[Y.all[j][1]] =
                menu.add_feature(
                Y.all[j][2],
                "toggle",
                t.Parent["Command List"],
                function(V)
                    c[Y.all[j][1]] = {Enabled = V.on}
                end
            )
        end
        t.Parent["Commands for Self"] =
            menu.add_feature("Self Only Commands", "parent", t.Parent["Chat Commands"], nil).id
        for j = 1, #Y.self do
            t.Feature[Y.self[j][1]] =
                menu.add_feature(
                Y.self[j][2],
                "toggle",
                t.Parent["Commands for Self"],
                function(V)
                    c[Y.self[j][1]] = {Enabled = V.on}
                end
            )
        end
        t.Feature["Send Chat Commands"] =
            menu.add_feature(
            "Send Active Commands in Chat",
            "action_value_str",
            t.Parent["Chat Commands"],
            function(V)
                if not t.Feature["Enable Commands"].on then
                    z("Chat Commands are not enabled!", "Error", "")
                    return
                end
                local e3 = {}
                for j = 1, #Y.all do
                    if t.Feature[Y.all[j][1]].on then
                        e3[j] = Y.all[j][2]
                    end
                end
                if #e3 == 0 then
                    z("No active Commands!", "Error", "")
                    return
                end
                if V.value == 0 then
                    network.send_chat_message(
                        "Active Chat Commands for this Session:" .. l.print_table(e3):sub(1, -3),
                        false
                    )
                    return
                end
                network.send_chat_message(
                    "Active Chat Commands for this Session:" .. l.print_table(e3):sub(1, -3),
                    true
                )
            end
        )
        t.Feature["Send Chat Commands"]:set_str_data({"All", "Team"})
        t.Feature["Continuously Send Commands"] =
            menu.add_feature(
            "Send Commands Repeatedly (Min)",
            "value_i",
            t.Parent["Chat Commands"],
            function(V)
                while V.on do
                    if t.Feature["Enable Commands"].on then
                        z("Chat Commands are not enabled!", "Error", "")
                        V.on = false
                        return
                    end
                    local e3 = {}
                    for j = 1, #Y.all do
                        if t.Feature[Y.all[j][1]].on then
                            e3[j] = Y.all[j][2]
                        end
                    end
                    if #e3 == 0 then
                        z("No active Commands!", "Error", "")
                        V.on = false
                        return
                    end
                    network.send_chat_message("Active Chat Commands for this Session:" .. l.print_table(e3), false)
                    coroutine.yield(V.value * 60000)
                end
            end
        )
        t.Feature["Continuously Send Commands"].min = 5
        t.Feature["Continuously Send Commands"].max = 60
        t.Feature["Continuously Send Commands"].mod = 5
        t.Parent["Chat Spam"] = menu.add_feature("Chat Spam", "parent", t.Parent["local_lobby"], nil).id
        t.Feature["Disable Chat"] =
            menu.add_feature(
            "Disable Chat",
            "toggle",
            t.Parent["Chat Spam"],
            function(V)
                while V.on do
                    network.send_chat_message(" ", false)
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Chat Spam Delay"] =
            menu.add_feature(
            "Spam Delay (ms)",
            "autoaction_value_i",
            t.Parent["Chat Spam"],
            function(V)
                c["Chat Spam Delay"] = {Value = V.value}
            end
        )
        t.Feature["Chat Spam Delay"].min = 100
        t.Feature["Chat Spam Delay"].max = 10000
        t.Feature["Chat Spam Delay"].mod = 100
        t.Feature["Chat Spamer"] =
            menu.add_feature(
            "Chat Spam",
            "toggle",
            t.Parent["Chat Spam"],
            function(V)
                local e4 = k.Input("Enter message to spam", 250)
                if not e4 then
                    z("Input canceled.", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    network.send_chat_message(e4, false)
                    coroutine.yield(t.Feature["Chat Spam Delay"].value)
                end
            end
        )
        t.Feature["Spam Text from Clipboard"] =
            menu.add_feature(
            "Spam Text from Clipboard",
            "toggle",
            t.Parent["Chat Spam"],
            function(V)
                while V.on do
                    network.send_chat_message(utils.from_clipboard(), false)
                    coroutine.yield(t.Feature["Chat Spam Delay"].value)
                end
            end
        )
        t.Feature["Send Text from Clipboard"] =
            menu.add_feature(
            "Paste Text from Clipboard",
            "action",
            t.Parent["Chat Spam"],
            function()
                network.send_chat_message(utils.from_clipboard(), false)
            end
        )
        t.Feature["Echo Chat"] =
            menu.add_feature(
            "Echo Chat X times",
            "value_i",
            t.Parent["Chat Spam"],
            function(V)
                c["Echo Chat"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Echo Chat"].min = 1
        t.Feature["Echo Chat"].max = 10
        t.Parent["Lobby SMS Sender"] = menu.add_feature("SMS Sender", "parent", t.Parent["local_lobby"]).id
        t.Feature["Lobby Send Custom SMS"] =
            menu.add_feature(
            "Send SMS: Input",
            "action",
            t.Parent["Lobby SMS Sender"],
            function(V)
                local e5 = k.Input("Enter message to send")
                if not e5 then
                    z("Input canceled.", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB) then
                        player.send_player_sms(bB, e5)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Lobby Send SCID And IP"] =
            menu.add_feature(
            "Send their SCID & IP",
            "action",
            t.Parent["Lobby SMS Sender"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB) then
                        player.send_player_sms(
                            bB,
                            "~g~Name: " ..
                                k.Name(bB) .. "~n~~y~R*SCID: " .. tostring(k.SCID(bB)) .. "~n~~r~IP: " .. k.IP(bB)
                        )
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["SMS Delay"] =
            menu.add_feature(
            "Spam Delay (ms)",
            "autoaction_value_i",
            t.Parent["Lobby SMS Sender"],
            function(V)
                c["SMS Delay"] = {Value = V.value}
            end
        )
        t.Feature["SMS Delay"].min = 100
        t.Feature["SMS Delay"].max = 10000
        t.Feature["SMS Delay"].mod = 100
        t.Feature["Lobby Spam Custom SMS"] =
            menu.add_feature(
            "Spam SMS: Input",
            "toggle",
            t.Parent["Lobby SMS Sender"],
            function(V)
                local e4 = k.Input("Enter message to spam")
                if not e4 then
                    z("Input canceled.", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            player.send_player_sms(bB, e4)
                        end
                    end
                    coroutine.yield(t.Feature["SMS Delay"].value)
                end
            end
        )
        t.Feature["Lobby Spam SCID And IP"] =
            menu.add_feature(
            "Spam their SCID & IP",
            "toggle",
            t.Parent["Lobby SMS Sender"],
            function(V)
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            player.send_player_sms(
                                bB,
                                "~g~Name: " ..
                                    k.Name(bB) .. "~n~~y~R*SCID: " .. tostring(k.SCID(bB)) .. "~n~~r~IP: " .. k.IP(bB)
                            )
                        end
                    end
                    coroutine.yield(t.Feature["SMS Delay"].value)
                end
            end
        )
        t.Parent["Lobby SMS Spam Presets"] =
            menu.add_feature("Spam Presets", "parent", t.Parent["Lobby SMS Sender"], nil).id
        for j = 1, #p.sms_texts do
            menu.add_feature(
                p.sms_texts[j],
                "toggle",
                t.Parent["Lobby SMS Spam Presets"],
                function(V)
                    while V.on do
                        for aD = 0, 31 do
                            if l.valid_player(aD, t.Feature["Exclude Friends"].on) then
                                player.send_player_sms(aD, p.sms_texts[j])
                            end
                        end
                        coroutine.yield(t.Feature["SMS Delay"].value)
                    end
                end
            )
        end
        t.Parent["Lobby Miscellaneous"] = menu.add_feature("Miscellaneous", "parent", t.Parent["local_lobby"], nil).id
        local e6 = {
            ["NONE"] = 0,
            ["CENTER"] = 1 << 0,
            ["SHADOW"] = 1 << 1,
            ["VCENTER"] = 1 << 2,
            ["BOTTOM"] = 1 << 3,
            ["JUSTIFY_RIGHT"] = 1 << 4
        }
        t.Parent["Player Bar"] = menu.add_feature("Player Bar v1", "parent", t.Parent["Lobby Miscellaneous"], nil).id
        t.Feature["Enable Player Bar"] =
            menu.add_feature(
            "Enable",
            "toggle",
            t.Parent["Player Bar"],
            function(V)
                aI({"Enable Player Bar v2"})
                c["Enable Player Bar"] = {Enabled = V.on}
                while V.on do
                    local e7, e8, e9
                    if t.Feature["Player Bar Text Allign"].value == 0 then
                        e7 = e6["SHADOW"]
                        e8 = v2(-0.98, 0.93)
                        e9 = v2(-0.98, 0.98)
                    else
                        e7 = e6["CENTER"]
                        e8 = v2(-0.5, 0.93)
                        e9 = v2(-0.5, 0.98)
                    end
                    if t.Feature["Player Bar Background"].on then
                        if t.Feature["Player Bar Current Time"].on and t.Feature["Player Bar Players"].on then
                            scriptdraw.draw_rect(
                                v2(1, 1),
                                v2(5, 0.38),
                                m.RGBAToInt(10, 10, 10, t.Feature["Player Bar Background"].value)
                            )
                        elseif t.Feature["Player Bar Players"].on then
                            scriptdraw.draw_rect(
                                v2(1, 1),
                                v2(5, 0.32),
                                m.RGBAToInt(10, 10, 10, t.Feature["Player Bar Background"].value)
                            )
                        else
                            scriptdraw.draw_rect(
                                v2(1, 1),
                                v2(5, 0.12),
                                m.RGBAToInt(10, 10, 10, t.Feature["Player Bar Background"].value)
                            )
                        end
                    end
                    local be =
                        m.RGBAToInt(
                        t.Feature["Player Bar Text Red"].value,
                        t.Feature["Player Bar Text Green"].value,
                        t.Feature["Player Bar Text Blue"].value,
                        255
                    )
                    if t.Feature["Player Bar Current Time"].on then
                        scriptdraw.draw_text(m.TimePrefix(), v2(-0.5, 0.98), v2(1, 1), 0.6, be, e6["CENTER"])
                    end
                    if t.Feature["Player Bar Script Version"].on then
                        scriptdraw.draw_text("Version " .. _2t1s, v2(0.88, 0.98), v2(1, 1), 0.6, be, e6["SHADOW"])
                    end
                    if t.Feature["Player Bar Players"].on then
                        local ea = {}
                        for bB = 0, 29 do
                            local O, bC
                            if not player.is_player_valid(bB) then
                                goto ca
                            end
                            O = k.Name(bB)
                            bC = " ["
                            if bB == player.player_id() and t.Feature["Player Bar Y"].on then
                                bC = bC .. "Y"
                            end
                            if player.is_player_modder(bB, -1) and t.Feature["Player Bar M"].on then
                                bC = bC .. "M"
                            end
                            if player.is_player_host(bB) and t.Feature["Player Bar H"].on then
                                bC = bC .. "H"
                            end
                            if script.get_host_of_this_script() == bB and t.Feature["Player Bar S"].on then
                                bC = bC .. "S"
                            end
                            if player.is_player_god(bB) and t.Feature["Player Bar G"].on then
                                bC = bC .. "G"
                            end
                            for j = 1, #c4 do
                                if c4[j] == O and t.Feature["Player Bar T"].on then
                                    bC = bC .. "T"
                                end
                            end
                            bC = bC .. "]   "
                            if bC == " []   " then
                                ea[O] = O .. "   "
                            else
                                ea[O] = O .. bC
                            end
                            ::ca::
                        end
                        local eb
                        local ec = l.print_table(ea, 3):sub(1, -3)
                        if string.len(ec) < 400 then
                            eb = 0.6
                        else
                            eb = 0.55
                        end
                        if t.Feature["Player Bar Current Time"].on then
                            scriptdraw.draw_text(ec, e8, v2(1, 1), eb, be, e7)
                        else
                            scriptdraw.draw_text(ec, e9, v2(1, 1), eb, be, e7)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Enable Player Bar"].Enabled = V.on
            end
        )
        t.Parent["Player Bar Tags"] = menu.add_feature("Player tags", "parent", t.Parent["Player Bar"], nil).id
        t.Feature["Player Bar Y"] =
            menu.add_feature(
            "Y = Yourself",
            "toggle",
            t.Parent["Player Bar Tags"],
            function(V)
                c["Player Bar Y"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Bar M"] =
            menu.add_feature(
            "M = Modder",
            "toggle",
            t.Parent["Player Bar Tags"],
            function(V)
                c["Player Bar M"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Bar H"] =
            menu.add_feature(
            "H = Session Host",
            "toggle",
            t.Parent["Player Bar Tags"],
            function(V)
                c["Player Bar H"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Bar S"] =
            menu.add_feature(
            "S = Script Host",
            "toggle",
            t.Parent["Player Bar Tags"],
            function(V)
                c["Player Bar S"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Bar G"] =
            menu.add_feature(
            "G = God",
            "toggle",
            t.Parent["Player Bar Tags"],
            function(V)
                c["Player Bar G"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Bar T"] =
            menu.add_feature(
            "T = Typing",
            "toggle",
            t.Parent["Player Bar Tags"],
            function(V)
                c["Player Bar T"] = {Enabled = V.on}
            end
        )
        t.Parent["Player Bar Settings"] = menu.add_feature("Settings", "parent", t.Parent["Player Bar"], nil).id
        t.Feature["Player Bar Background"] =
            menu.add_feature(
            "Background Opacity",
            "value_i",
            t.Parent["Player Bar Settings"],
            function(V)
                c["Player Bar Background"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Player Bar Background"].min = 5
        t.Feature["Player Bar Background"].max = 255
        t.Feature["Player Bar Background"].mod = 5
        t.Feature["Player Bar Background"].value = 120
        t.Feature["Player Bar Text Allign"] =
            menu.add_feature(
            "Text Allign",
            "autoaction_value_str",
            t.Parent["Player Bar Settings"],
            function(V)
                c["Player Bar Text Allign"] = {Value = V.value}
            end
        )
        t.Feature["Player Bar Text Allign"]:set_str_data({"Left", "Center"})
        t.Feature["Player Bar Text Red"] =
            menu.add_feature(
            "Text Color Red",
            "autoaction_value_i",
            t.Parent["Player Bar Settings"],
            function(V)
                c["Player Bar Text Red"] = {Value = V.value}
            end
        )
        t.Feature["Player Bar Text Red"].min = 0
        t.Feature["Player Bar Text Red"].max = 255
        t.Feature["Player Bar Text Red"].mod = 5
        t.Feature["Player Bar Text Red"].value = 255
        t.Feature["Player Bar Text Blue"] =
            menu.add_feature(
            "Text Color Blue",
            "autoaction_value_i",
            t.Parent["Player Bar Settings"],
            function(V)
                c["Player Bar Text Blue"] = {Value = V.value}
            end
        )
        t.Feature["Player Bar Text Blue"].min = 0
        t.Feature["Player Bar Text Blue"].max = 255
        t.Feature["Player Bar Text Blue"].mod = 5
        t.Feature["Player Bar Text Blue"].value = 255
        t.Feature["Player Bar Text Green"] =
            menu.add_feature(
            "Text Color Green",
            "autoaction_value_i",
            t.Parent["Player Bar Settings"],
            function(V)
                c["Player Bar Text Green"] = {Value = V.value}
            end
        )
        t.Feature["Player Bar Text Green"].min = 0
        t.Feature["Player Bar Text Green"].max = 255
        t.Feature["Player Bar Text Green"].mod = 5
        t.Feature["Player Bar Text Green"].value = 255
        t.Feature["Player Bar Players"] =
            menu.add_feature(
            "Display Players",
            "toggle",
            t.Parent["Player Bar"],
            function(V)
                c["Player Bar Players"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Bar Current Time"] =
            menu.add_feature(
            "Display Current Time",
            "toggle",
            t.Parent["Player Bar"],
            function(V)
                c["Player Bar Current Time"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Bar Script Version"] =
            menu.add_feature(
            "Display Script Version",
            "toggle",
            t.Parent["Player Bar"],
            function(V)
                c["Player Bar Script Version"] = {Enabled = V.on}
            end
        )
        t.Parent["Player Bar v2"] = menu.add_feature("Player Bar v2", "parent", t.Parent["Lobby Miscellaneous"], nil).id
        t.Feature["Enable Player Bar v2"] =
            menu.add_feature(
            "Enable",
            "value_str",
            t.Parent["Player Bar v2"],
            function(V)
                t.Feature["Enable Player Bar"].on = false
                c["Enable Player Bar v2"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    if ar() < 16 and V.value == 0 then
                        scriptdraw.draw_rect(v2(1, 1), v2(5, 0.075), m.RGBAToInt(10, 10, 10, 220))
                        scriptdraw.draw_text(
                            m.TimePrefix(),
                            v2(-0.5, 0.955),
                            v2(1, 1),
                            0.5,
                            m.RGBAToInt(255, 255, 255, 255),
                            e6["CENTER"],
                            8
                        )
                    else
                        scriptdraw.draw_rect(v2(1, 1), v2(5, 0.15), m.RGBAToInt(10, 10, 10, 220))
                        scriptdraw.draw_text(
                            m.TimePrefix(),
                            v2(-0.5, 0.922),
                            v2(1, 1),
                            0.5,
                            m.RGBAToInt(255, 255, 255, 255),
                            e6["CENTER"],
                            8
                        )
                    end
                    local aV = v2(-0.99, 0.992)
                    local ed = 0
                    for j = 0, 31 do
                        if player.is_player_valid(j) then
                            local O = k.Name(j)
                            local ee
                            for j = 1, #c4 do
                                if c4[j] == O then
                                    ee = true
                                end
                            end
                            local be
                            if j == script.get_host_of_this_script() then
                                be = m.RGBAToInt(15, 150, 200, 255)
                            elseif j == player.player_id() or player.is_player_friend(j) then
                                be = m.RGBAToInt(106, 82, 182, 255)
                            elseif player.is_player_modder(j, -1) then
                                be = m.RGBAToInt(189, 43, 43, 255)
                            elseif player.get_player_health(j) == 0 or not player.is_player_playing(j) then
                                be = m.RGBAToInt(128, 128, 128, 255)
                            elseif ee then
                                be = m.RGBAToInt(183, 152, 61, 255)
                            else
                                be = m.RGBAToInt(255, 255, 255, 255)
                            end
                            scriptdraw.draw_text(O, aV, v2(1, 1), 0.5, be, e6["SHADOW"], 8)
                            if player.is_player_host(j) then
                                scriptdraw.draw_text(O, aV + v2(-0.001, 0.001), v2(1, 1), 0.5, be, e6["SHADOW"], 8)
                            end
                        end
                        if player.is_player_valid(j) or V.value ~= 0 then
                            aV.x = aV.x + 0.122
                            ed = ed + 1
                            if ed == 16 then
                                aV.x = -0.99
                                aV.y = 0.962
                            end
                        end
                    end
                    c["Enable Player Bar v2"].Value = V.value
                    coroutine.yield(0)
                end
                c["Enable Player Bar v2"].Enabled = V.on
            end
        )
        t.Feature["Enable Player Bar v2"]:set_str_data({"Dynamic", "Static"})
        t.Parent["Player Bar v2 Tags"] = menu.add_feature("Player Colors", "parent", t.Parent["Player Bar v2"], nil).id
        t.Feature["Player Bar White"] =
            menu.add_feature("White = Regular Player", "action", t.Parent["Player Bar v2 Tags"])
        t.Feature["Player Bar Thick"] =
            menu.add_feature("Thick = Session Host", "action", t.Parent["Player Bar v2 Tags"])
        t.Feature["Player Bar Blue"] = menu.add_feature("Blue = Script Host", "action", t.Parent["Player Bar v2 Tags"])
        t.Feature["Player Bar Purple"] =
            menu.add_feature("Purple = Yourself & Friends", "action", t.Parent["Player Bar v2 Tags"])
        t.Feature["Player Bar Gray"] =
            menu.add_feature("Gray = Dead/Inactive", "action", t.Parent["Player Bar v2 Tags"])
        t.Feature["Player Bar Yellow"] =
            menu.add_feature("Yellow = Typing/Talking", "action", t.Parent["Player Bar v2 Tags"])
        t.Feature["Player Bar Red"] = menu.add_feature("Red = Modder", "action", t.Parent["Player Bar v2 Tags"])
        t.Parent["Lobby Custom SE"] =
            menu.add_feature("Custom Script Events", "parent", t.Parent["Lobby Miscellaneous"], nil).id
        t.Feature["Lobby Custom SE Input"] =
            menu.add_feature(
            "Send Script Event: Input",
            "action",
            t.Parent["Lobby Custom SE"],
            function(V)
                local c7 = {}
                local dP
                local ef = k.Input("Enter Custom Script Event (DEC)", 32, 3)
                if not ef then
                    z("Input canceled.", "Error", "")
                    return
                end
                while dP ~= "#" do
                    dP = k.Input("Enter Parameter (DEC), to EXIT and send, enter #", 32, 0)
                    if not dP then
                        return
                    end
                    if dP == "#" then
                        break
                    end
                    dP = tonumber(dP)
                    if type(dP) == "number" then
                        c7[#c7 + 1] = dP
                    else
                        return
                    end
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.Send(ef, c7, bB)
                    end
                end
                z("Sent Custom Script Event to Players.", "Success")
            end
        )
        for j = 1, #p.custom_script_events do
            menu.add_feature(
                p.custom_script_events[j].Name,
                "action",
                t.Parent["Lobby Custom SE"],
                function()
                    z("Sent Custom Script Event to Players.", "Success")
                    for bB = 0, 31 do
                        for eg = 1, #p.custom_script_events[j].Events do
                            if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                                r.Send(
                                    p.custom_script_events[j].Events[eg].Hash,
                                    p.custom_script_events[j].Events[eg].Args,
                                    bB
                                )
                            end
                        end
                    end
                end
            )
        end
        t.Feature["Laser Beam Waypoint"] =
            menu.add_feature(
            "Laser Beam Explode Waypoint",
            "action",
            t.Parent["Lobby Miscellaneous"],
            function()
                local eh = ui.get_waypoint_coord()
                if eh.x == 16000 then
                    z("No Waypoint found!", "Error", "")
                    return
                end
                local ei = k.OwnCoords().z + 175
                for j = ei, -50, -2 do
                    local aV = v3(eh.x, eh.y, j)
                    aV.x = math.floor(aV.x)
                    aV.y = math.floor(aV.y)
                    fire.add_explosion(aV, 59, true, false, 0, 0)
                    for eg = 1, 2 do
                        aV.x = math.random(aV.x - 3, aV.x + 3)
                        aV.y = math.random(aV.y - 3, aV.y + 3)
                        fire.add_explosion(aV, 59, true, false, 0, 0)
                    end
                    aV.x = math.random(aV.x - 6, aV.x + 6)
                    aV.y = math.random(aV.y - 6, aV.y + 6)
                    fire.add_explosion(aV, 8, true, false, 0, 0)
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Lobby Shake Cam"] =
            menu.add_feature(
            "Shake Cam",
            "toggle",
            t.Parent["Lobby Miscellaneous"],
            function(V)
                while V.on do
                    local aV = v3()
                    for j = 1, 10 do
                        aV.x = math.random(-2700, 2700)
                        aV.y = math.random(-3300, 7500)
                        aV.z = m.GetGroundZ(aV.x, aV.y) + math.random(30, 90)
                        fire.add_explosion(aV, 8, false, true, 20, 0)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Mark OTR Blip"] =
            menu.add_feature(
            "Mark OTR Players On Map",
            "toggle",
            t.Parent["Lobby Miscellaneous"],
            function(V)
                c["Mark OTR Blip"] = {Enabled = V.on}
                local cV = {}
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_player(bB, false) and r.IsPlayerOTR(bB) then
                            if not cV[bB] or menu.has_thread_finished(cV[bB]) then
                                cV[bB] =
                                    menu.create_thread(
                                    function(c6)
                                        ao.OTR[c6] = ui.add_blip_for_entity(k.PlayerPed(c6))
                                        ui.set_blip_sprite(ao.OTR[c6], 484)
                                        ui.set_blip_colour(ao.OTR[c6], 0)
                                        while player.is_player_valid(c6) and r.IsPlayerOTR(c6) do
                                            coroutine.yield(0)
                                        end
                                        if ao.OTR[c6] then
                                            ui.remove_blip(ao.OTR[c6])
                                            ao.OTR[c6] = nil
                                        end
                                    end,
                                    bB
                                )
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                c["Mark OTR Blip"].Enabled = V.on
            end
        )
        t.Feature["Notify Spectating Players"] =
            menu.add_feature(
            "Notify Spectating Players",
            "toggle",
            t.Parent["Lobby Miscellaneous"],
            function(V)
                c["Notify Spectating Players"] = {Enabled = V.on}
                local cV = {}
                while V.on do
                    for bB = 0, 31 do
                        if
                            player.is_player_valid(bB) and not bB == player.player_id() and
                                network.get_player_player_is_spectating(bB) ~= nil
                         then
                            if not cV[bB] or menu.has_thread_finished(cV[bB]) then
                                cV[bB] =
                                    menu.create_thread(
                                    function(c6)
                                        local ej = network.get_player_player_is_spectating(c6)
                                        local L = k.Name(c6)
                                        z(L .. " started spectating " .. k.Name(ej), "Neutral", "")
                                        while player.is_player_valid(c6) and
                                            network.get_player_player_is_spectating(c6) ~= nil do
                                            coroutine.yield(0)
                                        end
                                        z(L .. " stopped spectating " .. k.Name(ej), "Neutral", "")
                                    end,
                                    bB
                                )
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                c["Notify Spectating Players"].Enabled = V.on
            end
        )
        t.Feature["Notify Script-Host Migrations"] =
            menu.add_feature(
            "Notify Script Host Migrations",
            "toggle",
            t.Parent["Lobby Miscellaneous"],
            function(V)
                c["Notify Script-Host Migrations"] = {Enabled = V.on}
                while V.on do
                    local ek = script.get_host_of_this_script()
                    local L = k.Name(ek)
                    local el = L
                    while ek == script.get_host_of_this_script() do
                        coroutine.yield(500)
                    end
                    local em = script.get_host_of_this_script()
                    local en = k.Name(em)
                    while en == "Invalid Player" do
                        en = k.Name(script.get_host_of_this_script())
                        coroutine.yield(0)
                    end
                    if en == el then
                        return
                    end
                    if L == "Invalid Player" then
                        C("Script Host migrated to " .. en)
                        z("Script Host migrated to " .. en, "Neutral", "")
                    else
                        C("Script Host migrated from " .. L .. " to " .. en .. ".")
                        z("Script Host migrated from " .. L .. " to " .. en .. ".", "Neutral", "")
                    end
                    coroutine.yield(0)
                end
                c["Notify Script-Host Migrations"].Enabled = V.on
            end
        )
        t.Feature["Notify Host Migrations"] =
            menu.add_feature(
            "Notify Session Host Migrations",
            "toggle",
            t.Parent["Lobby Miscellaneous"],
            function(V)
                c["Notify Host Migrations"] = {Enabled = V.on}
                while V.on do
                    local ek = player.get_host()
                    local L = k.Name(ek)
                    local el = L
                    while ek == player.get_host() do
                        coroutine.yield(500)
                    end
                    local em = player.get_host()
                    local en = k.Name(em)
                    while en == "Invalid Player" do
                        en = k.Name(player.get_host())
                        coroutine.yield(0)
                    end
                    if en == el then
                        return
                    end
                    if L == "Invalid Player" then
                        C("Session Host migrated to " .. en)
                        z("Session Host migrated to " .. en, "Neutral", "")
                    else
                        C("Session Host migrated from " .. L .. " to " .. en .. ".")
                        z("Session Host migrated from " .. L .. " to " .. en .. ".", "Neutral", "")
                    end
                    coroutine.yield(0)
                end
                c["Notify Host Migrations"].Enabled = V.on
            end
        )
        t.Parent["Lobby Malicious"] = menu.add_feature("Malicious", "parent", t.Parent["local_lobby"], nil).id
        t.Feature["Force Host"] =
            menu.add_feature(
            "Force Host",
            "value_str",
            t.Parent["Lobby Malicious"],
            function(V)
                if network.network_is_host() then
                    z("You are already Session Host!", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    local eo = player.get_host()
                    if eo == player.player_id() then
                        z("You are now Session Host.\nTurning off Feature.", "Success", "2Take1Script Force Host")
                        V.on = false
                        return
                    elseif player.is_player_friend(eo) and t.Feature["Exclude Friends"].on then
                        z(
                            "One of your Friends is Session Host.\nTurning off Feature.",
                            "Success",
                            "2Take1Script Force Host"
                        )
                        V.on = false
                        return
                    else
                        if V.value == 0 then
                            r.kick(eo)
                        else
                            network.force_remove_player(eo)
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Force Host"]:set_str_data({"Script Kick", "Desync Kick"})
        t.Feature["Kick Random Player"] =
            menu.add_feature(
            "Kick Random Player",
            "action_value_str",
            t.Parent["Lobby Malicious"],
            function(V)
                local ep = {}
                local eq = false
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        ep[#ep + 1] = bB
                    end
                end
                if #ep == 0 then
                    z("No valid Players found.", "Error", "")
                    return
                end
                while not eq do
                    local er = ep[math.random(#ep)]
                    if l.valid_player(er, t.Feature["Exclude Friends"].on) then
                        z(k.Name(er) .. " has been chosen as random player and got kicked.", "Success")
                        if V.value == 0 then
                            r.kick(er)
                        else
                            network.force_remove_player(er)
                        end
                        eq = true
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Kick Random Player"]:set_str_data({"Script Kick", "Desync Kick"})
        t.Feature["Lobby Script Event Kick"] =
            menu.add_feature(
            "Script Event Kick",
            "action",
            t.Parent["Lobby Malicious"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.kick(bB)
                        coroutine.yield(0)
                    end
                end
            end
        )
        t.Feature["Lobby Desync Kick"] =
            menu.add_feature(
            "Desync Kick",
            "action",
            t.Parent["Lobby Malicious"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        network.force_remove_player(bB)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Lobby Host Kick"] =
            menu.add_feature(
            "Host Kick",
            "action",
            t.Parent["Lobby Malicious"],
            function()
                if not network.network_is_host() then
                    z("You are not Session Host!", "Error", "")
                    return
                end
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        network.network_session_kick_player(bB)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Lobby Script Host Curse"] =
            menu.add_feature(
            "Script Host Curse",
            "action_value_str",
            t.Parent["Lobby Malicious"],
            function(V)
                if script.get_host_of_this_script() == player.player_id() then
                    z("This doesnt work while you are Script Host!", "Error", "")
                    return
                end
                r.curse(V.value + 1)
            end
        )
        t.Feature["Lobby Script Host Curse"]:set_str_data({"v1", "v2", "v3"})
        t.Feature["Lobby Break"] =
            menu.add_feature(
            "Break Lobby",
            "action_value_str",
            t.Parent["Lobby Malicious"],
            function(V)
                if script.get_host_of_this_script() == player.player_id() then
                    z("This doesnt work while you are Script Host!", "Error", "")
                    return
                end
                if V.value == 0 then
                    for bB = 0, 31 do
                        if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                            r.Send("Start CEO Mission", {player.player_id(), 0, 1}, bB)
                        end
                    end
                    return
                end
                r.Send("Start CEO Mission", {player.player_id(), 0, 1}, player.player_id())
            end
        )
        t.Feature["Lobby Break"]:set_str_data({"v1", "v2"})
        t.Feature["Lobby Script Event Crash"] =
            menu.add_feature(
            "Script Event Crash",
            "action",
            t.Parent["Lobby Malicious"],
            function(V)
                for bB = 0, 31 do
                    if l.valid_player(bB, t.Feature["Exclude Friends"].on) then
                        r.crash(bB)
                        coroutine.yield(0)
                    end
                end
            end
        )
        t.Feature["Lobby Net Event Crash"] =
            menu.add_feature(
            "Net Event Crash",
            "action",
            t.Parent["Lobby Malicious"],
            function(V)
                local dW = {
                    {Name = "ROUND_ENDING_STINGER_CUSTOM", Ref = "CELEBRATION_SOUNDSET"},
                    {Name = "Object_Dropped_Remote", Ref = "GTAO_FM_Events_Soundset"},
                    {Name = "Oneshot_Final", Ref = "MP_MISSION_COUNTDOWN_SOUNDSET"},
                    {Name = "5s", Ref = "MP_MISSION_COUNTDOWN_SOUNDSET"}
                }
                local es = dW[math.random(#dW)]
                local time = utils.time_ms() + 2000
                while time > utils.time_ms() do
                    local aV = player.get_player_coords(player.player_id())
                    for j = 1, 10 do
                        audio.play_sound_from_coord(-1, es.Name, aV, es.Ref, true, 50000, false)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Lobby BDSM Crash"] =
            menu.add_feature(
            "BDSM Crash",
            "action",
            t.Parent["Lobby Malicious"],
            function()
                local cw = v3(-70.31, -819.29, 327.60)
                local et = v3(-75.31, -819.29, 321.60)
                local cu = n.Vehicle(2132890591, cw)
                local eu = n.Ped(2727244247, et, 26)
                entity.set_entity_god_mode(eu, true)
                local ev =
                    rope.add_rope(
                    cw,
                    v3(0, 0, 0),
                    1,
                    1,
                    0.0000000000000000000000000000000000001,
                    1,
                    1,
                    true,
                    true,
                    true,
                    1.0,
                    true
                )
                rope.attach_entities_to_rope(
                    ev,
                    cu,
                    eu,
                    entity.get_entity_coords(cu),
                    entity.get_entity_coords(eu),
                    2,
                    0,
                    0,
                    "Center",
                    "Center"
                )
                z("Crash sent, attemping cleanup in 5 seconds...", "Success", "")
                coroutine.yield(5000)
                rope.delete_rope(ev)
                l.clear({cu, eu})
                if entity.is_an_entity(cu) or entity.is_an_entity(eu) or rope.does_rope_exist(ev) then
                    z("Cleanup failed.", "Error", "")
                else
                    z("Cleanup successful.", "Success", "")
                end
            end
        )
        t.Feature["Lobby Parachute Crash"] =
            menu.add_feature(
            "Parachute Crash",
            "action",
            t.Parent["Lobby Malicious"],
            function(V, bB)
                local bj = k.OwnCoords()
                local ew = v3(-75.101, -810.124, 340.175)
                local bo = n.Vehicle(941494461, bj)
                ped.set_ped_into_vehicle(k.OwnPed(), bo, -1)
                vehicle.set_vehicle_parachute_model(bo, 1054627099)
                l.tp(ew, 0.0)
                coroutine.yield(500)
                vehicle.set_vehicle_parachute_active(bo, true)
                coroutine.yield(1000)
                entity.freeze_entity(bo, true)
                coroutine.yield(5000)
                l.clear(bo)
                l.tp(bj, 0.0)
                z("Crash done.", "Success", "")
            end
        )
        t.Feature["Player Sector Crash"] =
            menu.add_feature(
            "Player Sector Crash (Host)",
            "action",
            t.Parent["Lobby Malicious"],
            function(V)
                if network.network_is_host() then
                    z("This cannot be used while you are Session Host!", "Error", "")
                    return
                end
                local cw = k.OwnCoords()
                local bk = k.OwnPed()
                entity.set_entity_coords_no_offset(bk, v3(-6170, 10837, 40))
                coroutine.yield(1000)
                entity.set_entity_coords_no_offset(bk, cw)
                z("Crash Complete", "Success", "")
            end
        )
        t.Feature["Model Change Crash"] =
            menu.add_feature(
            "Model Change Crash",
            "action_value_str",
            t.Parent["Lobby Malicious"],
            function(V)
                if V.value == 4 then
                    aW()
                    return
                end
                local aV = k.OwnCoords()
                a9 = entity.get_entity_model_hash(k.OwnPed())
                local ex = 2627665880
                local ey = 1885233650
                if player.is_player_female(player.player_id()) then
                    local ez = ex
                    ex = ey
                    ey = ez
                end
                for j = 1, 11 do
                    _["session_crash"]["textures"][j] = ped.get_ped_texture_variation(k.OwnPed(), j)
                    _["session_crash"]["clothes"][j] = ped.get_ped_drawable_variation(k.OwnPed(), j)
                end
                local aE = {0, 1, 2, 6, 7}
                for aH = 1, #aE do
                    _["session_crash"]["prop_ind"][aH] = ped.get_ped_prop_index(k.OwnPed(), aE[aH])
                    _["session_crash"]["prop_text"][aH] = ped.get_ped_prop_texture_index(k.OwnPed(), aE[aH])
                end
                if V.value == 0 then
                    aw(0x471BE4B2, nil, nil, nil)
                    coroutine.yield(5000)
                elseif V.value == 1 then
                    for j = 1, 32 do
                        entity.set_entity_coords_no_offset(k.OwnPed(), v3(460.586, 5571.714, 781.179))
                        aw(ex, nil, nil, nil)
                        coroutine.yield(100)
                        ped.set_ped_health(k.OwnPed(), 0)
                        coroutine.yield(100)
                        ped.resurrect_ped(k.OwnPed())
                        coroutine.yield(300)
                        aw(ey, nil, nil, nil)
                        coroutine.yield(100)
                        ped.set_ped_health(k.OwnPed(), 0)
                        coroutine.yield(200)
                        ped.resurrect_ped(k.OwnPed())
                    end
                elseif V.value == 2 then
                    local eA = k.OwnPed()
                    for j = 1, 15 do
                        entity.set_entity_coords_no_offset(k.OwnPed(), v3(-76.101, -819.124, 326.175))
                        aw(ex, nil, nil, nil)
                        coroutine.yield(100)
                        ped.set_ped_health(k.OwnPed(), 0)
                        coroutine.yield(100)
                        ped.resurrect_ped(k.OwnPed())
                        coroutine.yield(300)
                        aw(ey, nil, nil, nil)
                        coroutine.yield(100)
                        ped.set_ped_health(k.OwnPed(), 0)
                        coroutine.yield(200)
                        ped.resurrect_ped(k.OwnPed())
                    end
                    ped.clone_ped(eA)
                elseif V.value == 3 then
                    if network.network_is_host() then
                        z("This cannot be used while you are Session Host!", "Error", "")
                        return
                    end
                    for j = 1, 20 do
                        l.tp(v3(-6170, 10837, 40))
                        aw(ex, nil, nil, nil)
                        coroutine.yield(10)
                        ped.set_ped_health(k.OwnPed(), 0)
                        coroutine.yield(10)
                        ped.resurrect_ped(k.OwnPed())
                        coroutine.yield(30)
                        aw(ey, nil, nil, nil)
                        coroutine.yield(10)
                        ped.set_ped_health(k.OwnPed(), 0)
                        coroutine.yield(10)
                        ped.resurrect_ped(k.OwnPed())
                        coroutine.yield(30)
                    end
                    l.tp(aV)
                end
                aW()
                l.tp(aV)
                coroutine.yield(500)
                z("Crash Complete!", "Success")
            end
        )
        t.Feature["Model Change Crash"]:set_str_data({"v1", "v2", "v3", "v4", "Fix loading screen"})
        t.Parent["Auto Kick Modder"] = menu.add_feature("Auto Kick Modder", "parent", t.Parent["local_automod"], nil).id
        t.Feature["Enable Auto Kick Modder"] =
            menu.add_feature(
            "Enable Auto Kick",
            "value_str",
            t.Parent["Auto Kick Modder"],
            function(V)
                c["Enable Auto Kick Modder"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Enable Auto Kick Modder"]:set_str_data({"All Players", "Exclude Friends"})
        local eB = 1
        while eB < player.get_modder_flag_ends() do
            local L = player.get_modder_flag_text(eB)
            t.Feature["Autokick " .. L] =
                menu.add_feature(
                L,
                "value_str",
                t.Parent["Auto Kick Modder"],
                function(V)
                    c["Autokick " .. L] = {Enabled = V.on, Value = V.value}
                end
            )
            t.Feature["Autokick " .. L]:set_str_data({"Kick", "Kick & Blacklist"})
            eB = eB << 1
        end
        t.Parent["Player Blacklist"] = menu.add_feature("Player Blacklist", "parent", t.Parent["local_automod"], nil).id
        t.Feature["Enable Player Blacklist"] =
            menu.add_feature(
            "Enable Blacklist",
            "toggle",
            t.Parent["Player Blacklist"],
            function(V)
                c["Enable Player Blacklist"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Blacklist Kick Type"] =
            menu.add_feature(
            "Kick Type",
            "autoaction_value_str",
            t.Parent["Player Blacklist"],
            function(V)
                c["Player Blacklist Kick Type"] = {Value = V.value}
            end
        )
        t.Feature["Player Blacklist Kick Type"]:set_str_data({"Script Kick", "Desync Kick"})
        t.Parent["Player Blacklist Detections"] =
            menu.add_feature("Detection Requirements", "parent", t.Parent["Player Blacklist"], nil).id
        t.Feature["Detection Requirement Name"] =
            menu.add_feature(
            "Matching Name",
            "toggle",
            t.Parent["Player Blacklist Detections"],
            function(V)
                c["Detection Requirement Name"] = {Enabled = V.on}
            end
        )
        t.Feature["Detection Requirement SCID"] =
            menu.add_feature(
            "Matching SCID",
            "toggle",
            t.Parent["Player Blacklist Detections"],
            function(V)
                c["Detection Requirement SCID"] = {Enabled = V.on}
            end
        )
        t.Feature["Detection Requirement IP"] =
            menu.add_feature(
            "Matching IP",
            "toggle",
            t.Parent["Player Blacklist Detections"],
            function(V)
                c["Detection Requirement IP"] = {Enabled = V.on}
            end
        )
        t.Parent["Player Blacklist Profiles"] =
            menu.add_feature("Blacklist Profiles", "parent", t.Parent["Player Blacklist"], nil).id
        t.Feature["Blacklist Profiles Add"] =
            menu.add_feature(
            "Add Profile",
            "action",
            t.Parent["Player Blacklist Profiles"],
            function()
                local eC = k.Input("Enter Player Name", 16)
                if not eC then
                    z("Input canceled.", "Error", "")
                    return
                end
                local eD = tonumber(k.Input("Enter Player SCID", 10, 3))
                if not eD then
                    z("Input canceled.", "Error", "")
                    return
                end
                local eE = k.Input("Enter Player IP", 15, 4)
                if not eE then
                    z("Input canceled.", "Error", "")
                    return
                end
                local eF = {}
                if not utils.file_exists(b["Blacklist"]) then
                    goto ca
                end
                for bP in io.lines(b["Blacklist"]) do
                    eF[bP] = true
                end
                if eF[eC .. ":" .. eD .. ":" .. eE] then
                    z("Player already exists in the blacklist", "Error", "")
                    return
                end
                ::ca::
                l.write(io.open(b["Blacklist"], "a"), eC .. ":" .. eD .. ":" .. eE)
                t.Feature[eC .. "/" .. eD] =
                    menu.add_feature(
                    eC,
                    "action_value_str",
                    t.Parent["Player Blacklist Profiles"],
                    function(V)
                        if V.value == 0 then
                            z(
                                "Name: " .. eC .. "\nSCID: " .. eD .. "\nIP: " .. eE,
                                "Success",
                                "2Take1Script Player Blacklist"
                            )
                        else
                            eF[eC .. ":" .. eD .. ":" .. eE] = nil
                            l.write(io.open(b["Blacklist"], "w"))
                            for b_ in pairs(eF) do
                                l.write(io.open(b["Blacklist"], "a"), b_)
                            end
                            menu.delete_feature(V.id)
                            z("Entry Deleted", "Success", "2Take1Script Player Blacklist")
                        end
                    end
                )
                t.Feature[eC .. "/" .. eD]:set_str_data({"Show Info", "Delete"})
                z(
                    "New Blacklist Entry\nName: " .. eC .. "\nSCID: " .. eD .. "\nIP: " .. eE,
                    "Success",
                    "2Take1Script Player Blacklist"
                )
            end
        )
        if utils.file_exists(b["Blacklist"]) then
            menu.create_thread(
                function()
                    local ed = 0
                    for bP in io.lines(b["Blacklist"]) do
                        local J = {}
                        for K in bP:gmatch("[^:]+") do
                            J[#J + 1] = K
                        end
                        if #J == 3 then
                            local L = J[1]
                            local M = J[2]
                            local bQ = J[3]
                            t.Feature[L .. "/" .. M] =
                                menu.add_feature(
                                L,
                                "action_value_str",
                                t.Parent["Player Blacklist Profiles"],
                                function(V)
                                    if V.value == 0 then
                                        z(
                                            "Name: " .. L .. "\nSCID: " .. M .. "\nIP: " .. bQ,
                                            "Success",
                                            "2Take1Script Player Blacklist"
                                        )
                                    else
                                        local eF = {}
                                        for bZ in io.lines(b["Blacklist"]) do
                                            eF[bZ] = true
                                        end
                                        eF[L .. ":" .. M .. ":" .. bQ] = nil
                                        l.write(io.open(b["Blacklist"], "w"))
                                        for b_ in pairs(eF) do
                                            l.write(io.open(b["Blacklist"], "a"), b_)
                                        end
                                        menu.delete_feature(V.id)
                                        z("Entry Deleted", "Success", "2Take1Script Player Blacklist")
                                    end
                                end
                            )
                            t.Feature[L .. "/" .. M]:set_str_data({"Show Info", "Delete"})
                        end
                        ed = ed + 1
                        if ed == 50 then
                            ed = 0
                            coroutine.yield(0)
                        end
                    end
                end,
                nil
            )
        end
        t.Parent["Anti Advertisement Tool"] =
            menu.add_feature("Anti Advertisement Tool", "parent", t.Parent["local_automod"], nil).id
        t.Feature["Ad Blacklist Name Strings"] =
            menu.add_feature(
            "Name String Blacklist",
            "value_str",
            t.Parent["Anti Advertisement Tool"],
            function(V)
                c["Ad Blacklist Name Strings"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Ad Blacklist Name Strings"]:set_str_data({"Safe", "Aggressive"})
        t.Feature["Ad Blacklist Chat Strings"] =
            menu.add_feature(
            "Chat String Blacklist",
            "value_str",
            t.Parent["Anti Advertisement Tool"],
            function(V)
                c["Ad Blacklist Chat Strings"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Ad Blacklist Chat Strings"]:set_str_data({"Safe", "Aggressive"})
        t.Feature["Ad Blacklist Fake Friends"] =
            menu.add_feature(
            "Add to Fake Friends Blacklist",
            "toggle",
            t.Parent["Anti Advertisement Tool"],
            function(V)
                c["Ad Blacklist Fake Friends"] = {Enabled = V.on}
            end
        )
        t.Feature["Ad Blacklist Disable Notifications"] =
            menu.add_feature(
            "Disable Notifications",
            "toggle",
            t.Parent["Anti Advertisement Tool"],
            function(V)
                c["Ad Blacklist Disable Notifications"] = {Enabled = V.on}
            end
        )
        t.Feature["Ad Blacklist Kick Type"] =
            menu.add_feature(
            "Kick Type",
            "autoaction_value_str",
            t.Parent["Anti Advertisement Tool"],
            function(V)
                c["Ad Blacklist Kick Type"] = {Value = V.value}
            end
        )
        t.Feature["Ad Blacklist Kick Type"]:set_str_data({"Script Kick", "Desync Kick"})
        t.Parent["Vehicle Blacklist"] =
            menu.add_feature("Vehicle Blacklist", "parent", t.Parent["local_automod"], nil).id
        t.Feature["Enable Vehicle Blacklist"] =
            menu.add_feature(
            "Enable Blacklist",
            "value_str",
            t.Parent["Vehicle Blacklist"],
            function(V)
                c["Enable Vehicle Blacklist"] = {Enabled = V.on, Value = V.value}
                local by = {}
                while V.on do
                    local cO
                    if V.value == 0 then
                        cO = false
                    else
                        cO = true
                    end
                    for bB = 0, 31 do
                        if l.valid_player(bB, cO) and (not by[bB] or menu.has_thread_finished(by[bB])) then
                            by[bB] = menu.create_thread(bm, bB)
                        end
                        coroutine.yield(0)
                    end
                    c["Enable Vehicle Blacklist"].Value = V.value
                    coroutine.yield(0)
                end
                c["Enable Vehicle Blacklist"].Enabled = V.on
            end
        )
        t.Feature["Enable Vehicle Blacklist"]:set_str_data({"All Players", "Exclude Friends"})
        t.Feature["Vehicle Blacklist Reaction"] =
            menu.add_feature(
            "Chosen Reaction",
            "autoaction_value_str",
            t.Parent["Vehicle Blacklist"],
            function(V)
                c["Vehicle Blacklist Reaction"] = {Value = V.value}
            end
        )
        t.Feature["Vehicle Blacklist Reaction"]:set_str_data(
            {"Delete Vehicle", "Explode", "Vehicle Kick", "Script Kick", "Desync Kick", "Script Crash"}
        )
        for j = 1, #p.vehicle_blacklist do
            local dR = p.vehicle_blacklist[j].Name
            t.Parent["VB " .. dR] = menu.add_feature(dR, "parent", t.Parent["Vehicle Blacklist"], nil).id
            for av = 1, #p.vehicle_blacklist[j].Children do
                if streaming.is_model_a_vehicle(p.vehicle_blacklist[j].Children[av].Hash) then
                    local L = p.vehicle_blacklist[j].Children[av].Name
                    t.Feature["VB " .. L] =
                        menu.add_feature(
                        L,
                        "toggle",
                        t.Parent["VB " .. dR],
                        function(V)
                            c["VB " .. L] = {Enabled = V.on}
                        end
                    )
                else
                    print("Vehicle Blacklist preset " .. p.vehicle_blacklist[j].Children[av].Name .. " is invalid.")
                end
            end
        end
        t.Feature["Anti Chat Spam"] =
            menu.add_feature(
            "Anti Chat Spam",
            "value_str",
            t.Parent["local_automod"],
            function(V)
                c["Anti Chat Spam"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Anti Chat Spam"]:set_str_data({"Script Kick", "Desync Kick", "Script Crash"})
        t.Feature["Kick Vote-Kicker"] =
            menu.add_feature(
            "Kick Vote-Kicker",
            "value_str",
            t.Parent["local_automod"],
            function(V)
                c["Kick Vote-Kicker"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Kick Vote-Kicker"]:set_str_data({"Script Kick", "Desync Kick"})
        t.Feature["Kick SMS-Sender"] =
            menu.add_feature(
            "Kick SMS-Sender",
            "value_str",
            t.Parent["local_automod"],
            function(V)
                c["Kick SMS-Sender"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Kick SMS-Sender"]:set_str_data({"Script Kick", "Desync Kick"})
        t.Feature["GEO-Block Russia"] =
            menu.add_feature(
            "Punish Russian Speakers",
            "value_str",
            t.Parent["local_automod"],
            function(V)
                c["GEO-Block Russia"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["GEO-Block Russia"]:set_str_data({"Script Kick", "Desync Kick", "Script Crash", "Explode"})
        t.Feature["GEO-Block China"] =
            menu.add_feature(
            "Punish Chinese Speakers",
            "value_str",
            t.Parent["local_automod"],
            function(V)
                c["GEO-Block China"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["GEO-Block China"]:set_str_data({"Script Kick", "Desync Kick", "Script Crash", "Explode"})
        t.Feature["Modder Detection Announce"] =
            menu.add_feature(
            "Announce Detections in Chat",
            "value_str",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Announce"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Modder Detection Announce"]:set_str_data({"All", "Team"})
        t.Feature["Announce Crash Attempts"] =
            menu.add_feature(
            "Announce Crash Attempts",
            "value_str",
            t.Parent["local_modderdetection"],
            function(V)
                c["Announce Crash Attempts"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Announce Crash Attempts"]:set_str_data(
            {"2Take1 User", "Modest Menu User", "Cherax User", "Stand User", "Terror User"}
        )
        t.Parent["Remember Modder"] =
            menu.add_feature("Remember every Modder", "parent", t.Parent["local_modderdetection"], nil).id
        t.Feature["Modder Detection Remember"] =
            menu.add_feature(
            "Enable",
            "toggle",
            t.Parent["Remember Modder"],
            function(V)
                c["Modder Detection Remember"] = {Enabled = V.on}
            end
        )
        t.Parent["Remember Modder Profiles"] =
            menu.add_feature("Detected Modder", "parent", t.Parent["Remember Modder"], nil).id
        if utils.file_exists(b["Modder"]) then
            menu.create_thread(
                function()
                    local ed = 0
                    for bP in io.lines(b["Modder"]) do
                        local J = {}
                        for K in bP:gmatch("[^:]+") do
                            J[#J + 1] = K
                        end
                        if #J == 3 then
                            local L = J[1]
                            local M = J[2]
                            local bS = J[3]
                            t.Feature[L .. "/" .. bS] =
                                menu.add_feature(
                                L,
                                "action_value_str",
                                t.Parent["Remember Modder Profiles"],
                                function(V)
                                    if V.value == 0 then
                                        z(
                                            "Name: " .. L .. "\nSCID: " .. M .. "\nReason: " .. bS,
                                            "Neutral",
                                            "2Take1Script Remember Modder"
                                        )
                                    elseif V.value == 1 then
                                        local bR = {}
                                        for bZ in io.lines(b["Modder"]) do
                                            bR[bZ] = true
                                        end
                                        bR[L .. ":" .. M .. ":" .. bS] = nil
                                        l.write(io.open(b["Modder"], "w"))
                                        for b_ in pairs(bR) do
                                            l.write(io.open(b["Modder"], "a"), b_)
                                        end
                                        menu.delete_feature(V.id)
                                        z("Entry Deleted", "Success", "2Take1Script Remember Modder")
                                    else
                                        utils.to_clipboard(M)
                                        z("SCID copied to clipboard", "Success", "2Take1Script Remember Modder")
                                    end
                                end
                            )
                            t.Feature[L .. "/" .. bS]:set_str_data({"Show Info", "Delete", "Copy SCID"})
                        end
                        ed = ed + 1
                        if ed == 50 then
                            ed = 0
                            coroutine.yield(0)
                        end
                    end
                end,
                nil
            )
        end
        t.Parent["Remember Modder Flag Selection"] =
            menu.add_feature("Flag Selection", "parent", t.Parent["Remember Modder"], nil).id
        eB = 1
        while eB < player.get_modder_flag_ends() do
            local L = player.get_modder_flag_text(eB)
            if L ~= "Remembered" then
                t.Feature["Remember " .. L] =
                    menu.add_feature(
                    L,
                    "toggle",
                    t.Parent["Remember Modder Flag Selection"],
                    function(V)
                        c["Remember " .. L] = {Enabled = V.on}
                    end
                )
            end
            eB = eB << 1
        end
        t.Feature["Modder Detection Mark All"] =
            menu.add_feature(
            "Mark all as Modder",
            "action",
            t.Parent["local_modderdetection"],
            function()
                for bB = 0, 31 do
                    if l.valid_modder(bB) then
                        player.set_player_as_modder(bB, 1)
                    end
                end
            end
        )
        t.Feature["Modder Detection Unmark All"] =
            menu.add_feature(
            "Unmark all Modder",
            "action",
            t.Parent["local_modderdetection"],
            function()
                for bB = 0, 31 do
                    if l.valid_player(bB, false) then
                        player.unset_player_as_modder(bB, -1)
                    end
                end
            end
        )
        t.Feature["Modder Detection Health"] =
            menu.add_feature(
            "Modded Health",
            "toggle",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Health"] = {Enabled = V.on}
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_modder(bB) then
                            coroutine.yield(1000)
                            local cM = player.get_player_health(bB)
                            local eG = player.get_player_max_health(bB)
                            if cM > 328 or eG > 328 then
                                z(
                                    "Player: " .. k.Name(bB) .. "\nReason: Modded Health",
                                    "Neutral",
                                    "2Take1Script Modder Detection"
                                )
                                C(
                                    "Player: " ..
                                        k.Name(bB) ..
                                            "\nReason: Modded Health\nPlayer Health: " .. cM .. " Max Health: " .. eG,
                                    "[Modder Detection]"
                                )
                                player.set_player_as_modder(bB, d[2][2])
                            end
                        end
                    end
                    coroutine.yield(500)
                end
                c["Modder Detection Health"].Enabled = V.on
            end
        )
        t.Feature["Modder Detection Armor"] =
            menu.add_feature(
            "Modded Armor",
            "toggle",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Armor"] = {Enabled = V.on}
                while V.on do
                    for bB = 0, 31 do
                        coroutine.yield(25)
                        if l.valid_modder(bB) then
                            local eH = player.get_player_armour(bB)
                            if eH > 50 then
                                z(
                                    "Player: " .. k.Name(bB) .. "\nReason: Modded Armor",
                                    "Neutral",
                                    "2Take1Script Modder Detection"
                                )
                                C(
                                    "Player: " .. k.Name(bB) .. "\nReason: Modded Armor\nDetected Armor: " .. eH,
                                    "[Modder Detection]"
                                )
                                player.set_player_as_modder(bB, d[3][2])
                            end
                        end
                    end
                    coroutine.yield(500)
                end
                c["Modder Detection Armor"].Enabled = V.on
            end
        )
        t.Feature["Modder Detection Player Godmode"] =
            menu.add_feature(
            "Player Godmode",
            "value_str",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Player Godmode"] = {Enabled = V.on, Value = V.value}
                local cV = {}
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_modder(bB) and k.GodmodeState(bB) then
                            if not cV[bB] or menu.has_thread_finished(cV[bB]) then
                                cV[bB] = menu.create_thread(bT.godmode, bB)
                            end
                        end
                    end
                    c["Modder Detection Player Godmode"].Value = V.value
                    coroutine.yield(500)
                end
                c["Modder Detection Player Godmode"].Enabled = V.on
            end
        )
        t.Feature["Modder Detection Player Godmode"]:set_str_data({"Notify", "Notify & Mark"})
        t.Feature["Modder Detection Vehicle Godmode"] =
            menu.add_feature(
            "Vehicle Godmode",
            "value_str",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Vehicle Godmode"] = {Enabled = V.on, Value = V.value}
                local cV = {}
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_modder(bB) and k.VehicleGodmodeState(bB) then
                            if not cV[bB] or menu.has_thread_finished(cV[bB]) then
                                cV[bB] = menu.create_thread(bT.vehiclegodmode, bB)
                            end
                        end
                    end
                    c["Modder Detection Vehicle Godmode"].Value = V.value
                    coroutine.yield(500)
                end
                c["Modder Detection Vehicle Godmode"].Enabled = V.on
            end
        )
        t.Feature["Modder Detection Vehicle Godmode"]:set_str_data({"Notify", "Notify & Mark"})
        t.Feature["Modder Detection Off The Radar"] =
            menu.add_feature(
            "Modded Off The Radar",
            "toggle",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Off The Radar"] = {Enabled = V.on}
                local by = {}
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_modder(bB) and by[bB] == nil then
                            if r.IsPlayerOTR(bB) and r.CEOID(bB) == -1 then
                                by[bB] = true
                                menu.create_thread(
                                    function(bn)
                                        coroutine.yield(61000)
                                        if l.valid_modder(bB) and r.IsPlayerOTR(bn) then
                                            z(
                                                "Player: " .. k.Name(bn) .. "\nReason: Extended Off The Radar",
                                                "Neutral",
                                                "2Take1Script Modder Detection"
                                            )
                                            C(
                                                "Player: " .. k.Name(bn) .. "\nReason: Extended Off The Radar",
                                                "[Modder Detection]"
                                            )
                                            player.set_player_as_modder(bn, d[5][2])
                                        end
                                        by[bB] = nil
                                    end,
                                    bB
                                )
                            elseif r.IsPlayerOTR(bB) and r.CEOID(bB) ~= -1 then
                                by[bB] = true
                                menu.create_thread(
                                    function(bn)
                                        coroutine.yield(181000)
                                        if l.valid_modder(bn) and r.IsPlayerOTR(bn) then
                                            z(
                                                "Player: " .. k.Name(bn) .. "\nReason: Extended Off The Radar",
                                                "Neutral",
                                                "2Take1Script Modder Detection"
                                            )
                                            C(
                                                "Player: " .. k.Name(bn) .. "\nReason: Extended Off The Radar",
                                                "[Modder Detection]"
                                            )
                                            player.set_player_as_modder(bn, d[5][2])
                                        end
                                        by[bB] = nil
                                    end,
                                    bB
                                )
                            elseif player.get_player_max_health(bB) <= 100 then
                                by[bB] = true
                                menu.create_thread(
                                    function(bn)
                                        coroutine.yield(60000)
                                        local aV = k.PlayerCoords(bn)
                                        if
                                            l.valid_modder(bn) and player.get_player_max_health(bn) <= 100 and
                                                aV ~= v3(0, 0, 0)
                                         then
                                            z(
                                                "Player: " .. k.Name(bn) .. "\nReason: Undead Off The Radar",
                                                "Neutral",
                                                "2Take1Script Modder Detection"
                                            )
                                            C(
                                                "Player: " .. k.Name(bn) .. "\nReason: Undead Off The Radar",
                                                "[Modder Detection]"
                                            )
                                            player.set_player_as_modder(bn, d[5][2])
                                        end
                                        by[bB] = nil
                                    end,
                                    bB
                                )
                            end
                        end
                    end
                    coroutine.yield(500)
                end
                c["Modder Detection Off The Radar"].Enabled = V.on
            end
        )
        t.Feature["Modder Detection Script Events"] =
            menu.add_feature(
            "Modded Script Events",
            "value_str",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Script Events"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Modder Detection Script Events"]:set_str_data({"v1", "v2"})
        t.Feature["Modder Detection Max Speed"] =
            menu.add_feature(
            "Max Speed Bypass",
            "toggle",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Max Speed"] = {Enabled = V.on}
                while V.on do
                    for bB = 0, 31 do
                        if l.valid_modder(bB) and interior.get_interior_from_entity(k.PlayerPed(bB)) == 0 then
                            local ct
                            local eI = 150
                            local cu = k.PlayerVehicle(bB)
                            if cu ~= 0 then
                                ct = cu
                            else
                                ct = k.PlayerPed(bB)
                            end
                            local eJ = entity.get_entity_speed(ct)
                            if eJ > eI then
                                local L = k.Name(bB)
                                z(
                                    "Player: " .. L .. "\nReason: Max Speed Bypass",
                                    "Neutral",
                                    "2Take1Script Modder Detection"
                                )
                                C(
                                    "Player: " ..
                                        L .. "\nReason: Max Speed Bypass\nPlayer Speed: " .. eJ * 3.6 .. "Km/H",
                                    "[Modder Detection]"
                                )
                                player.set_player_as_modder(bB, d[7][2])
                            end
                        end
                    end
                    coroutine.yield(0)
                end
                c["Modder Detection Max Speed"].Enabled = V.on
            end
        )
        t.Feature["Modder Detection Net Events"] =
            menu.add_feature(
            "Bad Net Events",
            "toggle",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Net Events"] = {Enabled = V.on}
            end
        )
        t.Feature["Modder Detection Profanity"] =
            menu.add_feature(
            "Profanity Filter Bypass",
            "toggle",
            t.Parent["local_modderdetection"],
            function(V)
                c["Modder Detection Profanity"] = {Enabled = V.on}
            end
        )
        t.Feature["Real Time"] =
            menu.add_feature(
            "Real Time (Clientside)",
            "toggle",
            t.Parent["local_world"],
            function(V)
                c["Real Time"] = {Enabled = V.on}
                while V.on do
                    local c9 = os.date("*t")
                    time.set_clock_time(c9.hour, c9.min, c9.sec)
                    gameplay.clear_cloud_hat()
                    coroutine.yield(0)
                end
                c["Real Time"].Enabled = V.on
            end
        )
        t.Parent["Kill Aura"] = menu.add_feature("Kill Aura/Force Field", "parent", t.Parent["local_world"], nil).id
        t.Feature["Kill Aura Enable"] =
            menu.add_feature(
            "Enable Kill Aura",
            "value_str",
            t.Parent["Kill Aura"],
            function(V)
                local cV = {}
                local eK = 0
                while V.on do
                    local eL = ped.get_all_peds()
                    for j = 1, #eL do
                        if
                            eL[j] == k.OwnPed() or V.value == 1 and ped.is_ped_a_player(eL[j]) or
                                V.value == 2 and not ped.is_ped_a_player(eL[j])
                         then
                            goto ca
                        end
                        if not cV[eL[j]] or menu.has_thread_finished(cV[eL[j]]) then
                            cV[eL[j]] =
                                menu.create_thread(
                                o.Killaura,
                                {eL[j], t.Feature["Kill Aura Range"].value, t.Feature["Kill Aura Option"].value}
                            )
                        end
                        ::ca::
                        eK = eK + 1
                        if eK == 25 then
                            eK = 0
                            coroutine.yield(0)
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Kill Aura Enable"]:set_str_data({"All Peds", "Exclude Players", "Players Only"})
        t.Feature["Kill Aura Range"] =
            menu.add_feature(
            "Range",
            "autoaction_slider",
            t.Parent["Kill Aura"],
            function(V)
                c["Kill Aura Range"] = {Value = V.value}
            end
        )
        t.Feature["Kill Aura Range"].min = 10
        t.Feature["Kill Aura Range"].max = 100
        t.Feature["Kill Aura Range"].mod = 5
        t.Feature["Kill Aura Option"] =
            menu.add_feature(
            "Option",
            "autoaction_value_str",
            t.Parent["Kill Aura"],
            function(V)
                c["Kill Aura Option"] = {Value = V.value}
            end
        )
        t.Feature["Kill Aura Option"]:set_str_data({"Shoot", "Explode"})
        t.Feature["Force Field Enable"] =
            menu.add_feature(
            "Enable Force Field",
            "toggle",
            t.Parent["Kill Aura"],
            function(V)
                c["Force Field Enable"] = {Enabled = V.on}
                local cV = {}
                local eK = 0
                while V.on do
                    local eM = vehicle.get_all_vehicles()
                    for j = 1, #eM do
                        if eM[j] == k.OwnVehicle() then
                            goto ca
                        end
                        if not cV[eM[j]] or menu.has_thread_finished(cV[eM[j]]) then
                            cV[eM[j]] =
                                menu.create_thread(
                                o.Forcefield,
                                {eM[j], t.Feature["Force Field Range"].value, t.Feature["Force Field Strength"].value}
                            )
                        end
                        ::ca::
                        eK = eK + 1
                        if eK == 25 then
                            eK = 0
                            coroutine.yield(0)
                        end
                    end
                    coroutine.yield(0)
                end
                c["Force Field Enable"].Enabled = V.on
            end
        )
        t.Feature["Force Field Range"] =
            menu.add_feature(
            "Range",
            "autoaction_slider",
            t.Parent["Kill Aura"],
            function(V)
                c["Force Field Range"] = {Value = V.value}
            end
        )
        t.Feature["Force Field Range"].min = 10
        t.Feature["Force Field Range"].max = 100
        t.Feature["Force Field Range"].mod = 5
        t.Feature["Force Field Strength"] =
            menu.add_feature(
            "Strength",
            "autoaction_slider",
            t.Parent["Kill Aura"],
            function(V)
                c["Force Field Strength"] = {Value = V.value}
            end
        )
        t.Feature["Force Field Strength"].min = 10
        t.Feature["Force Field Strength"].max = 100
        t.Feature["Force Field Strength"].mod = 5
        t.Parent["Ped Manager"] = menu.add_feature("Ped Manager", "parent", t.Parent["local_world"], nil).id
        t.Feature["Explode All Peds"] =
            menu.add_feature(
            "Explode All Peds",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                while V.on do
                    local eN = ped.get_all_peds()
                    for j = 1, #eN do
                        if not ped.is_ped_a_player(eN[j]) and not entity.is_entity_dead(eN[j]) then
                            local cw = entity.get_entity_coords(eN[j])
                            fire.add_explosion(cw, 5, true, false, 0, 0)
                        end
                        coroutine.yield(25)
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Kill All Peds"] =
            menu.add_feature(
            "Kill All Peds",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                while V.on do
                    local eN = ped.get_all_peds()
                    for j = 1, #eN do
                        if not ped.is_ped_a_player(eN[j]) and not entity.is_entity_dead(eN[j]) then
                            l.request_ctrl(eN[j])
                            ped.set_ped_health(eN[j], 0)
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Shoot All Peds"] =
            menu.add_feature(
            "Shoot All Peds",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                while V.on do
                    local eN = ped.get_all_peds()
                    for j = 1, #eN do
                        if not ped.is_ped_a_player(eN[j]) and not entity.is_entity_dead(eN[j]) then
                            if ped.get_vehicle_ped_is_using(eN[j]) ~= 0 then
                                ped.clear_ped_tasks_immediately(eN[j])
                            end
                            local cw = entity.get_entity_coords(eN[j])
                            gameplay.shoot_single_bullet_between_coords(
                                cw + v3(0, 0, 1),
                                cw,
                                1000,
                                0xC472FE2,
                                k.OwnPed(),
                                false,
                                true,
                                1000
                            )
                        end
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Delete All Peds"] =
            menu.add_feature(
            "Delete All Peds",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                local cV
                while V.on do
                    if not cV or menu.has_thread_finished(cV) then
                        menu.create_thread(o.Clearpeds, ped.get_all_peds())
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Freeze All Peds"] =
            menu.add_feature(
            "Freeze All Peds",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                while V.on do
                    local eN = ped.get_all_peds()
                    for j = 1, #eN do
                        if not ped.is_ped_a_player(eN[j]) then
                            l.request_ctrl(eN[j])
                            entity.freeze_entity(eN[j], true)
                        end
                    end
                    coroutine.yield(500)
                end
                local eN = ped.get_all_peds()
                for j = 1, #eN do
                    if not ped.is_ped_a_player(eN[j]) then
                        l.request_ctrl(eN[j])
                        entity.freeze_entity(eN[j], false)
                    end
                end
            end
        )
        t.Feature["Turn All Peds Invisible"] =
            menu.add_feature(
            "Turn All Peds Invisible",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                while V.on do
                    local eN = ped.get_all_peds()
                    for j = 1, #eN do
                        if not ped.is_ped_a_player(eN[j]) then
                            l.request_ctrl(eN[j])
                            entity.set_entity_visible(eN[j], false)
                        end
                    end
                    coroutine.yield(500)
                end
                local eN = ped.get_all_peds()
                for j = 1, #eN do
                    if not ped.is_ped_a_player(eN[j]) then
                        l.request_ctrl(eN[j])
                        entity.set_entity_visible(eN[j], true)
                    end
                end
            end
        )
        t.Feature["Turn All Peds Invincible"] =
            menu.add_feature(
            "Turn All Peds Invincible",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                while V.on do
                    local eN = ped.get_all_peds()
                    for j = 1, #eN do
                        if not ped.is_ped_a_player(eN[j]) then
                            l.request_ctrl(eN[j])
                            entity.set_entity_god_mode(eN[j], true)
                        end
                    end
                    coroutine.yield(500)
                end
                local eN = ped.get_all_peds()
                for j = 1, #eN do
                    if not ped.is_ped_a_player(eN[j]) then
                        l.request_ctrl(eN[j])
                        entity.set_entity_god_mode(eN[j], false)
                    end
                end
            end
        )
        t.Feature["Street War"] =
            menu.add_feature(
            "Street War",
            "toggle",
            t.Parent["Ped Manager"],
            function(V)
                local cV
                while V.on do
                    if not cV or menu.has_thread_finished(cV) then
                        cV = menu.create_thread(bh.spawnped, nil)
                    end
                    local eO = ped.get_all_peds()
                    for j = 1, #eO do
                        if not ped.is_ped_a_player(eO[j]) then
                            menu.create_thread(bh.setup, {eO[j], eO})
                        end
                        coroutine.yield(0)
                    end
                    local eP = object.get_all_pickups()
                    for j = 1, #eP do
                        if entity.get_entity_model_hash(eP[j]) == 1493691718 then
                            l.clear(eP[j])
                        end
                        coroutine.yield(0)
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Kick All Peds from Vehicle"] =
            menu.add_feature(
            "Kick All Peds from Vehicle",
            "action",
            t.Parent["Ped Manager"],
            function(V)
                local eN = ped.get_all_peds()
                for j = 1, #eN do
                    if not ped.is_ped_a_player(eN[j]) and ped.get_vehicle_ped_is_using(eN[j]) ~= 0 then
                        l.request_ctrl(eN[j])
                        ped.clear_ped_tasks_immediately(eN[j])
                    end
                end
            end
        )
        t.Parent["Vehicle Manager"] = menu.add_feature("Vehicle Manager", "parent", t.Parent["local_world"], nil).id
        t.Feature["Explode All Vehicles"] =
            menu.add_feature(
            "Explode All Vehicles",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    for j = 1, #dr do
                        local bk = vehicle.get_ped_in_vehicle_seat(dr[j], -1)
                        if not ped.is_ped_a_player(bk) then
                            native.call(0x301A42153C9AD707, dr[j], true, false, 0)
                        end
                        coroutine.yield(0)
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Delete All Vehicles"] =
            menu.add_feature(
            "Delete All Vehicles",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                local cV
                while V.on do
                    if not cV or menu.has_thread_finished(cV) then
                        cV = menu.create_thread(o.Clearvehicles, vehicle.get_all_vehicles())
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Freeze All Vehicles"] =
            menu.add_feature(
            "Freeze All Vehicles",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    for j = 1, #dr do
                        local bk = vehicle.get_ped_in_vehicle_seat(dr[j], -1)
                        if not ped.is_ped_a_player(bk) then
                            l.request_ctrl(dr[j])
                            entity.freeze_entity(dr[j], true)
                        end
                    end
                    coroutine.yield(500)
                end
                local dr = vehicle.get_all_vehicles()
                for j = 1, #dr do
                    l.request_ctrl(dr[j])
                    entity.freeze_entity(dr[j], false)
                end
            end
        )
        t.Feature["Turn All Vehicles Invisible"] =
            menu.add_feature(
            "Turn All Vehicles Invisible",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    for j = 1, #dr do
                        local bk = vehicle.get_ped_in_vehicle_seat(dr[j], -1)
                        if not ped.is_ped_a_player(bk) then
                            l.request_ctrl(dr[j])
                            entity.set_entity_visible(dr[j], false)
                        end
                    end
                    coroutine.yield(500)
                end
                local dr = vehicle.get_all_vehicles()
                for j = 1, #dr do
                    l.request_ctrl(dr[j])
                    entity.set_entity_visible(dr[j], true)
                end
            end
        )
        t.Feature["Turn All Vehicles Invincible"] =
            menu.add_feature(
            "Turn All Vehicles Invincible",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    for j = 1, #dr do
                        local bk = vehicle.get_ped_in_vehicle_seat(dr[j], -1)
                        if not ped.is_ped_a_player(bk) then
                            l.request_ctrl(dr[j])
                            entity.set_entity_god_mode(dr[j], true)
                        end
                    end
                    coroutine.yield(500)
                end
                local dr = vehicle.get_all_vehicles()
                for j = 1, #dr do
                    l.request_ctrl(dr[j])
                    entity.set_entity_god_mode(dr[j], false)
                end
            end
        )
        t.Feature["Upgrade Nearby Vehicles"] =
            menu.add_feature(
            "Upgrade Nearby Vehicles",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                local cV = {}
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    for j = 1, #dr do
                        local bk = vehicle.get_ped_in_vehicle_seat(dr[j], -1)
                        if not ped.is_ped_a_player(bk) then
                            if not cV[dr[j]] or menu.has_thread_finished(cV[dr[j]]) then
                                if not vehicle.is_toggle_mod_on(dr[j], 18) then
                                    cV[dr[j]] = menu.create_thread(o.Upgradevehicles, dr[j])
                                end
                            end
                        end
                        coroutine.yield(0)
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Display Vehicle Speed"] =
            menu.add_feature(
            "Display Vehicle Speed",
            "value_str",
            t.Parent["Vehicle Manager"],
            function(V)
                c["Display Vehicle Speed"] = {Enabled = V.on, Value = V.value}
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    local cx = player.get_player_coords(player.player_id())
                    for j = 1, #dr do
                        if dr[j] ~= k.OwnVehicle() then
                            local cu = dr[j]
                            local eQ = entity.get_entity_coords(cu)
                            local cy = cx:magnitude(eQ)
                            if cy < 50 then
                                local eR, eS = graphics.project_3d_coord(eQ)
                                if eR then
                                    eS.x = scriptdraw.pos_pixel_to_rel_x(eS.x)
                                    eS.y = scriptdraw.pos_pixel_to_rel_y(eS.y)
                                    local eJ = entity.get_entity_speed(cu)
                                    local dZ
                                    local f
                                    if V.value == 0 then
                                        dZ = eJ * 3.6
                                        f = " KM/H"
                                    elseif V.value == 1 then
                                        dZ = eJ * 2.23694
                                        f = " MP/H"
                                    end
                                    if m.Round(dZ, 2) ~= 0.0 then
                                        scriptdraw.draw_text(
                                            m.Round(dZ, 2) .. f,
                                            eS,
                                            v2(),
                                            0.6 - 0.5 * cy / 50,
                                            0xFFFFFFFF,
                                            1 << 0 | (1 << 2),
                                            nil
                                        )
                                    end
                                end
                            end
                        end
                    end
                    c["Display Vehicle Speed"].Value = V.value
                    coroutine.yield(0)
                end
                c["Display Vehicle Speed"].Enabled = V.on
            end
        )
        t.Feature["Display Vehicle Speed"]:set_str_data({"KM/H", "MP/H"})
        t.Feature["Change Gravity"] =
            menu.add_feature(
            "Change Gravity",
            "slider",
            t.Parent["Vehicle Manager"],
            function(V)
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    for j = 1, #dr do
                        local bk = vehicle.get_ped_in_vehicle_seat(dr[j], -1)
                        if not ped.is_ped_a_player(bk) then
                            l.request_ctrl(dr[j])
                            vehicle.set_vehicle_gravity_amount(dr[j], V.value)
                            if entity.get_entity_speed(dr[j]) == 0 then
                                vehicle.set_vehicle_forward_speed(dr[j], 1)
                            end
                        end
                    end
                    coroutine.yield(500)
                end
                local dr = vehicle.get_all_vehicles()
                for j = 1, #dr do
                    l.request_ctrl(dr[j])
                    vehicle.set_vehicle_gravity_amount(dr[j], 10)
                end
            end
        )
        t.Feature["Change Gravity"].min = -100
        t.Feature["Change Gravity"].max = 100
        t.Feature["Change Gravity"].mod = 25
        t.Feature["Change Gravity"].value = 0
        t.Feature["Disable Collision with Vehicles"] =
            menu.add_feature(
            "Disable Collision with Vehicles",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                local cV
                while V.on do
                    local ct
                    local eT = k.OwnVehicle()
                    if eT ~= 0 then
                        ct = eT
                    else
                        ct = k.OwnPed()
                    end
                    if not cV or menu.has_thread_finished(cV) then
                        cV = menu.create_thread(o.Vehiclecollision, {vehicle.get_all_vehicles(), ct})
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Set Traffic Out Of Control"] =
            menu.add_feature(
            "Set Traffic Out Of Control",
            "toggle",
            t.Parent["Vehicle Manager"],
            function(V)
                while V.on do
                    local dr = vehicle.get_all_vehicles()
                    for j = 1, #dr do
                        local bk = vehicle.get_ped_in_vehicle_seat(dr[j], -1)
                        if not ped.is_ped_a_player(bk) then
                            l.request_ctrl(dr[j])
                            vehicle.set_vehicle_forward_speed(dr[j], 40)
                            vehicle.set_vehicle_out_of_control(dr[j], false, false)
                        end
                    end
                    coroutine.yield(100)
                end
            end
        )
        t.Parent["Object Manager"] = menu.add_feature("Object Manager", "parent", t.Parent["local_world"], nil).id
        t.Feature["Delete All Objects"] =
            menu.add_feature(
            "Delete All Objects",
            "toggle",
            t.Parent["Object Manager"],
            function(V)
                aI({"Drive On Ocean", "Drive This Height"})
                local cV
                while V.on do
                    if not cV or menu.has_thread_finished(cV) then
                        cV = menu.create_thread(o.Clearobjects, object.get_all_objects())
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Turn All Objects Invisible"] =
            menu.add_feature(
            "Turn All Objects Invisible",
            "toggle",
            t.Parent["Object Manager"],
            function(V)
                while V.on do
                    local eU = object.get_all_objects()
                    for j = 1, #eU do
                        l.request_ctrl(eU[j])
                        entity.set_entity_visible(eU[j], false)
                    end
                    coroutine.yield(500)
                end
                local eU = object.get_all_objects()
                for j = 1, #eU do
                    l.request_ctrl(eU[j])
                    entity.set_entity_visible(eU[j], true)
                end
            end
        )
        t.Feature["Make All Objects Indestructible"] =
            menu.add_feature(
            "Make All Objects Indestructible",
            "toggle",
            t.Parent["Object Manager"],
            function(V)
                while V.on do
                    local eU = object.get_all_objects()
                    for j = 1, #eU do
                        l.request_ctrl(eU[j])
                        entity.set_entity_god_mode(eU[j], true)
                        entity.freeze_entity(eU[j], true)
                    end
                    coroutine.yield(500)
                end
                local eU = object.get_all_objects()
                for j = 1, #eU do
                    l.request_ctrl(eU[j])
                    entity.set_entity_god_mode(eU[j], false)
                    entity.freeze_entity(eU[j], false)
                end
            end
        )
        t.Feature["Disable Collision with Objects"] =
            menu.add_feature(
            "Disable Collision with Objects",
            "toggle",
            t.Parent["Object Manager"],
            function(V)
                local cV
                while V.on do
                    local ct
                    local eT = k.OwnVehicle()
                    if eT ~= 0 then
                        ct = eT
                    else
                        ct = k.OwnPed()
                    end
                    if not cV or menu.has_thread_finished(cV) then
                        cV = menu.create_thread(o.Objectcollision, {object.get_all_objects(), ct})
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Collect all Pickups"] =
            menu.add_feature(
            "Collect all Pickups",
            "action",
            t.Parent["Object Manager"],
            function()
                local eV = object.get_all_pickups()
                if #eV == 0 then
                    z("No Pickups found!", "Error", "")
                else
                    for j = 1, #eV do
                        entity.set_entity_coords_no_offset(eV[j], k.OwnCoords())
                        coroutine.yield(0)
                    end
                end
            end
        )
        t.Feature["Remove all Pickups"] =
            menu.add_feature(
            "Remove all Pickups",
            "action",
            t.Parent["Object Manager"],
            function()
                local eV = object.get_all_pickups()
                if #eV == 0 then
                    z("No Pickups found!", "Error", "")
                else
                    l.clear(eV)
                end
            end
        )
        t.Feature["Disable Collision with Entites"] =
            menu.add_feature(
            "Disable Collision with Entites",
            "toggle",
            t.Parent["local_world"],
            function(V)
                aI(
                    {
                        "Disable Collision with Vehicles",
                        "Disable Collision with Objects",
                        "Drive On Ocean",
                        "Drive This Height"
                    }
                )
                c["Disable Collision with Entites"] = {Enabled = V.on}
                local eW, eX
                while V.on do
                    local ct
                    local eT = k.OwnVehicle()
                    if eT ~= 0 then
                        ct = eT
                    else
                        ct = k.OwnPed()
                    end
                    if not eW or menu.has_thread_finished(eW) then
                        eW = menu.create_thread(o.Vehiclecollision, {vehicle.get_all_vehicles(), ct})
                    end
                    if not eX or menu.has_thread_finished(eX) then
                        eX = menu.create_thread(o.Objectcollision, {object.get_all_objects(), ct})
                    end
                    coroutine.yield(0)
                end
                c["Disable Collision with Entites"].Enabled = V.on
            end
        )
        t.Feature["Drive On Ocean"] =
            menu.add_feature(
            "Drive / Walk on the Ocean",
            "toggle",
            t.Parent["local_world"],
            function(V)
                if t.Feature["Disable Collision with Entites"].on or t.Feature["Disable Collision with Objects"].on then
                    z("This doesnt work while disabling collision with objects.", nil, "")
                    V.on = false
                    return
                end
                if t.Feature["Clear Area"].on or t.Feature["Delete All Objects"].on then
                    z("This doesnt work while constantly deleting all objects.", nil, "")
                    V.on = false
                    return
                end
                c["Drive On Ocean"] = {Enabled = V.on}
                while V.on do
                    local cw = k.OwnCoords()
                    if aj == nil then
                        aj = n.Object(1822550295, v3(cw.x, cw.y, -4))
                        entity.set_entity_visible(aj, false)
                    end
                    water.set_waves_intensity(-100000000)
                    cw.z = -5
                    l.set_coords(aj, cw)
                    coroutine.yield(0)
                end
                if aj then
                    water.reset_waves_intensity()
                    l.clear({aj})
                    aj = nil
                end
                c["Drive On Ocean"].Enabled = V.on
            end
        )
        t.Feature["Drive This Height"] =
            menu.add_feature(
            "Drive / Walk this Height",
            "toggle",
            t.Parent["local_world"],
            function(V)
                if t.Feature["Disable Collision with Entites"].on or t.Feature["Disable Collision with Objects"].on then
                    z("This doesnt work while disabling collision with objects.", nil, "")
                    V.on = false
                    return
                end
                if t.Feature["Clear Area"].on or t.Feature["Delete All Objects"].on then
                    z("This doesnt work while constantly deleting all objects.", nil, "")
                    V.on = false
                    return
                end
                c["Drive This Height"] = {Enabled = V.on}
                while V.on do
                    local cw, eY
                    if ped.is_ped_in_any_vehicle(k.OwnPed()) then
                        local bo = k.OwnVehicle()
                        cw = entity.get_entity_coords(bo)
                        eY = 5.25
                    else
                        cw = k.OwnCoords()
                        eY = 5.85
                    end
                    if ak == nil then
                        al = cw.z - eY
                        ak = n.Object(1822550295, v3(cw.x, cw.y, al))
                        entity.set_entity_visible(ak, false)
                    end
                    water.set_waves_intensity(-100000000)
                    cw.z = al
                    l.set_coords(ak, cw)
                    coroutine.yield(0)
                end
                if ak then
                    water.reset_waves_intensity()
                    l.clear({ak})
                    ak = nil
                    al = nil
                end
                c["Drive This Height"].Enabled = V.on
            end
        )
        t.Feature["Clear Area"] =
            menu.add_feature(
            "Clear Area",
            "toggle",
            t.Parent["local_world"],
            function(V)
                aI({"Drive On Ocean", "Drive This Height"})
                local eZ, e_, f0
                while V.on do
                    if not eZ or menu.has_thread_finished(eZ) then
                        eZ = menu.create_thread(o.Clearpeds, ped.get_all_peds())
                    end
                    if not e_ or menu.has_thread_finished(e_) then
                        e_ = menu.create_thread(o.Clearvehicles, vehicle.get_all_vehicles())
                    end
                    if not f0 or menu.has_thread_finished(f0) then
                        f0 = menu.create_thread(o.Clearobjects, object.get_all_objects())
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Reset Orbital-Cannon Cooldown"] =
            menu.add_feature(
            "Reset Orbital-Cannon Cooldown",
            "action",
            t.Parent["Stats Editor"].id,
            function()
                m.SetIntStat("ORBITAL_CANNON_COOLDOWN", true, 0)
            end
        )
        t.Feature["Disable Orbital-Cannon Cooldown"] =
            menu.add_feature(
            "Disable Orbital-Cannon Cooldown",
            "toggle",
            t.Parent["Stats Editor"].id,
            function(V)
                c["Disable Orbital-Cannon Cooldown"] = {Enabled = V.on}
                while V.on do
                    m.SetIntStat("ORBITAL_CANNON_COOLDOWN", true, 0)
                    coroutine.yield(2000)
                end
                c["Disable Orbital-Cannon Cooldown"].Enabled = V.on
            end
        )
        t.Feature["Fill Snacks and Armor"] =
            menu.add_feature(
            "Fill Snacks and Armor",
            "action",
            t.Parent["Stats Editor"].id,
            function()
                local f1 = a0["snacks_and_armor"]
                for j = 1, #f1 do
                    m.SetIntStat(f1[j][1], true, f1[j][2])
                end
                z("Filled Inventory with Snacks and Armor!", "Success")
                C("Filled Inventory with Snacks and Armor!")
            end
        )
        t.Feature["Fill Business Clutter"] =
            menu.add_feature(
            "Fill Business Clutter",
            "action_value_str",
            t.Parent["Stats Editor"].id,
            function(V)
                if V.value == 0 then
                    local f1 = a0["ceo_earnings"]
                    for j = 1, #f1 do
                        m.SetIntStat(f1[j][1], true, f1[j][2])
                    end
                else
                    local f1 = a0["mc_earnings"]
                    for j = 1, #f1 do
                        m.SetIntStat(f1[j][1], true, f1[j][2])
                    end
                end
                z("Filled Business with Clutter\nFinish a legit Sell Mission to show Effect!", "Success")
            end
        )
        t.Feature["Fill Business Clutter"]:set_str_data({"CEO", "MC"})
        t.Feature["Set KD (Kills / Death)"] =
            menu.add_feature(
            "Set KD (Kills / Death)",
            "action",
            t.Parent["Stats Editor"].id,
            function()
                local f2 = k.Input("Enter KD (Kills / Death)", 10, 5)
                if not f2 then
                    z("Input canceled.", "Error", "")
                    return
                end
                f2 = tonumber(f2)
                local f1 = a0["kills_deaths"]
                local f3 = math.random(1000, 2000)
                local f4 = math.floor(f2 * f3)
                local f5 = math.floor(f4 / f2)
                C("Setting Stat " .. f1[1] .. " to: " .. f4 .. "\nSetting Stat " .. f1[2] .. " to: " .. f5)
                m.SetIntStat(f1[1], false, f4)
                m.SetIntStat(f1[2], false, f5)
                z("New KD set. To update the KD, earn a legit kill or death!", "Success")
            end
        )
        t.Feature["Set Mental State"] =
            menu.add_feature(
            "Set Mental State",
            "action_value_i",
            t.Parent["Stats Editor"].id,
            function(V)
                m.SetFloatStat("PLAYER_MENTAL_STATE", true, V.value)
                z("Set Mental State to " .. V.value .. ".\nKill any Ped for it to apply.", "Success")
            end
        )
        t.Feature["Set Mental State"].min = 0.0
        t.Feature["Set Mental State"].max = 100.0
        t.Feature["Set Mental State"].mod = 10.0
        t.Feature["Unlock Xmas Liveries"] =
            menu.add_feature(
            "Unlock Xmas Liveries",
            "action",
            t.Parent["Stats Editor"].id,
            function()
                local f1 = a0["xmas"]
                for j = 1, #f1 do
                    m.SetIntStat(f1[j][1], false, -1)
                end
                z("Xmas Liveries Unlocked!", "Success")
            end
        )
        t.Feature["Unlock Fast-Run Ability"] =
            menu.add_feature(
            "Unlock Fast-Run Ability",
            "action",
            t.Parent["Stats Editor"].id,
            function()
                local f1 = a0["fast_run"]
                for j = 1, #f1 do
                    m.SetIntStat(f1[j], true, -1)
                end
                z("New Ability set, Change Lobby to show Effect!", "Success")
            end
        )
        local f6 = a0["perico"]
        t.Parent["Casino Heist Stats"] = menu.add_feature("Casino Heist", "parent", t.Parent["Stats Editor"].id, nil).id
        t.Feature["Reset Heist"] =
            menu.add_feature(
            "Reset Heist",
            "action",
            t.Parent["Casino Heist Stats"],
            function()
                local f1 = a0["chc"]["board2"]
                for j = 1, #f1 do
                    m.SetIntStat(f1[j][2], true, f1[j][3])
                end
                f1 = a0["chc"]["board1"]
                for j = 1, #f1 do
                    m.SetIntStat(f1[j][2], true, f1[j][3])
                end
                f1 = a0["chc"]["misc"]
                for j = 1, #f1 do
                    m.SetIntStat(f1[j][2], true, f1[j][3])
                end
                z("Casino Heist reset!", "Success")
            end
        )
        t.Feature["Heist Quick Start"] =
            menu.add_feature(
            "Quick Start",
            "action_value_str",
            t.Parent["Casino Heist Stats"],
            function(V)
                local f1 = a0["chc"]["misc"]
                if V.value == 0 then
                    m.SetIntStat(f1[1][2], true, f1[1][4])
                    m.SetIntStat(f1[2][2], true, f1[2][4])
                    f1 = a0["chc"]["board1"]
                    for j = 1, #f1 do
                        local f7 = f1[j][4]
                        if f1[j][5] then
                            f7 = math.random(f1[j][4], f1[j][5])
                        end
                        m.SetIntStat(f1[j][2], true, f7)
                    end
                    f1 = a0["chc"]["misc"]
                    m.SetIntStat(f1[3][2], true, f1[3][4])
                    f1 = a0["chc"]["board2"]
                    for j = 1, #f1 do
                        local f7 = f1[j][4]
                        if f1[j][5] then
                            f7 = math.random(f1[j][4], f1[j][5])
                        end
                        m.SetIntStat(f1[j][2], true, f7)
                    end
                    f1 = a0["chc"]["misc"]
                    m.SetIntStat(f1[4][2], true, f1[4][4])
                    z(
                        "Casino Heist set up with random execution. If you dont like it, Reset Heist and try again!",
                        "Success"
                    )
                else
                    m.SetIntStat(f1[1][2], true, f1[1][4])
                    m.SetIntStat(f1[2][2], true, f1[2][4])
                    f1 = a0["chc"]["board1"]
                    for j = 1, #f1 do
                        local f7 = f1[j][6] or f1[j][4]
                        m.SetIntStat(f1[j][2], true, f7)
                    end
                    f1 = a0["chc"]["misc"]
                    m.SetIntStat(f1[3][2], true, f1[3][4])
                    f1 = a0["chc"]["board2"]
                    for j = 1, #f1 do
                        local f7 = f1[j][6] or f1[j][4]
                        if #f1[j] == 5 then
                            f7 = math.random(f1[j][4], f1[j][5])
                        end
                        m.SetIntStat(f1[j][2], true, f1[j][4])
                    end
                    f1 = a0["chc"]["misc"]
                    m.SetIntStat(f1[4][2], true, f1[4][4])
                    z(
                        "Casino Heist set up with highest Payout. If you dont like it, Reset Heist and try again!",
                        "Success"
                    )
                end
            end
        )
        t.Feature["Heist Quick Start"]:set_str_data({"Random", "Highest Payout"})
        t.Parent["First Board"] = menu.add_feature("First Board", "parent", t.Parent["Casino Heist Stats"], nil).id
        t.Feature["Reset last Approach"] =
            menu.add_feature(
            "Reset last Approach",
            "action",
            t.Parent["First Board"],
            function()
                local f1 = a0["chc"]["misc"]
                m.SetIntStat(f1[1][2], true, f1[1][4])
                m.SetIntStat(f1[2][2], true, f1[2][4])
            end
        )
        t.Feature["Unlock Casino POI"] =
            menu.add_feature(
            "Unlock Points of Interests",
            "action",
            t.Parent["First Board"],
            function()
                local f1 = a0["chc"]["board1"]
                m.SetIntStat(f1[4][2], true, f1[4][4])
            end
        )
        t.Feature["Unlock Access Points"] =
            menu.add_feature(
            "Unlock Access Points",
            "action",
            t.Parent["First Board"],
            function()
                local f1 = a0["chc"]["board1"]
                m.SetIntStat(f1[5][2], true, f1[5][4])
            end
        )
        t.Feature["Set Approach"] =
            menu.add_feature(
            "Set Approach",
            "action_value_str",
            t.Parent["First Board"],
            function(V)
                local f1 = a0["chc"]["board1"]
                if V.value == 0 then
                    m.SetIntStat(f1[1][2], true, V.value + 1)
                end
                if V.value == 1 then
                    m.SetIntStat(f1[1][2], true, V.value + 1)
                end
                if V.value == 2 then
                    m.SetIntStat(f1[1][2], true, V.value + 1)
                end
            end
        )
        t.Feature["Set Approach"]:set_str_data({"Silent", "Big Con", "Aggressive"})
        t.Feature["Set Last Approach"] =
            menu.add_feature(
            "Set Last Approach",
            "action_value_str",
            t.Parent["First Board"],
            function(V)
                local f1 = a0["chc"]["board1"]
                m.SetIntStat(f1[2][2], true, V.value + 1)
            end
        )
        t.Feature["Set Last Approach"]:set_str_data({"Silent", "Big Con", "Aggressive"})
        t.Feature["Set Target"] =
            menu.add_feature(
            "Set Target",
            "action_value_str",
            t.Parent["First Board"],
            function(V)
                local f1 = a0["chc"]["board1"]
                m.SetIntStat(f1[3][2], true, V.value)
            end
        )
        t.Feature["Set Target"]:set_str_data({"Money", "Gold", "Art", "Diamonds"})
        t.Feature["Confirm First Board"] =
            menu.add_feature(
            "Confirm First Board",
            "action",
            t.Parent["First Board"],
            function()
                local f1 = a0["chc"]["misc"]
                m.SetIntStat(f1[3][2], true, f1[3][4])
            end
        )
        t.Parent["Second Board"] = menu.add_feature("Second Board", "parent", t.Parent["Casino Heist Stats"], nil).id
        t.Feature["Weapon Member Payout"] =
            menu.add_feature(
            "Choose Gunman",
            "action_value_str",
            t.Parent["Second Board"],
            function(V)
                local f1 = a0["chc"]["board2"]
                m.SetIntStat(f1[1][2], true, V.value + 1)
            end
        )
        t.Feature["Weapon Member Payout"]:set_str_data(
            {
                "Karl Abolaji (5%)",
                "Gustavo Mota (9%)",
                "Charlie Reed (7%)",
                "Chester Mccoy (10%)",
                "Patrick Mcreary (8%)"
            }
        )
        t.Feature["Driver Payout"] =
            menu.add_feature(
            "Choose Driver",
            "action_value_str",
            t.Parent["Second Board"],
            function(V)
                local f1 = a0["chc"]["board2"]
                m.SetIntStat(f1[2][2], true, V.value + 1)
            end
        )
        t.Feature["Driver Payout"]:set_str_data(
            {"Karim Denz (5%)", "Taliana Martinez (7%)", "Eddie Toh (9%)", "Zach Nelson (6%)", "Chester Mccoy (10%)"}
        )
        t.Feature["Hacker Payout"] =
            menu.add_feature(
            "Choose Hacker",
            "action_value_str",
            t.Parent["Second Board"],
            function(V)
                local f1 = a0["chc"]["board2"]
                m.SetIntStat(f1[3][2], true, V.value + 1)
            end
        )
        t.Feature["Hacker Payout"]:set_str_data(
            {
                "Rickie Lukens (3%)",
                "Christian Feltz (7%)",
                "Yohan Blair (5%)",
                "Avi Schwartzman (10%)",
                "Paige Harris (9%)"
            }
        )
        t.Feature["Weapon Variation"] =
            menu.add_feature(
            "Weapon Variation",
            "action_value_str",
            t.Parent["Second Board"],
            function(V)
                local f1 = a0["chc"]["board2"]
                m.SetIntStat(f1[4][2], true, V.value)
            end
        )
        t.Feature["Weapon Variation"]:set_str_data({"01/02", "02/02"})
        t.Feature["Vehicle Variation"] =
            menu.add_feature(
            "Vehicle Variation",
            "action_value_str",
            t.Parent["Second Board"],
            function(V)
                local f1 = a0["chc"]["board2"]
                m.SetIntStat(f1[5][2], true, V.value)
            end
        )
        t.Feature["Vehicle Variation"]:set_str_data({"01/04", "02/04", "03/04", "04/04"})
        t.Feature["Remove Duggan Heavy Guards"] =
            menu.add_feature(
            "Remove Duggan Heavy Guards",
            "action",
            t.Parent["Second Board"],
            function()
                local f1 = a0["chc"]["board2"]
                m.SetIntStat(f1[6][2], true, f1[6][4])
            end
        )
        t.Feature["Equip Heavy Armor"] =
            menu.add_feature(
            "Equip Heavy Armor",
            "action",
            t.Parent["Second Board"],
            function()
                local f8 = a0["chc"]["board2"]
                m.SetIntStat(f8[7][2], true, f8[7][4])
            end
        )
        t.Feature["Unlock Scan Cards"] =
            menu.add_feature(
            "Unlock Scan Cards",
            "action",
            t.Parent["Second Board"],
            function()
                local f1 = a0["chc"]["board2"]
                m.SetIntStat(f1[8][2], true, f1[8][4])
            end
        )
        t.Feature["Confirm Second Board"] =
            menu.add_feature(
            "Confirm Second Board",
            "action",
            t.Parent["Second Board"],
            function()
                local f1 = a0["chc"]["misc"]
                m.SetIntStat(f1[4][2], true, f1[4][4])
            end
        )
        t.Parent["Cayo Perico Stats"] =
            menu.add_feature("Cayo Perico Heist", "parent", t.Parent["Stats Editor"].id, nil).id
        t.Feature["Reset Perico Heist"] =
            menu.add_feature(
            "Reset Heist",
            "action",
            t.Parent["Cayo Perico Stats"],
            function()
                local f1 = f6
                for j = 4, 18 do
                    m.SetIntStat(f1[j][2], true, 0)
                end
                m.SetIntStat(f1[12][2], true, 110154)
                z("Perico Heist has been reset!", "Success")
            end
        )
        t.Feature["Perico Heist Unlocks"] =
            menu.add_feature(
            "Unlocks",
            "action_value_str",
            t.Parent["Cayo Perico Stats"],
            function(V)
                local f8 = f6
                if V.value == 0 then
                    m.SetIntStat(f8[1][2], true, f8[1][4])
                elseif V.value == 1 then
                    m.SetIntStat(f8[2][2], true, f8[2][4])
                elseif V.value == 2 then
                    m.SetIntStat(f8[10][2], true, f8[10][4])
                else
                    m.SetIntStat(f8[3][2], true, f8[3][4])
                end
            end
        )
        t.Feature["Perico Heist Unlocks"]:set_str_data(
            {"Points of Interests", "Entry Points", "Escape Points", "Support Team"}
        )
        t.Feature["Perico Primary Target"] =
            menu.add_feature(
            "Primary Target",
            "action_value_str",
            t.Parent["Cayo Perico Stats"],
            function(V)
                local f8 = f6
                m.SetIntStat(f8[8][2], true, V.value)
            end
        )
        t.Feature["Perico Primary Target"]:set_str_data(
            {"Tequila", "Ruby", "Bearer Bonds", "Pink Diamond", "Madrazo Files", "Panther Statue"}
        )
        t.Feature["Perico Secondary Loot"] =
            menu.add_feature(
            "Mansion Loot",
            "action_value_str",
            t.Parent["Cayo Perico Stats"],
            function(V)
                local f8 = f6
                if V.value == 0 then
                    m.SetIntStat(f8[13][2], true, f8[13][4])
                    m.SetIntStat(f8[14][2], true, f8[14][4])
                    m.SetIntStat(f8[15][2], true, f8[15][4])
                    m.SetIntStat(f8[16][2], true, f8[16][4])
                    m.SetIntStat(f8[17][2], true, f8[17][4])
                    m.SetIntStat(f8[18][2], true, f8[18][4])
                    z("Secondary Loot set for 1 Player", "Success")
                elseif V.value == 1 then
                    m.SetIntStat(f8[13][2], true, f8[13][5])
                    m.SetIntStat(f8[14][2], true, f8[14][5])
                    m.SetIntStat(f8[15][2], true, f8[15][5])
                    m.SetIntStat(f8[16][2], true, f8[16][5])
                    m.SetIntStat(f8[17][2], true, f8[17][5])
                    m.SetIntStat(f8[18][2], true, f8[18][5])
                    z("Secondary Loot set for 2 Players.\nPlayer Cuts: 50% Each", "Success")
                elseif V.value == 2 then
                    m.SetIntStat(f8[13][2], true, f8[13][5])
                    m.SetIntStat(f8[14][2], true, f8[14][5])
                    m.SetIntStat(f8[15][2], true, f8[15][5])
                    m.SetIntStat(f8[16][2], true, f8[16][6])
                    m.SetIntStat(f8[17][2], true, f8[17][5])
                    m.SetIntStat(f8[18][2], true, f8[18][6])
                    z("Secondary Loot set for 3 Players.\nPlayer Cuts: Host 30%, Other Players 35%", "Success")
                elseif V.value == 3 then
                    m.SetIntStat(f8[13][2], true, f8[13][5])
                    m.SetIntStat(f8[14][2], true, f8[14][5])
                    m.SetIntStat(f8[15][2], true, f8[15][5])
                    m.SetIntStat(f8[16][2], true, f8[16][7])
                    m.SetIntStat(f8[17][2], true, f8[17][5])
                    m.SetIntStat(f8[18][2], true, f8[18][7])
                    z("Secondary Loot set for 4 Players.\nPlayer Cuts: 25% Each", "Success")
                end
            end
        )
        t.Feature["Perico Secondary Loot"]:set_str_data({"1 Player", "2 Players", "3 Players", "4 Players"})
        t.Feature["Perico Weapon Variation"] =
            menu.add_feature(
            "Weapon Variation",
            "action_value_str",
            t.Parent["Cayo Perico Stats"],
            function(V)
                local f8 = f6
                m.SetIntStat(f8[4][2], true, V.value + 1)
            end
        )
        t.Feature["Perico Weapon Variation"]:set_str_data(
            {"Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman"}
        )
        t.Feature["Perico Disruptions"] =
            menu.add_feature(
            "Enable Disruptions",
            "action",
            t.Parent["Cayo Perico Stats"],
            function(V)
                local f8 = f6
                m.SetIntStat(f8[5][2], true, f8[5][4])
                m.SetIntStat(f8[6][2], true, f8[6][4])
                m.SetIntStat(f8[7][2], true, f8[7][4])
            end
        )
        t.Feature["Truck Spawn Place"] =
            menu.add_feature(
            "Truck Spawn Place",
            "action_value_str",
            t.Parent["Cayo Perico Stats"],
            function(V)
                local f8 = f6
                m.SetIntStat(f8[9][2], true, V.value + 1)
            end
        )
        t.Feature["Truck Spawn Place"]:set_str_data(
            {"Airport", "North Dock", "East Main Dock", "West Main Dock", "Compound"}
        )
        t.Feature["Perico Difficulty"] =
            menu.add_feature(
            "Set Difficulty",
            "action_value_str",
            t.Parent["Cayo Perico Stats"],
            function(V)
                local f8 = f6
                local f9
                if V.value == 0 then
                    f9 = f8[12][4]
                else
                    f9 = f8[12][5]
                end
                m.SetIntStat(f8[12][2], true, f9)
            end
        )
        t.Feature["Perico Difficulty"]:set_str_data({"Normal", "Hard"})
        t.Feature["Perico Missions Completed"] =
            menu.add_feature(
            "Set Missions as completed",
            "action",
            t.Parent["Cayo Perico Stats"],
            function()
                local f8 = f6
                m.SetIntStat(f8[11][2], true, f8[11][4])
            end
        )
        t.Parent["Delete Outifts"] =
            menu.add_feature(
            "Delete Custom Outfits",
            "parent",
            t.Parent["local_misc"],
            function()
                if not t.Feature["Disable Warning Messages"].on then
                    z("Be aware that deleting the outfits cant be reverted!", "Neutral")
                end
                local _ = utils.get_all_files_in_directory(a["ModdedOutfits"] .. "\\", "ini")
                local fa = t.Parent["Delete Outifts"].children
                for j = 1, #_ do
                    local fb = true
                    for aD = 1, #fa do
                        if fa[aD].name == _[j] then
                            fb = false
                        end
                    end
                    if fb then
                        menu.add_feature(
                            _[j],
                            "action",
                            t.Parent["Delete Outifts"].id,
                            function(V)
                                if utils.file_exists(a["ModdedOutfits"] .. "\\" .. _[j]) then
                                    if io.remove(a["ModdedOutfits"] .. "\\" .. _[j]) then
                                        C("Deleted Outfit: " .. _[j])
                                        return HANDLER_CONTINUE
                                    end
                                    z("ERROR deleting the file, try again!", "Error")
                                    return
                                end
                                menu.delete_feature(V.id)
                            end
                        )
                    end
                end
            end
        )
        t.Parent["Delete Vehicles"] =
            menu.add_feature(
            "Delete Custom Vehicles",
            "parent",
            t.Parent["local_misc"],
            function()
                if not t.Feature["Disable Warning Messages"].on then
                    z("Be aware that deleting the vehicles cant be reverted!", "Neutral")
                end
                local fc = utils.get_all_files_in_directory(a["ModdedVehicles"] .. "\\", "ini")
                local fa = t.Parent["Delete Vehicles"].children
                for j = 1, #fc do
                    local fb = true
                    for aD = 1, #fa do
                        if fa[aD].name == fc[j] then
                            fb = false
                        end
                    end
                    if fb then
                        menu.add_feature(
                            fc[j],
                            "action",
                            t.Parent["Delete Vehicles"].id,
                            function(V)
                                if utils.file_exists(a["ModdedVehicles"] .. "\\" .. fc[j]) then
                                    if io.remove(a["ModdedVehicles"] .. "\\" .. fc[j]) then
                                        C("Deleted Vehicle: " .. fc[j])
                                        return HANDLER_CONTINUE
                                    end
                                    z("ERROR deleting the file, try again!", "Error")
                                    return
                                end
                                menu.delete_feature(V.id)
                            end
                        )
                    end
                end
            end
        )
        t.Parent["Heist Helper"] = menu.add_feature("Heist Helper", "parent", t.Parent["local_misc"], nil).id
        t.Feature["Remove Heist Enemies"] =
            menu.add_feature(
            "Remove Enemies",
            "value_str",
            t.Parent["Heist Helper"],
            function(V)
                while V.on do
                    local eN = ped.get_all_peds()
                    for j = 1, #eN do
                        local fd = entity.get_entity_model_hash(eN[j])
                        if
                            fd == 0x1EEAAD1F or fd == 0x8D8F1B10 or fd == 0xBEC82CA5 or fd == 0xA217F345 or
                                fd == 0x1422D45B or
                                fd == 2127932792 or
                                fd == 1821116645 or
                                fd == 193469166
                         then
                            if V.value == 1 and not entity.is_entity_dead(eN[j]) then
                                ped.set_ped_health(eN[j], 0)
                            elseif V.value == 2 and not entity.is_entity_dead(eN[j]) then
                                local cw = entity.get_entity_coords(eN[j])
                                ped.clear_ped_tasks_immediately(eN[j])
                                gameplay.shoot_single_bullet_between_coords(
                                    cw + v3(0, 0, 1),
                                    cw,
                                    1000,
                                    0xC472FE2,
                                    k.OwnPed(),
                                    false,
                                    true,
                                    1000
                                )
                            else
                                l.clear({eN[j]})
                            end
                        end
                        coroutine.yield(0)
                    end
                    coroutine.yield(250)
                end
            end
        )
        t.Feature["Remove Heist Enemies"]:set_str_data({"Delete", "Kill", "Shoot"})
        t.Feature["Remove Heist Cameras"] =
            menu.add_feature(
            "Remove Cameras",
            "toggle",
            t.Parent["Heist Helper"],
            function(V)
                while V.on do
                    local fe = object.get_all_objects()
                    for j = 1, #fe do
                        local fd = entity.get_entity_model_hash(fe[j])
                        if fd == 4121760380 or fd == 3061645218 or fd == 548760764 or fd == 2135655372 then
                            l.clear({fe[j]})
                        end
                        coroutine.yield(0)
                    end
                    coroutine.yield(250)
                end
            end
        )
        t.Parent["Casino Heist Helper"] = menu.add_feature("Casino Heist", "parent", t.Parent["Heist Helper"], nil).id
        t.Feature["Teleport to Boards"] =
            menu.add_feature(
            "Teleport to Boards",
            "action",
            t.Parent["Casino Heist Helper"],
            function()
                l.tp(v3(2712.885, -369.604, -54.781), 1, -173.626159)
            end
        )
        t.Feature["Teleport to Arcade"] =
            menu.add_feature(
            "Teleport in front of Arcade",
            "action_value_str",
            t.Parent["Casino Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(-618.422, 282.105, 81.661), 1, 0)
                elseif V.value == 1 then
                    l.tp(v3(-240.276, 6231.523, 31.5), 1, 0)
                elseif V.value == 2 then
                    l.tp(v3(1710.239, 4755.552, 41.968), 1, 0)
                elseif V.value == 3 then
                    l.tp(v3(-1289.597, -272.637, 38.934), 1, 0)
                elseif V.value == 4 then
                    l.tp(v3(-101.949, -1774.834, 29.503), 1, 0)
                else
                    l.tp(v3(722.069, -822.387, 24.694), 1, 0)
                end
            end
        )
        t.Feature["Teleport to Arcade"]:set_str_data(
            {"West Vinewood", "Paleto Bay", "Grapeseed", "Rockford Hills", "Davis", "La Mesa"}
        )
        t.Feature["Teleport to Casino Entrance"] =
            menu.add_feature(
            "Teleport to Casino Entrance",
            "action_value_str",
            t.Parent["Casino Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(915.411, 52.702, 80.899), 1, -106.415)
                elseif V.value == 1 then
                    l.tp(v3(977.744, 3.755, 81.149), 1, -4.723)
                elseif V.value == 2 then
                    l.tp(v3(1002.153, 86.149, 80.990), 1, 142.887)
                elseif V.value == 3 then
                    l.tp(v3(1031.371, -268.223, 50.855), 1, -1.479)
                    coroutine.yield(2000)
                    l.tp(v3(995.416, -149.775, 34.597), 1, -1.479)
                elseif V.value == 4 then
                    l.tp(v3(998.007, -56.651, 74.959), 1, -1.479)
                end
            end
        )
        t.Feature["Teleport to Casino Entrance"]:set_str_data(
            {"Main Door", "Staff Lobby", "Waste Disposal", "Sewer Tunnel", "Security Tunnel"}
        )
        t.Feature["Casino Vault Teleports"] =
            menu.add_feature(
            "Vault Teleports",
            "action_value_str",
            t.Parent["Casino Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(2467.166, -279.148, -70.694), 1, 0)
                elseif V.value == 1 then
                    l.tp(v3(2498.584, -238.633, -70.737), 1, 0)
                elseif V.value == 2 then
                    l.tp(v3(2516.404, -238.635, -70.737), 1, 0)
                end
            end
        )
        t.Feature["Casino Vault Teleports"]:set_str_data({"Key Card Door", "Vault Entrance", "Inside Vault"})
        t.Parent["Perico Heist Helper"] =
            menu.add_feature("Cayo Perico Heist", "parent", t.Parent["Heist Helper"], nil).id
        t.Feature["Teleport To Submarine"] =
            menu.add_feature(
            "Teleport to own Submarine",
            "action",
            t.Parent["Perico Heist Helper"],
            function()
                local dr = vehicle.get_all_vehicles()
                for j = 1, #dr do
                    local cu = dr[j]
                    local ff = decorator.decor_get_int(cu, "Player_Submarine")
                    if ff ~= 0 then
                        local cw = entity.get_entity_coords(cu)
                        cw.z = 2
                        local fg = entity.get_entity_heading(cu)
                        l.tp(l.OffsetCoords(cw, fg, 40), 3, fg - 180)
                        return
                    end
                end
                z("Submarine not found.", "Error")
            end
        )
        t.Feature["Teleport To Heist Table"] =
            menu.add_feature(
            "Teleport to Heist-Table",
            "action",
            t.Parent["Perico Heist Helper"],
            function()
                l.tp(v3(1561.042, 385.902, -49.685), 1, -178.7576)
            end
        )
        t.Feature["Perico Entrance Points"] =
            menu.add_feature(
            "Mansion Entrance Points",
            "action_value_str",
            t.Parent["Perico Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(4964.224, -5691.346, 20.114), 1, -149.524)
                elseif V.value == 1 then
                    l.tp(v3(5034.285, -5682.308, 19.877), 1, 141.606)
                elseif V.value == 2 then
                    l.tp(v3(5087.291, -5729.972, 15.772), 1, 138.499)
                elseif V.value == 3 then
                    l.tp(v3(4991.473, -5811.451, 20.881), 1, -18.034)
                elseif V.value == 4 then
                    l.tp(v3(4957.278, -5784.729, 20.838), 1, -91.732)
                else
                    l.tp(v3(5044.107, -5816.188, -11.397), 1, 34.794)
                end
            end
        )
        t.Feature["Perico Entrance Points"]:set_str_data(
            {"Main Gate", "North Wall", "North Gate", "South Wall", "South Gate", "Drainage Tunnel"}
        )
        t.Feature["Perico Mansion Loot Locations"] =
            menu.add_feature(
            "Mansion Loot Locations",
            "action_value_str",
            t.Parent["Perico Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(5006.799, -5756.157, 15.484), 1, 140.548)
                elseif V.value == 1 then
                    l.tp(v3(5082.638, -5756.555, 15.829), 1, 48.199)
                elseif V.value == 2 then
                    l.tp(v3(5008.708, -5786.344, 17.831), 1, 97.236)
                elseif V.value == 3 then
                    l.tp(v3(5029.218, -5735.711, 17.865), 1, 137.546)
                elseif V.value == 4 then
                    l.tp(v3(5000.238, -5749.091, 14.840), 1, 123.632)
                else
                    l.tp(v3(5009.167, -5752.860, 28.845), 1, -122.300)
                end
            end
        )
        t.Feature["Perico Mansion Loot Locations"]:set_str_data(
            {"Main Target", "House 1", "House 2", "House 3", "Underground Loot", "El Rubios Office"}
        )
        t.Feature["Perico Mansion Escape Points"] =
            menu.add_feature(
            "Mansion Escape Points",
            "action_value_str",
            t.Parent["Perico Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(4991.798, -5719.567, 19.880), 1, 41.611)
                elseif V.value == 1 then
                    l.tp(v3(5029.085, -5688.222, 19.877), 1, -48.452)
                elseif V.value == 2 then
                    l.tp(v3(5084.531, -5738.770, 15.677), 1, 54.853)
                elseif V.value == 3 then
                    l.tp(v3(4995.140, -5803.547, 20.877), 1, 139.820)
                elseif V.value == 4 then
                    l.tp(v3(4965.731, -5786.062, 20.877), 1, 155.017)
                end
            end
        )
        t.Feature["Perico Mansion Escape Points"]:set_str_data(
            {"Main Gate", "North Wall", "North Gate", "South Wall", "South Gate"}
        )
        t.Feature["Perico Escape Points"] =
            menu.add_feature(
            "Perico Escape Points",
            "action_value_str",
            t.Parent["Perico Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(4947.979, -5169.805, 2.526), 1, -23.566)
                elseif V.value == 1 then
                    l.tp(v3(5130.842, -4632.660, 1.442), 1, 173.827)
                elseif V.value == 2 then
                    l.tp(v3(4488.520, -4466.0366, 4.225), 1, 59.993)
                else
                    l.tp(v3(4321.404, -3933.961, -20.377), 1, 49.476)
                end
            end
        )
        t.Feature["Perico Escape Points"]:set_str_data({"Main Dock", "North Dock", "Airstrip", "Kosatka"})
        t.Feature["Perico Misc Locations"] =
            menu.add_feature(
            "Misc Locations",
            "action_value_str",
            t.Parent["Perico Heist Helper"],
            function(V)
                if V.value == 0 then
                    l.tp(v3(4477.896, -4579.448, 5.567), 1, -172.023)
                elseif V.value == 1 then
                    l.tp(v3(4363.452, -4566.825, 4.207), 1, -157.731)
                end
            end
        )
        t.Feature["Perico Misc Locations"]:set_str_data({"Power Station", "Control Tower"})
        t.Parent["PTFX"] = menu.add_feature("PTFX", "parent", t.Parent["local_misc"], nil).id
        t.Parent["New Years Eve"] =
            menu.add_feature(
            "New years eve",
            "value_i",
            t.Parent["PTFX"],
            function(V)
                while V.on do
                    local cw = k.OwnCoords() + v3(0, 0, 5)
                    gameplay.shoot_single_bullet_between_coords(
                        cw,
                        cw + v3(math.random(-25, 25), math.random(-25, 25), math.random(50, 75)),
                        0,
                        0x7F7497E5,
                        k.OwnPed(),
                        true,
                        false,
                        125
                    )
                    coroutine.yield(V.value)
                end
            end
        )
        t.Parent["New Years Eve"].max = 500
        t.Parent["New Years Eve"].mod = 25
        t.Feature["Sparkling Ass"] =
            menu.add_feature(
            "Sparkling Ass",
            "toggle",
            t.Parent["PTFX"],
            function(V)
                while V.on do
                    graphics.set_next_ptfx_asset("scr_indep_fireworks")
                    while not graphics.has_named_ptfx_asset_loaded("scr_indep_fireworks") do
                        graphics.request_named_ptfx_asset("scr_indep_fireworks")
                        coroutine.yield(0)
                    end
                    graphics.start_networked_particle_fx_non_looped_at_coord(
                        "scr_indep_firework_trail_spawn",
                        k.OwnCoords(),
                        v3(60, 0, 0),
                        0.33,
                        true,
                        true,
                        true
                    )
                    coroutine.yield(25)
                end
            end
        )
        t.Feature["Sparkling Tires"] =
            menu.add_feature(
            "Sparkling Tires",
            "toggle",
            t.Parent["PTFX"],
            function(V)
                while V.on do
                    local cu = k.OwnVehicle()
                    if cu ~= 0 then
                        local fh = {"wheel_lf", "wheel_rf", "wheel_lr", "wheel_rr"}
                        for j = 1, #fh do
                            local fi = n.Object(1803116220, k.OwnCoords())
                            entity.set_entity_collision(fi, false, false, false)
                            entity.set_entity_visible(fi, false)
                            local dD = entity.get_entity_bone_index_by_name(cu, fh[j])
                            entity.attach_entity_to_entity(fi, cu, dD, v3(), v3(), true, true, false, 0, true)
                            graphics.set_next_ptfx_asset("scr_indep_fireworks")
                            while not graphics.has_named_ptfx_asset_loaded("scr_indep_fireworks") do
                                graphics.request_named_ptfx_asset("scr_indep_fireworks")
                                coroutine.yield(0)
                            end
                            graphics.start_networked_particle_fx_non_looped_at_coord(
                                "scr_indep_firework_trail_spawn",
                                entity.get_entity_coords(fi),
                                v3(60, 0, 0),
                                0.5,
                                true,
                                true,
                                true
                            )
                            l.request_ctrl(fi, 5)
                            entity.detach_entity(fi)
                            entity.set_entity_velocity(fi, v3())
                            l.set_coords(fi, v3(8000, 8000, -1000))
                            entity.delete_entity(fi)
                        end
                        coroutine.yield(25)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Smoke Area"] =
            menu.add_feature(
            "Smoke Area",
            "toggle",
            t.Parent["PTFX"],
            function(V)
                while V.on do
                    for j = 1, 16 do
                        local aV = k.OwnCoords()
                        local fj = 2 * math.pi
                        fj = fj / 16
                        fj = fj * j
                        aV.x = aV.x + 18 * math.cos(fj)
                        aV.y = aV.y + 18 * math.sin(fj)
                        aV.z = aV.z - 2.5
                        graphics.set_next_ptfx_asset("scr_recartheft")
                        while not graphics.has_named_ptfx_asset_loaded("scr_recartheft") do
                            graphics.request_named_ptfx_asset("scr_recartheft")
                            coroutine.yield(0)
                        end
                        graphics.start_networked_particle_fx_non_looped_at_coord(
                            "scr_wheel_burnout",
                            aV,
                            v3(),
                            2.5,
                            true,
                            true,
                            true
                        )
                        coroutine.yield(40)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Fire Circle"] =
            menu.add_feature(
            "Fire Circle",
            "toggle",
            t.Parent["PTFX"],
            function(V)
                while V.on do
                    if ap["fire_balls"][1] == nil then
                        for j = 1, 48 do
                            ap["fire_balls"][j] = n.Object(1803116220, k.OwnCoords())
                            entity.set_entity_collision(ap["fire_balls"][j], false, false, false)
                            entity.set_entity_visible(ap["fire_balls"][j], false)
                        end
                    end
                    for j = 1, 48 do
                        local aV = k.OwnCoords()
                        local fj = 2 * math.pi
                        fj = fj / 48
                        fj = fj * math.random(1, 48)
                        aV.x = aV.x + 10 * math.cos(fj)
                        aV.y = aV.y + 10 * math.sin(fj)
                        aV.z = aV.z - 1.5
                        l.set_coords(ap["fire_balls"][j], aV)
                    end
                    coroutine.yield(10)
                    if ap["fire_circle"][1] == nil then
                        for j = 1, 48 do
                            graphics.set_next_ptfx_asset("weap_xs_vehicle_weapons")
                            while not graphics.has_named_ptfx_asset_loaded("weap_xs_vehicle_weapons") do
                                graphics.request_named_ptfx_asset("weap_xs_vehicle_weapons")
                                coroutine.yield(0)
                            end
                            ap["fire_circle"][j] =
                                graphics.start_networked_ptfx_looped_on_entity(
                                "muz_xs_turret_flamethrower_looping",
                                ap["fire_balls"][j],
                                v3(),
                                v3(90, 0, 0),
                                1
                            )
                        end
                    end
                    coroutine.yield(0)
                end
                l.clear(ap["fire_balls"])
                ap["fire_balls"] = {}
                if ap["fire_circle"][1] then
                    for j = 1, #ap["fire_circle"] do
                        graphics.remove_particle_fx(ap["fire_circle"][j], true)
                    end
                    ap["fire_circle"] = {}
                end
            end
        )
        t.Feature["Fire Fart"] =
            menu.add_feature(
            "Fire Fart",
            "action_value_i",
            t.Parent["PTFX"],
            function(V)
                if k.OwnVehicle() ~= 0 then
                    z("Fire Fart in a vehicle is too dangerous, get out!", "Error")
                else
                    local ax = 0x187D938D
                    local fk = "weap_xs_vehicle_weapons"
                    local fl = "muz_xs_turret_flamethrower_looping"
                    local bb = k.OwnHeading()
                    local bG = n.Vehicle(ax, k.OwnCoords(), bb)
                    l.request_ctrl(bG)
                    entity.set_entity_visible(bG, false)
                    decorator.decor_set_int(bG, "MPBitset", 1 << 10)
                    ped.set_ped_into_vehicle(k.OwnPed(), bG, -1)
                    coroutine.yield(500)
                    graphics.set_next_ptfx_asset(fk)
                    while not graphics.has_named_ptfx_asset_loaded(fk) do
                        graphics.request_named_ptfx_asset(fk)
                        coroutine.yield(0)
                    end
                    local fm = V.value
                    local fire =
                        graphics.start_networked_ptfx_looped_on_entity(fl, k.OwnPed(), v3(), v3(180, 0, 0), fm * 0.1)
                    local aV = entity.get_entity_coords(bG)
                    local b8 = entity.get_entity_rotation(bG)
                    local cn = b8
                    cn:transformRotToDir()
                    cn = cn * 1 * fm
                    cn.z = aV.z + 0.6666666 * fm
                    local fn = cn
                    entity.set_entity_velocity(bG, fn)
                    coroutine.yield(250 * fm)
                    graphics.remove_particle_fx(fire, true)
                    while ped.is_ped_in_any_vehicle(k.OwnPed()) do
                        ai.task_leave_vehicle(k.OwnPed(), bG, 16)
                        coroutine.yield(25)
                    end
                    l.clear({bG})
                end
            end
        )
        t.Feature["Fire Fart"].max = 16
        t.Feature["Fire Fart"].min = 4
        t.Feature["Fire Ass"] =
            menu.add_feature(
            "Fire Ass",
            "toggle",
            t.Parent["PTFX"],
            function(V)
                while V.on do
                    if ap["fire_ass_ball"] == nil then
                        ap["fire_ass_ball"] = n.Object(1803116220, k.OwnCoords())
                        entity.set_entity_collision(ap["fire_ass_ball"], false, false, false)
                        entity.set_entity_visible(ap["fire_ass_ball"], false)
                    end
                    if ap["fire_ass"] == nil then
                        local fk = "weap_xs_vehicle_weapons"
                        local fl = "muz_xs_turret_flamethrower_looping"
                        graphics.set_next_ptfx_asset(fk)
                        while not graphics.has_named_ptfx_asset_loaded(fk) do
                            graphics.request_named_ptfx_asset(fk)
                            coroutine.yield(0)
                        end
                        ap["fire_ass"] =
                            graphics.start_networked_ptfx_looped_on_entity(fl, k.OwnPed(), v3(), v3(180, 0, 0), 0.333)
                    end
                    local aV = k.OwnCoords()
                    l.set_coords(ap["fire_ass_ball"], k.OwnCoords())
                    coroutine.yield(0)
                end
                if ap["fire_ass"] then
                    graphics.remove_particle_fx(ap["fire_ass"], true)
                    ap["fire_ass"] = nil
                end
                l.clear({ap["fire_ass_ball"]})
                ap["fire_ass_ball"] = nil
            end
        )
        t.Parent["Disable HUD Components"] =
            menu.add_feature("Hide HUD Elements", "parent", t.Parent["local_misc"], nil).id
        t.Feature["Disable Mini-Map"] =
            menu.add_feature(
            "Disable All + Minimap",
            "toggle",
            t.Parent["Disable HUD Components"],
            function(V)
                while V.on do
                    ui.hide_hud_and_radar_this_frame()
                    coroutine.yield(0)
                end
            end
        )
        for j = 1, #aq.hudcomponents do
            t.Feature[aq.hudcomponents[j][1]] =
                menu.add_feature(
                aq.hudcomponents[j][1],
                "toggle",
                t.Parent["Disable HUD Components"],
                function(V)
                    while V.on do
                        ui.hide_hud_component_this_frame(aq.hudcomponents[j][2])
                        coroutine.yield(0)
                    end
                end
            )
        end
        t.Feature["Teleport High In Air"] =
            menu.add_feature(
            "Teleport High in Air",
            "action",
            t.Parent["local_misc"],
            function()
                local aV = k.OwnCoords() + v3(0, 0, 5000)
                l.tp(aV)
            end
        )
        t.Feature["Teleport Forward"] =
            menu.add_feature(
            "Teleport Forward",
            "action",
            t.Parent["local_misc"],
            function()
                local bo = k.OwnVehicle()
                if bo ~= 0 then
                    local di = entity.get_entity_speed(bo)
                    l.set_coords(bo, l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 8))
                    vehicle.set_vehicle_forward_speed(bo, di)
                else
                    l.set_coords(k.OwnPed(), l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 8))
                end
            end
        )
        t.Feature["Auto TP Waypoint"] =
            menu.add_feature(
            "Auto Teleport to Waypoint",
            "toggle",
            t.Parent["local_misc"],
            function(V)
                c["Auto TP Waypoint"] = {Enabled = V.on}
                while V.on do
                    local dl = ui.get_waypoint_coord()
                    if dl.x ~= 16000 then
                        if not network.is_session_started() then
                            local aV = k.OwnCoords()
                            local fo = v2()
                            fo.x = aV.x
                            fo.y = aV.y
                            if dl:magnitude(fo) > 35 then
                                local fp = m.GetGroundZ(dl.x, dl.y)
                                l.tp(v3(dl.x, dl.y, fp))
                            end
                            return
                        end
                        local bn = k.OwnPed()
                        if k.OwnVehicle() ~= 0 then
                            bn = k.OwnVehicle()
                        end
                        local fq = 1000
                        entity.set_entity_coords_no_offset(bn, v3(dl.x, dl.y, fq))
                        local fr, fp = gameplay.get_ground_z(v3(dl.x, dl.y, fq))
                        while not fr and fq > 100 do
                            fq = fq - 5
                            entity.set_entity_coords_no_offset(bn, v3(dl.x, dl.y, fq))
                            fr, fp = gameplay.get_ground_z(v3(dl.x, dl.y, fq))
                        end
                        if fq <= 100 then
                            fq = 0
                            local fr, fp = gameplay.get_ground_z(v3(dl.x, dl.y, fq))
                            while not fr and fq < 1000 do
                                fq = fq + 10
                                fr, fp = gameplay.get_ground_z(v3(dl.x, dl.y, fq))
                            end
                        end
                        entity.set_entity_coords_no_offset(bn, v3(dl.x, dl.y, fp + 1))
                    end
                    coroutine.yield(0)
                end
                c["Auto TP Waypoint"].Enabled = V.on
            end
        )
        t.Feature["Fake Ban Screen"] =
            menu.add_feature(
            "Fake Ban Screen",
            "toggle",
            t.Parent["local_misc"],
            function(V)
                while V.on do
                    local aV = v2()
                    local d6 = v2()
                    local fs = v2()
                    aV.x = 0.5
                    aV.y = 0.325
                    d6.x = 0.5
                    d6.y = 0.5
                    fs.x = 0.5
                    fs.y = 0.54
                    ui.set_text_scale(3.0)
                    ui.set_text_font(7)
                    ui.set_text_centre(0)
                    ui.set_text_color(255, 206, 67, 255)
                    ui.set_text_outline(true)
                    ui.draw_text("alert", aV)
                    ui.set_text_scale(0.5)
                    ui.set_text_centre(0)
                    ui.set_text_color(255, 255, 255, 255)
                    ui.draw_text("You have been banned from Grand Theft Auto Online permanently", d6)
                    ui.set_text_scale(0.5)
                    ui.set_text_centre(0)
                    ui.draw_text("Return to Grand Theft Auto V", fs)
                    ui.draw_rect(.5, .5, 1, 1, 0, 0, 0, 255)
                    ui.draw_rect(.5, .492, .52, .0019, 255, 255, 255, 255)
                    ui.draw_rect(.5, .585, .52, .0019, 255, 255, 255, 255)
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Prevent Spectate Death"] =
            menu.add_feature(
            "Prevent Spectate Death",
            "toggle",
            t.Parent["local_misc"],
            function(V)
                c["Prevent Spectate Death"] = {Enabled = V.on}
                while V.on do
                    if
                        player.is_player_spectating(player.player_id()) and
                            network.get_player_player_is_spectating(player.player_id())
                     then
                        local bj = k.OwnCoords()
                        local bo = k.OwnVehicle()
                        if bo ~= 0 then
                            entity.freeze_entity(bo, true)
                        end
                        while player.is_player_spectating(player.player_id()) and
                            network.get_player_player_is_spectating(player.player_id()) do
                            native.call(0xC9156DC11411A9EA, bj.x, bj.y, bj.z)
                            coroutine.yield(0)
                        end
                        if bo ~= 0 then
                            entity.freeze_entity(bo, false)
                        end
                    end
                    c["Prevent Spectate Death"].Enabled = V.on
                    coroutine.yield(0)
                end
                c["Prevent Spectate Death"].Enabled = V.on
            end
        )
        t.Feature["Leave Online"] =
            menu.add_feature(
            "Leave Online",
            "action",
            t.Parent["local_misc"],
            function()
                if not u(native.call(0x580CE4438479CC61):__tointeger()) then
                    z("Cant bail right now.", "Error", "")
                    return
                end
                native.call(0x95914459A87EBA28)
            end
        )
        t.Feature["Lag out of Session"] =
            menu.add_feature(
            "Lag out of Session",
            "action",
            t.Parent["local_misc"],
            function()
                local time = utils.time_ms() + 8500
                while time > utils.time_ms() do
                end
            end
        )
        t.Parent["Menu Console"] =
            menu.add_feature(
            "Menu Console",
            "parent",
            t.Parent["local_settings"],
            function()
                z("The lua Debug Console must be open for this!", "Neutral")
            end
        ).id
        t.Feature["Print Scriptlog"] =
            menu.add_feature(
            "Print Script Notifications",
            "toggle",
            t.Parent["Menu Console"],
            function(V)
                c["Print Scriptlog"] = {Enabled = V.on}
            end
        )
        t.Feature["Print Chat"] =
            menu.add_feature(
            "Print Chat",
            "toggle",
            t.Parent["Menu Console"],
            function(V)
                c["Print Chat"] = {Enabled = V.on}
            end
        )
        t.Feature["Print Joining Players"] =
            menu.add_feature(
            "Print Joining Players",
            "toggle",
            t.Parent["Menu Console"],
            function(V)
                c["Print Joining Players"] = {Enabled = V.on}
            end
        )
        t.Feature["Print Leaving Players"] =
            menu.add_feature(
            "Print Leaving Players",
            "toggle",
            t.Parent["Menu Console"],
            function(V)
                c["Print Leaving Players"] = {Enabled = V.on}
            end
        )
        t.Feature["Print Modder Detections"] =
            menu.add_feature(
            "Print Modder Detections",
            "toggle",
            t.Parent["Menu Console"],
            function(V)
                c["Print Modder Detections"] = {Enabled = V.on}
            end
        )
        t.Parent["Log Settings"] = menu.add_feature("Log Settings", "parent", t.Parent["local_settings"], nil).id
        t.Feature["Enable Script log"] =
            menu.add_feature(
            "Enable Script logs",
            "toggle",
            t.Parent["Log Settings"],
            function(V)
                c["Enable Script log"] = {Enabled = V.on}
                if not V.on then
                    aI({"Log Modder Detections", "Log Chat"})
                end
            end
        )
        t.Feature["Enable Script log"].on = true
        t.Feature["Log Modder Detections"] =
            menu.add_feature(
            "Log Modder Detections",
            "toggle",
            t.Parent["Log Settings"],
            function(V)
                c["Log Modder Detections"] = {Enabled = V.on}
            end
        )
        t.Feature["Log Chat"] =
            menu.add_feature(
            "Log Chat",
            "toggle",
            t.Parent["Log Settings"],
            function(V)
                c["Log Chat"] = {Enabled = V.on}
            end
        )
        t.Feature["Clear Script Logs"] =
            menu.add_feature(
            "Clear Script Logs",
            "action_value_str",
            t.Parent["Log Settings"],
            function(V)
                local ft
                if V.value == 0 then
                    ft = "MainLog"
                elseif V.value == 1 then
                    ft = "ChatLog"
                else
                    ft = "SELog"
                end
                if utils.file_exists(b[ft]) then
                    l.write(io.open(b[ft], "w"), "File cleared")
                    z("Log File cleared.", "Success", "")
                else
                    z("Log File not found.", "Error", "")
                end
            end
        )
        t.Feature["Clear Script Logs"]:set_str_data({"2Take1Script.log", "Chat.log", "ScriptEvents.log"})
        t.Feature["Clear Menu Logs"] =
            menu.add_feature(
            "Clear Menu Logs",
            "action_value_str",
            t.Parent["Log Settings"],
            function(V)
                local ft
                if V.value == 0 then
                    ft = "MenuMainLog"
                elseif V.value == 1 then
                    ft = "MenuPrepLog"
                elseif V.value == 2 then
                    ft = "MenuNetLog"
                elseif V.value == 3 then
                    ft = "MenuNotifLog"
                elseif V.value == 4 then
                    ft = "MenuPlayerLog"
                else
                    ft = "MenuScriptLog"
                end
                if utils.file_exists(b[ft]) then
                    l.write(io.open(b[ft], "w"), "File cleared by 2Take1Script")
                    z("Log File cleared.", "Success", "")
                    C('Log File "' .. ft .. '" cleared.')
                else
                    z("Log File not found.", "Error", "")
                end
            end
        )
        t.Feature["Clear Menu Logs"]:set_str_data(
            {"2Take1Menu.log", "2Take1Prep.log", "net_events.log", "notification.log", "player.log", "script_event.log"}
        )
        t.Parent["Notification Settings"] =
            menu.add_feature("Notification Settings", "parent", t.Parent["local_settings"], nil).id
        t.Feature["Enable Script Notifications"] =
            menu.add_feature(
            "Enable Script Notifications",
            "toggle",
            t.Parent["Notification Settings"],
            function(V)
                c["Enable Script Notifications"] = {Enabled = V.on}
            end
        )
        t.Feature["Enable Script Notifications"].on = true
        t.Feature["Notification Duration"] =
            menu.add_feature(
            "Notification Duration (sec)",
            "autoaction_value_i",
            t.Parent["Notification Settings"],
            function(V)
                c["Notification Duration"] = {Value = V.value}
            end
        )
        t.Feature["Notification Duration"].min = 1
        t.Feature["Notification Duration"].max = 10
        t.Feature["Notification Duration"].value = 8
        t.Feature["Success Notification Color"] =
            menu.add_feature(
            "Success Notification Color",
            "autoaction_value_str",
            t.Parent["Notification Settings"],
            function(V)
                c["Success Notification Color"] = {Value = V.value}
            end
        )
        t.Feature["Success Notification Color"]:set_str_data(
            {"Green", "Yellow", "Red", "Blue", "Purple", "Orange", "Cyan"}
        )
        t.Feature["Success Notification Color"].value = 0
        t.Feature["Neutral Notification Color"] =
            menu.add_feature(
            "Neutral Notification Color",
            "autoaction_value_str",
            t.Parent["Notification Settings"],
            function(V)
                c["Neutral Notification Color"] = {Value = V.value}
            end
        )
        t.Feature["Neutral Notification Color"]:set_str_data(
            {"Green", "Yellow", "Red", "Blue", "Purple", "Orange", "Cyan"}
        )
        t.Feature["Neutral Notification Color"].value = 1
        t.Feature["Error Notification Color"] =
            menu.add_feature(
            "Error Notification Color",
            "autoaction_value_str",
            t.Parent["Notification Settings"],
            function(V)
                c["Error Notification Color"] = {Value = V.value}
            end
        )
        t.Feature["Error Notification Color"]:set_str_data(
            {"Green", "Yellow", "Red", "Blue", "Purple", "Orange", "Cyan"}
        )
        t.Feature["Error Notification Color"].value = 2
        t.Feature["Exclude Friends"] =
            menu.add_feature(
            "Exclude Friends from Lobby Events",
            "toggle",
            t.Parent["local_settings"],
            function(V)
                c["Exclude Friends"] = {Enabled = V.on}
            end
        )
        t.Feature["Disable Warning Messages"] =
            menu.add_feature(
            "Disable Warning Messages",
            "toggle",
            t.Parent["local_settings"],
            function(V)
                c["Disable Warning Messages"] = {Enabled = V.on}
            end
        )
        t.Feature["2Take1Script Parent"] =
            menu.add_feature(
            "2Take1Script Parent",
            "toggle",
            t.Parent["local_settings"],
            function(V)
                c["2Take1Script Parent"] = {Enabled = V.on}
            end
        )
        t.Feature["2Take1Script Parent"].on = true
        t.Parent["Setting Profiles"] =
            menu.add_feature("Setting Profiles", "parent", t.Parent["local_settings"], nil).id
        t.Feature["Settings Add Profile"] =
            menu.add_feature(
            "Add Profile",
            "action",
            t.Parent["Setting Profiles"],
            function()
                local O = k.Input("Enter Profile Name", 25, 2, "Name")
                if not O then
                    z("Input canceled.", "Error", "")
                    return
                end
                local g = a["ScriptSettings"] .. "\\" .. O .. ".ini"
                e.SaveSettings(g)
                C("Profile " .. O .. " Successfully created!")
                z("Profile " .. O .. " Successfully created!", "Success")
                t.Feature["Profile " .. O] =
                    menu.add_feature(
                    O,
                    "action_value_str",
                    t.Parent["Setting Profiles"],
                    function(V)
                        if V.value == 0 then
                            e.SaveSettings(g)
                            C("Settings saved to File.")
                            z("Settings saved to File.", "Success")
                        elseif V.value == 1 then
                            e.LoadSettings(g)
                            C("Settings Successfully Loaded!")
                            z("Settings Successfully Loaded!", "Success")
                        elseif V.value == 2 then
                            local T = k.Input("Enter Profile Name", 25, 2, "Name")
                            if not T then
                                z("Input canceled.")
                                return
                            end
                            e.Rename(g, O, T)
                        else
                            io.remove(g)
                            menu.delete_feature(V.id)
                        end
                    end
                )
                t.Feature["Profile " .. O]:set_str_data({"Save", "Load", "Rename", "Delete"})
            end
        )
        t.Feature["Save Default"] =
            menu.add_feature(
            "Default",
            "action_value_str",
            t.Parent["Setting Profiles"],
            function(V)
                if V.value == 0 then
                    e.SaveSettings()
                    C("Settings saved to File.")
                    z("Settings saved to File.", "Success")
                else
                    e.LoadSettings()
                    C("Settings Successfully Loaded!")
                    z("Settings Successfully Loaded!", "Success")
                end
            end
        )
        t.Feature["Save Default"]:set_str_data({"Save", "Load"})
        local fu = utils.get_all_files_in_directory(a["ScriptSettings"], "ini")
        for j = 1, #fu do
            if fu[j] ~= "Default.ini" then
                local O = fu[j]:sub(1, -5)
                t.Feature["Profile " .. O] =
                    menu.add_feature(
                    O,
                    "action_value_str",
                    t.Parent["Setting Profiles"],
                    function(V)
                        local g = a["ScriptSettings"] .. "\\" .. O .. ".ini"
                        if V.value == 0 then
                            e.SaveSettings(g)
                            C("Settings saved to File.")
                            z("Settings saved to File.", "Success")
                        elseif V.value == 1 then
                            e.LoadSettings(g)
                            C("Settings Successfully Loaded!")
                            z("Settings Successfully Loaded!", "Success")
                        elseif V.value == 2 then
                            local T = k.Input("Enter Profile Name", 25, 2, "Name")
                            if not T then
                                z("Input canceled.")
                                return
                            end
                            e.Rename(g, O, T)
                        else
                            io.remove(g)
                            menu.delete_feature(V.id)
                        end
                    end
                )
                t.Feature["Profile " .. O]:set_str_data({"Save", "Load", "Rename", "Delete"})
            end
        end
        e.Log("Local features successfully loaded.")
    end,
    nil
)
local fv =
    menu.create_thread(
    function()
        t.Parent["Player Utils"] = menu.add_player_feature("Player Utils", "parent", t.playerparent, nil).id
        t.Feature["Player Waypoint"] =
            menu.add_player_feature(
            "Waypoint Player",
            "toggle",
            t.Parent["Player Utils"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No need to do that.", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    local aV = k.PlayerCoords(bB)
                    ui.set_new_waypoint(v2(aV.x, aV.y))
                    coroutine.yield(500)
                end
                ui.set_waypoint_off()
            end
        )
        t.Feature["Player Teleport"] =
            menu.add_player_feature(
            "TP to Player",
            "action",
            t.Parent["Player Utils"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No need to do that.", "Error", "")
                    return
                end
                l.tp(k.PlayerCoords(bB), 3)
            end
        )
        t.Feature["Player Teleport 2"] =
            menu.add_player_feature(
            "Parachute to Player",
            "action",
            t.Parent["Player Utils"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No need to do that.", "Error", "")
                    return
                end
                local bk = k.OwnPed()
                if not weapon.has_ped_got_weapon(bk, 0xFBAB5776) then
                    weapon.give_delayed_weapon_to_ped(bk, 0xFBAB5776, 1, 1)
                end
                if k.OwnVehicle() ~= 0 then
                    ped.clear_ped_tasks_immediately(bk)
                end
                local bj = l.OffsetCoords(k.PlayerCoords(bB), k.PlayerHeading(bB), -200)
                bj.z = m.GetGroundZ(bj.x, bj.y) + 120
                l.tp(bj, 3)
            end
        )
        t.Feature["Copy to Clipboard"] =
            menu.add_player_feature(
            "Copy Info to Clipboard",
            "action_value_str",
            t.Parent["Player Utils"],
            function(V, bB)
                if V.value == 0 then
                    utils.to_clipboard(tostring(k.Name(bB)))
                elseif V.value == 1 then
                    utils.to_clipboard(k.SCID(bB))
                elseif V.value == 2 then
                    utils.to_clipboard(tostring(k.IP(bB)))
                elseif V.value == 3 then
                    utils.to_clipboard(m.DecToHex2(k.HostToken(bB)))
                end
                z("Info copied to clipboard", "Success", "")
            end
        )
        t.Feature["Copy to Clipboard"]:set_str_data({"Name", "SCID", "IP", "Host Token"})
        t.Feature["Player Add Fake Friends"] =
            menu.add_player_feature(
            "Add to Fake Friends",
            "action_value_str",
            t.Parent["Player Utils"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No need to do that.", "Error", "")
                    return
                end
                if F(bB) then
                    z("Player already exists in your Fake Friends!", "Error")
                else
                    if V.value == 0 then
                        l.write(io.open(b["FakeFriends"], "a"), k.Name(bB) .. ":" .. m.DecToHex(k.SCID(bB)) .. ":c")
                        z(
                            "Added " .. k.Name(bB) .. " to the Fake Friends\nReinject the Menu for it to take effect",
                            "Success"
                        )
                    end
                    if V.value == 1 then
                        l.write(io.open(b["FakeFriends"], "a"), k.Name(bB) .. ":" .. m.DecToHex(k.SCID(bB)) .. ":11")
                        z(
                            "Added " .. k.Name(bB) .. " to the Fake Friends\nReinject the Menu for it to take effect",
                            "Success"
                        )
                    end
                    if V.value == 2 then
                        l.write(io.open(b["FakeFriends"], "a"), k.Name(bB) .. ":" .. m.DecToHex(k.SCID(bB)) .. ":1")
                        z(
                            "Added " .. k.Name(bB) .. " to the Fake Friends\nReinject the Menu for it to take effect",
                            "Success"
                        )
                    end
                end
            end
        )
        t.Feature["Player Add Fake Friends"]:set_str_data({"Blacklist + Hidden", "Friend List + Stalk", "Stalk"})
        t.Feature["Player Remove Fake Friends"] =
            menu.add_player_feature(
            "Remove from Fake Friends",
            "action",
            t.Parent["Player Utils"],
            function(V, bB)
                local eF = {}
                for bP in io.lines(b["FakeFriends"]) do
                    local J = {}
                    for K in bP:gmatch("[^:]+") do
                        J[#J + 1] = K
                    end
                    if #J >= 2 then
                        local L = J[1]
                        local M = tonumber(J[2], 16)
                        local bX = J[3]
                        eF[L] = {Name = L, SCID = M, Flag = bX}
                    end
                end
                if eF[k.Name(bB)] and eF[k.Name(bB)].SCID == k.SCID(bB) then
                    eF[k.Name(bB)] = nil
                else
                    z("Player not found.", "Error", "")
                    return
                end
                eF["[SCID]"] = nil
                l.write(io.open(b["FakeFriends"], "w"), "[SCID]")
                for b_ in pairs(eF) do
                    l.write(
                        io.open(b["FakeFriends"], "a"),
                        eF[b_].Name .. ":" .. m.DecToHex(eF[b_].SCID) .. ":" .. eF[b_].Flag
                    )
                end
                z(
                    k.Name(bB) .. " has been removed from the Fake Friends\nReinject the Menu for it to take effect",
                    "Success"
                )
            end
        )
        t.Feature["Add to Player Blacklist"] =
            menu.add_player_feature(
            "Add to Player Blacklist",
            "action",
            t.Parent["Player Utils"],
            function(fw, bB)
                if bB == player.player_id() then
                    z("No need to do that.", "Error", "")
                    return
                end
                local eF = {}
                local L = k.Name(bB)
                local M = k.SCID(bB)
                local bQ = k.IP(bB)
                if not utils.file_exists(b["Blacklist"]) then
                    goto ca
                end
                for bP in io.lines(b["Blacklist"]) do
                    eF[bP] = true
                end
                if eF[L .. ":" .. M .. ":" .. bQ] then
                    z("Player already exists in the blacklist", "Error", "")
                    return
                end
                ::ca::
                l.write(io.open(b["Blacklist"], "a"), L .. ":" .. M .. ":" .. bQ)
                t.Feature[L .. "/" .. M] =
                    menu.add_feature(
                    L,
                    "action_value_str",
                    t.Parent["Player Blacklist Profiles"],
                    function(V)
                        if V.value == 0 then
                            z(
                                "Name: " .. L .. "\nSCID: " .. M .. "\nIP: " .. bQ,
                                "Success",
                                "2Take1Script Player Blacklist"
                            )
                        else
                            eF[L .. ":" .. M .. ":" .. bQ] = nil
                            l.write(io.open(b["Blacklist"], "w"))
                            for b_ in pairs(eF) do
                                l.write(io.open(b["Blacklist"], "a"), b_)
                            end
                            menu.delete_feature(V.id)
                            z("Entry Deleted", "Success", "2Take1Script Player Blacklist")
                        end
                    end
                )
                t.Feature[L .. "/" .. M]:set_str_data({"Show Info", "Delete"})
                z("Player added to Blacklist.", "Success", "2Take1Script Player Blacklist")
            end
        )
        t.Parent["Player Vehicle"] = menu.add_player_feature("Vehicle Options", "parent", t.playerparent, nil).id
        t.Feature["Player Remote Control"] =
            menu.add_player_feature(
            "Remote Control Vehicle",
            "toggle",
            t.Parent["Player Vehicle"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    V.on = false
                    return
                end
                for j = 0, 31 do
                    if j ~= bB and player.is_player_valid(j) and t.Feature["Player Remote Control"].on[j] then
                        z("Feature is already on for another Player.", "Error", "")
                        V.on = false
                        return
                    end
                end
                if network.get_player_player_is_spectating(player.player_id()) ~= nil then
                    z("This doesnt work properly while specating someone", "Error", "")
                    V.on = false
                    return
                end
                local bk = k.OwnPed()
                if interior.get_interior_from_entity(bk) ~= 0 then
                    z("This doesnt work while inside of a building", "Error", "")
                    V.on = false
                    return
                end
                local aM = k.PlayerVehicle(bB)
                if aM == 0 then
                    z("No vehicle found.", "Error", "")
                    V.on = false
                    return
                end
                if not l.request_ctrl(aM, 5000) then
                    z("Failed to gain control over the Players vehicle.", "Error", "")
                    V.on = false
                    return
                end
                local fd = entity.get_entity_model_hash(aM)
                local cu = n.Vehicle(fd, k.OwnCoords())
                decorator.decor_set_int(cu, "MPBitset", 1 << 10)
                l.SetVehicleMods(cu, l.GetVehicleMods(aM))
                vehicle.set_vehicle_number_plate_index(cu, 0)
                vehicle.set_vehicle_number_plate_text(cu, " ")
                ped.set_ped_into_vehicle(bk, cu, -1)
                l.request_ctrl(cu, 100)
                l.set_coords(cu, entity.get_entity_coords(aM))
                entity.set_entity_rotation(cu, entity.get_entity_rotation(aM))
                entity.set_entity_collision(cu, false, false, 0)
                entity.attach_entity_to_entity(aM, cu, 0, v3(), v3(), true, false, false, 0, true)
                entity.set_entity_collision(cu, true, true, 0)
                while V.on do
                    l.request_ctrl(aM)
                    vehicle.set_vehicle_number_plate_index(cu, 0)
                    vehicle.set_vehicle_number_plate_text(aM, " ")
                    coroutine.yield(0)
                end
                local eJ = entity.get_entity_speed(cu)
                local ds = entity.get_entity_coords(cu)
                ds.z = m.GetGroundZ(ds.x, ds.y)
                ped.clear_ped_tasks_immediately(bk)
                l.clear(cu)
                coroutine.yield(200)
                entity.set_entity_coords_no_offset(aM, ds + v3(0, 0, 2))
                coroutine.yield(200)
                vehicle.set_vehicle_forward_speed(aM, eJ)
                entity.set_entity_collision(cu, true, true, 0)
            end
        )
        t.Parent["Player Ramp Builder"] =
            menu.add_player_feature("Ramp Spawner", "parent", t.Parent["Player Vehicle"], nil).id
        t.Feature["Player Ramp Builder Invisible"] =
            menu.add_player_feature(
            "Spawn Invisible",
            "toggle",
            t.Parent["Player Ramp Builder"],
            function(V)
                c["Player Ramp Builder Invisible"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Ramp Builder Remove"] =
            menu.add_player_feature(
            "Delete Ramps",
            "action",
            t.Parent["Player Ramp Builder"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                local fx = object.get_all_objects()
                for j = 1, #fx do
                    if entity.get_entity_attached_to(fx[j]) == bo then
                        local ax = entity.get_entity_model_hash(fx[j])
                        if ax == 2934970695 or ax == 3233397978 or ax == 1290523964 then
                            l.clear(fx[j])
                        end
                    end
                end
            end
        )
        for fy = 1, #aq.ramps.versions do
            t.Feature["Player Ramp Builder " .. aq.ramps.versions[fy][1]] =
                menu.add_player_feature(
                aq.ramps.versions[fy][1] .. " Ramp",
                "action_value_str",
                t.Parent["Player Ramp Builder"],
                function(V, bB)
                    local ax = aq.ramps[V.value + 1]
                    local bo = k.PlayerVehicle(bB)
                    if bo == 0 then
                        z("No vehicle found.", "Error", "")
                        return
                    end
                    if not l.request_ctrl(bo, 5000) then
                        z(
                            "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                            "Error",
                            ""
                        )
                        return
                    end
                    local fz = n.Object(ax, v3())
                    entity.attach_entity_to_entity(
                        fz,
                        bo,
                        0,
                        aq.ramps.versions[fy][2],
                        aq.ramps.versions[fy][3],
                        true,
                        true,
                        false,
                        0,
                        true
                    )
                    if t.Feature["Player Ramp Builder Invisible"].on[bB] then
                        entity.set_entity_visible(fz, false)
                    end
                end
            )
            t.Feature["Player Ramp Builder " .. aq.ramps.versions[fy][1]]:set_str_data({"Small", "Medium", "Big"})
        end
        t.Feature["Player Teleport Vehicle"] =
            menu.add_player_feature(
            "Teleport Vehicle",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if V.value == 3 then
                    local eC = k.Input("Enter X coordinate", 20, 3)
                    if not eC then
                        z("Input canceled.", "Error", "")
                        return
                    end
                    local eD = tonumber(k.Input("Enter Y coordinate", 20, 3))
                    if not eD then
                        z("Input canceled.", "Error", "")
                        return
                    end
                    local eE = tonumber(k.Input("Enter Z coordinate", 20, 3))
                    if not eE then
                        z("Input canceled.", "Error", "")
                        return
                    end
                    if not l.request_ctrl(bo, 5000) then
                        z(
                            "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                            "Error",
                            ""
                        )
                    end
                    l.set_coords(bo, v3(eC, eD, eE))
                else
                    if not l.request_ctrl(bo, 5000) then
                        z(
                            "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                            "Error",
                            ""
                        )
                    end
                    if V.value == 0 then
                        l.set_coords(bo, l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 5))
                    elseif V.value == 1 then
                        l.set_coords(bo, v3(120, -25, -50))
                    elseif V.value == 2 then
                        l.set_coords(bo, v3(10000, -10000, 0))
                    end
                end
            end
        )
        t.Feature["Player Teleport Vehicle"]:set_str_data({"To Me", "Underground", "Ocean", "Custom Coords"})
        t.Feature["Player Vehicle Godmode"] =
            menu.add_player_feature(
            "Vehicle Godmode",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                if V.value == 0 then
                    if entity.get_entity_god_mode(bo) then
                        z("Players vehicle is already in godmode.", "Error", "")
                        return
                    end
                    entity.set_entity_god_mode(bo, true)
                elseif V.value == 1 then
                    if not entity.get_entity_god_mode(bo) then
                        z("Players vehicle is not in godmode.", "Error", "")
                        return
                    end
                    entity.set_entity_god_mode(bo, false)
                end
            end
        )
        t.Feature["Player Vehicle Godmode"]:set_str_data({"Give", "Remove"})
        t.Feature["Player Prevent Lock-On"] =
            menu.add_player_feature(
            "Prevent Lock-On",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                if V.value == 0 then
                    vehicle.set_vehicle_can_be_locked_on(bo, false, false)
                elseif V.value == 1 then
                    vehicle.set_vehicle_can_be_locked_on(bo, true, true)
                end
            end
        )
        t.Feature["Player Prevent Lock-On"]:set_str_data({"Enable", "Disable"})
        t.Feature["Player Upgrade Vehicle"] =
            menu.add_player_feature(
            "Upgrade Vehicle",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                l.MaxVehicle(bo, V.value + 1)
            end
        )
        t.Feature["Player Upgrade Vehicle"]:set_str_data({"Full", "Performance", "Random"})
        t.Feature["Player Downgrade Vehicle"] =
            menu.add_player_feature(
            "Downgrade Vehicle",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                vehicle.set_vehicle_mod_kit_type(bo, 0)
                if V.value == 0 then
                    for j = 0, 47 do
                        vehicle.set_vehicle_mod(bo, j, -1, false)
                        vehicle.toggle_vehicle_mod(bo, j, false)
                    end
                    vehicle.set_vehicle_bulletproof_tires(bo, false)
                    vehicle.set_vehicle_window_tint(bo, 0)
                    vehicle.set_vehicle_number_plate_index(bo, 0)
                else
                    local fA = {11, 12, 13, 15, 16}
                    for j = 1, #fA do
                        vehicle.set_vehicle_mod(bo, fA[j], -1, false)
                    end
                    vehicle.toggle_vehicle_mod(bo, 18, false)
                    vehicle.set_vehicle_bulletproof_tires(bo, false)
                end
            end
        )
        t.Feature["Player Downgrade Vehicle"]:set_str_data({"Full", "Performance"})
        t.Feature["Player Clone Vehicle"] =
            menu.add_player_feature(
            "Clone Vehicle",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo
                if V.value == 0 then
                    bo = k.PlayerVehicle(bB)
                else
                    bo = r.GetPersonalVehicle(bB)
                end
                if not bo or bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                local fB = entity.get_entity_model_hash(bo)
                local fC = n.Vehicle(fB, l.OffsetCoords(k.OwnCoords(), k.OwnHeading(), 10))
                if not fC then
                    z("Failed to clone Vehicle, couldnt get the Vehicles Hash", "Error", "")
                    return
                end
                l.SetVehicleMods(fC, l.GetVehicleMods(bo))
            end
        )
        t.Feature["Player Clone Vehicle"]:set_str_data({"Current Vehicle", "Personal Vehicle"})
        t.Feature["Player Repair Vehicle"] =
            menu.add_player_feature(
            "Repair Vehicle",
            "action",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                l.RepairVehicle(bo)
            end
        )
        t.Feature["Player Delete Vehicle"] =
            menu.add_player_feature(
            "Delete Vehicle",
            "action",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                entity.delete_entity(bo)
            end
        )
        t.Feature["Player Freeze Vehicle"] =
            menu.add_player_feature(
            "Freeze Vehicle",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                if V.value == 0 then
                    entity.freeze_entity(bo, true)
                elseif V.value == 1 then
                    entity.freeze_entity(bo, false)
                end
            end
        )
        t.Feature["Player Freeze Vehicle"]:set_str_data({"Freeze", "Unfreeze"})
        t.Feature["Player Vehicle Kick"] =
            menu.add_player_feature(
            "Vehicle Kick",
            "action",
            t.Parent["Player Vehicle"],
            function(V, bB)
                r.Send("Vehicle Kick", {player.player_id(), 4294967295, 4294967295, 4294967295}, bB)
            end
        )
        t.Feature["Player Vehicle EMP"] =
            menu.add_player_feature(
            "EMP (Script Event)",
            "action",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                r.Send("Vehicle EMP", {player.player_id(), m.ToInt(aV.x), m.ToInt(aV.y), m.ToInt(aV.z), 0}, bB)
            end
        )
        t.Feature["Player Vehicle EMP Explosion"] =
            menu.add_player_feature(
            "EMP Explosion",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                if V.value == 0 then
                    fire.add_explosion(
                        l.OffsetCoords(aV, player.get_player_heading(bB), 2),
                        83,
                        true,
                        false,
                        0,
                        k.PlayerPed(bB)
                    )
                elseif V.value == 1 then
                    fire.add_explosion(
                        l.OffsetCoords(aV, player.get_player_heading(bB), 2),
                        83,
                        false,
                        true,
                        0,
                        k.PlayerPed(bB)
                    )
                end
            end
        )
        t.Feature["Player Vehicle EMP Explosion"]:set_str_data({"Normal", "Silent"})
        t.Feature["Player Trap In Vehicle"] =
            menu.add_player_feature(
            "Trap In Vehicle",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                vehicle.set_vehicle_mod_kit_type(bo, 0)
                vehicle.set_vehicle_mod(bo, 16, 0, true)
                vehicle.set_vehicle_doors_locked(bo, 4)
                if V.value == 0 then
                    vehicle.set_vehicle_engine_health(bo, 0)
                elseif V.value == 1 then
                    l.set_coords(bo, v3(10, 685, 186))
                end
            end
        )
        t.Feature["Player Trap In Vehicle"]:set_str_data({"Set on Fire", "Drown Underwater"})
        t.Feature["Player Tire Burst"] =
            menu.add_player_feature(
            "Tire Burst Spam",
            "value_i",
            t.Parent["Player Vehicle"],
            function(V, bB)
                while V.on do
                    local bo = k.PlayerVehicle(bB)
                    if bo == 0 then
                        goto ca
                    end
                    l.request_ctrl(bo)
                    vehicle.set_vehicle_mod_kit_type(bo, 0)
                    vehicle.set_vehicle_bulletproof_tires(bo, false)
                    vehicle.set_vehicle_tires_can_burst(bo, true)
                    for j = 0, 6 do
                        vehicle.set_vehicle_tire_burst(bo, j, true, 1000.0)
                    end
                    ::ca::
                    coroutine.yield(V.value)
                end
            end
        )
        t.Feature["Player Tire Burst"].min = 0
        t.Feature["Player Tire Burst"].max = 500
        t.Feature["Player Tire Burst"].mod = 50
        t.Feature["Player Tire Burst"].value = 50
        t.Feature["Player Detonate Vehicle"] =
            menu.add_player_feature(
            "Detonate Vehicle",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                if V.value == 0 then
                    vehicle.add_vehicle_phone_explosive_device(bo)
                    if not vehicle.has_vehicle_phone_explosive_device(bo) then
                        z("Failed to place an explosive device on the Players vehicle.", "Error", "")
                        return
                    end
                    if entity.get_entity_god_mode(bo) then
                        entity.set_entity_god_mode(bo, false)
                    end
                    vehicle.detonate_vehicle_phone_explosive_device()
                elseif V.value == 1 then
                    if not menu.is_trusted_mode_enabled() then
                        z("Not available while trusted mode is turned off", "Error", "")
                        return
                    end
                    native.call(0x301A42153C9AD707, bo, true, false, 0)
                end
            end
        )
        t.Feature["Player Detonate Vehicle"]:set_str_data({"Named", "Anonymous"})
        t.Feature["Player Destroy Personal Vehicle"] =
            menu.add_player_feature(
            "Destroy Personal Vehicle",
            "action",
            t.Parent["Player Vehicle"],
            function(V, bB)
                if r.GetPersonalVehicle(bB) == 0 then
                    z("Player has no personal vehicle", "Error", "")
                    return
                end
                r.Send("Destroy Personal Vehicle", {player.player_id(), bB}, bB)
                r.Send("Vehicle Kick", {player.player_id(), 4294967295, 4294967295, 4294967295}, bB)
            end
        )
        t.Feature["Player Modify Speed"] =
            menu.add_player_feature(
            "Modify Speed",
            "action_value_str",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if V.value == 0 then
                    local di = tonumber(k.Input("Enter modified Speed (1-1000)", 4, 3))
                    if not di then
                        z("Input canceled.", "Error", "")
                        return
                    end
                    if di < 1 or di > 1000 then
                        z("Input must be between 1 and 1000.", "Error", "")
                        return
                    end
                    if not l.request_ctrl(bo, 5000) then
                        z(
                            "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                            "Error",
                            ""
                        )
                    end
                    vehicle.modify_vehicle_top_speed(bo, di)
                    entity.set_entity_max_speed(bo, di)
                else
                    if not l.request_ctrl(bo, 5000) then
                        z(
                            "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                            "Error",
                            ""
                        )
                    end
                    vehicle.modify_vehicle_top_speed(bo, 1)
                    l.RepairVehicle(bo)
                end
            end
        )
        t.Feature["Player Modify Speed"]:set_str_data({"Modify", "Reset"})
        t.Feature["Player Random Force"] =
            menu.add_player_feature(
            "Apply random Force",
            "action",
            t.Parent["Player Vehicle"],
            function(V, bB)
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    z("No vehicle found.", "Error", "")
                    return
                end
                if not l.request_ctrl(bo, 5000) then
                    z(
                        "Failed to gain control over the Players vehicle.\nThe feature might not have worked.",
                        "Error",
                        ""
                    )
                end
                local fD = entity.get_entity_velocity(bo)
                for j = 1, 5 do
                    fD.x = math.random(math.floor(fD.x - 50), math.floor(fD.x + 50))
                    fD.y = math.random(math.floor(fD.y - 50), math.floor(fD.y + 50))
                    fD.z = math.random(math.floor(fD.z - 50), math.floor(fD.z + 50))
                    entity.set_entity_velocity(bo, fD)
                    coroutine.yield(10)
                end
            end
        )
        t.Parent["Player Trolling"] = menu.add_player_feature("Trolling", "parent", t.playerparent, nil).id
        t.Parent["Player Fake Invites"] =
            menu.add_player_feature("Fake Invites", "parent", t.Parent["Player Trolling"], nil).id
        t.Feature["Player Fake Invite"] =
            menu.add_player_feature(
            "Fake Invite (Named)",
            "action_value_str",
            t.Parent["Player Fake Invites"],
            function(V, bB)
                r.Send("Fake Invite", {player.player_id(), V.value + 1}, bB)
            end
        )
        t.Feature["Player Fake Invite"]:set_str_data(
            {"Yacht", "Office", "Clubhouse", "Office Garage", "Custom Auto Shop", "Apartment"}
        )
        t.Feature["Player Fake Invite 2"] =
            menu.add_player_feature(
            "Fake Invite 2 (Named)",
            "action_value_str",
            t.Parent["Player Fake Invites"],
            function(V, bB)
                r.Send("Fake Invite 2", {player.player_id(), V.value}, bB)
            end
        )
        t.Feature["Player Fake Invite 2"]:set_str_data({"Scramble", "Head-to-Head Race", "Sprint", "ERROR"})
        t.Feature["Player Fake Invite 3"] =
            menu.add_player_feature(
            "Anonymous Fake Invite",
            "action_value_str",
            t.Parent["Player Fake Invites"],
            function(V, bB)
                r.Send("Fake Invite 3", {player.player_id(), math.random(0, 179), aq.smslocations[V.value + 1]}, bB)
            end
        )
        t.Feature["Player Fake Invite 3"]:set_str_data(
            {
                "Business",
                "Vehicle Warehouse",
                "Bunker",
                "Mobile Operations Center",
                "Hangar",
                "Avenger",
                "Facility",
                "Nightclub",
                "Terrorbyte",
                "Arena Workshop",
                "Penthouse",
                "Arcade",
                "Kosatka",
                "Record A Studios",
                "Auto Shop",
                "LS Car Meet",
                "Agency",
                "ERROR"
            }
        )
        t.Feature["Player Fake Invite Spam"] =
            menu.add_player_feature(
            "Fake Invite Spam",
            "toggle",
            t.Parent["Player Fake Invites"],
            function(V, bB)
                while V.on do
                    r.Send(
                        "Fake Invite 3",
                        {player.player_id(), math.random(0, 179), aq.smslocations[math.random(#aq.smslocations)]},
                        bB
                    )
                    coroutine.yield(100)
                end
            end
        )
        t.Parent["Player Notifications"] =
            menu.add_player_feature("Notifications", "parent", t.Parent["Player Trolling"], nil).id
        t.Feature["Player Job Notification"] =
            menu.add_player_feature(
            "Job Notification: Input",
            "action",
            t.Parent["Player Notifications"],
            function(V, bB)
                local dT = tostring(k.Input("Enter Job Name", 100))
                if not dT then
                    z("Input canceled.", "Error", "")
                    return
                end
                local au = utils.str_to_vecu64(dT)
                local dU = {player.player_id()}
                for j = 1, #au do
                    dU[j + 1] = au[j]
                end
                r.Send("Force To Mission 2", dU, bB)
            end
        )
        t.Feature["Player Cash Removed"] =
            menu.add_player_feature(
            "Cash Removed",
            "action_value_str",
            t.Parent["Player Notifications"],
            function(V, bB)
                if V.value == 0 then
                    r.Send("Notification", {player.player_id(), 689178114, math.random(-2147483647, 2147483647)}, bB)
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                r.Send("Notification", {player.player_id(), 689178114, dV}, bB)
            end
        )
        t.Feature["Player Cash Removed"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Player Cash Stolen"] =
            menu.add_player_feature(
            "Cash Stolen",
            "action_value_str",
            t.Parent["Player Notifications"],
            function(V, bB)
                if V.value == 0 then
                    r.Send("Notification", {player.player_id(), 2187973097, math.random(-2147483647, 2147483647)}, bB)
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                r.Send("Notification", {player.player_id(), 2187973097, dV}, bB)
            end
        )
        t.Feature["Player Cash Stolen"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Player Cash Banked"] =
            menu.add_player_feature(
            "Cash Banked",
            "action_value_str",
            t.Parent["Player Notifications"],
            function(V, bB)
                if V.value == 0 then
                    r.Send("Notification", {player.player_id(), 1990572980, math.random(-2147483647, 2147483647)}, bB)
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                r.Send("Notification", {player.player_id(), 1990572980, dV}, bB)
            end
        )
        t.Feature["Player Cash Banked"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Player Insurance Notification"] =
            menu.add_player_feature(
            "Insurance Notification",
            "action_value_str",
            t.Parent["Player Notifications"],
            function(V, bB)
                if V.value == 0 then
                    r.Send("Insurance Notification", {player.player_id(), math.random(1, 20000)}, bB)
                    return
                end
                local dV = k.Input("Enter The Amount Of Money (0 - 2147483647)", 10, 3)
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                r.Send("Insurance Notification", {player.player_id(), dV}, bB)
            end
        )
        t.Feature["Player Insurance Notification"]:set_str_data({"Random Amount", "Input"})
        t.Feature["Player Notification Spam"] =
            menu.add_player_feature(
            "Notification Spam",
            "value_str",
            t.Parent["Player Notifications"],
            function(V, bB)
                while V.on do
                    r.Send("Notification", {player.player_id(), 689178114, math.random(-2147483647, 2147483647)}, bB)
                    r.Send("Notification", {player.player_id(), 2187973097, math.random(-2147483647, 2147483647)}, bB)
                    r.Send("Notification", {player.player_id(), 1990572980, math.random(-2147483647, 2147483647)}, bB)
                    if V.value == 0 then
                        r.Send("Insurance Notification", {player.player_id(), math.random(1, 20000)}, bB)
                    end
                    coroutine.yield(200)
                end
            end
        )
        t.Feature["Player Notification Spam"]:set_str_data({"Named", "Anonymous"})
        t.Parent["Player Teleports"] =
            menu.add_player_feature("Teleports", "parent", t.Parent["Player Trolling"], nil).id
        t.Feature["Player Random Apartment Invite"] =
            menu.add_player_feature(
            "Random Apartment Invite",
            "action",
            t.Parent["Player Teleports"],
            function(V, bB)
                r.Send("Apartment Invite", {player.player_id(), bB, 1, 0, math.random(1, 114), 1, 1, 1}, bB)
            end
        )
        t.Feature["Player Apartment Invite Loop"] =
            menu.add_player_feature(
            "Apartment Invite Loop",
            "toggle",
            t.Parent["Player Teleports"],
            function(V, bB)
                while V.on do
                    r.Send("Apartment Invite", {player.player_id(), bB, 1, 0, math.random(1, 114), 1, 1, 1}, bB)
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Player Warehouse Invite"] =
            menu.add_player_feature(
            "Warehouse Invite",
            "action_value_str",
            t.Parent["Player Teleports"],
            function(V, bB)
                if V.value == 22 then
                    r.Send("Warehouse Invite", {player.player_id(), 0, 1, math.random(1, 22)}, bB)
                    return
                end
                r.Send("Warehouse Invite", {player.player_id(), 0, 1, V.value + 1}, bB)
            end
        )
        t.Feature["Player Warehouse Invite"]:set_str_data(
            {
                "Elysian Island North",
                "La Puerta North",
                "La Mesa Mid",
                "Rancho West",
                "West Vinewood",
                "LSIA North",
                "Del Perro",
                "LSIA South",
                "Elysian Island South",
                "El Burro Heights",
                "Elysian Island West",
                "Textile City",
                "La Puerta South",
                "Strawberry",
                "Downtown Vinewood North",
                "La Mesa South",
                "La Mesa North",
                "Cypress Flats North",
                "Cypress Flats South",
                "West Vinewood West",
                "Rancho East",
                "Banning",
                "Random"
            }
        )
        t.Feature["Player Warehouse Invite Loop"] =
            menu.add_player_feature(
            "Warehouse Invite Loop",
            "toggle",
            t.Parent["Player Teleports"],
            function(V, bB)
                while V.on do
                    r.Send("Warehouse Invite", {player.player_id(), 0, 1, math.random(1, 22)}, bB)
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Player Force Island"] =
            menu.add_player_feature(
            "Send to Cayo Perico v1",
            "action",
            t.Parent["Player Teleports"],
            function(V, bB)
                r.Send("Force To Island", {player.player_id(), 1}, bB)
            end
        )
        t.Feature["Player Force Island 2"] =
            menu.add_player_feature(
            "Send to Cayo Perico v2",
            "action_value_str",
            t.Parent["Player Teleports"],
            function(V, bB)
                if V.value == 0 then
                    r.Send("Force To Island 2", {player.player_id(), 0, 0, 3, 1}, bB)
                elseif V.value == 1 then
                    r.Send("Force To Island 2", {player.player_id(), 0, 0, 4, 1}, bB)
                elseif V.value == 2 then
                    r.Send("Force To Island 2", {player.player_id(), 0, 0, 3, 0}, bB)
                elseif V.value == 3 then
                    r.Send("Force To Island 2", {player.player_id(), 0, 0, 4, 0}, bB)
                end
            end
        )
        t.Feature["Player Force Island 2"]:set_str_data(
            {"Beach Party (Plane)", "Beach Party (Instant)", "Back Home (Airport)", "Back Home (Beach)"}
        )
        t.Feature["Player Force Mission"] =
            menu.add_player_feature(
            "Force to Mission",
            "action_value_str",
            t.Parent["Player Teleports"],
            function(V, bB)
                if V.value == 0 then
                    r.Send("Force To Mission", {player.player_id()}, bB)
                    return
                end
                r.Send("Force To Mission", {player.player_id(), V.value}, bB)
            end
        )
        t.Feature["Player Force Mission"]:set_str_data(
            {
                "Severe Weather Patterns",
                "Half-track Bully",
                "Exit Strategy",
                "Offshore Assets",
                "Cover Blown",
                "Mole Hunt",
                "Data Breach",
                "Work Dispute"
            }
        )
        t.Parent["Player Cages"] = menu.add_player_feature("Cages", "parent", t.Parent["Player Trolling"], nil).id
        t.Feature["Player Cages Invisible"] =
            menu.add_player_feature(
            "Spawn Invisible",
            "toggle",
            t.Parent["Player Cages"],
            function(V)
                c["Player Cages Invisible"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Stunt Tube"] =
            menu.add_player_feature(
            "Stunt Tube",
            "action",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                aV.z = aV.z - 5
                local fE = n.Object(1125864094, aV)
                entity.set_entity_rotation(fE, v3(0, 90, 0))
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fE, false)
                end
            end
        )
        t.Feature["Player Paragon Cage"] =
            menu.add_player_feature(
            "Paragon Cage",
            "action_value_str",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                local fF
                local fG
                if V.value == 0 then
                    fF = n.Object(2718056036, v3(aV.x, aV.y, aV.z + 0.5))
                    fG = n.Object(2718056036, v3(aV.x, aV.y, aV.z - 0.5))
                else
                    fF = n.Worldobject(1563219665, v3(aV.x, aV.y, aV.z + 0.5))
                    fG = n.Worldobject(1563219665, v3(aV.x, aV.y, aV.z - 0.5))
                end
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fF, false)
                    entity.set_entity_visible(fG, false)
                end
            end
        )
        t.Feature["Player Paragon Cage"]:set_str_data({"v1", "v2"})
        t.Feature["Player Airport Trailer Cage"] =
            menu.add_player_feature(
            "Airport Trailer",
            "action",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB) + v3(1.24, 0.24, 0)
                local fF = n.Object(401136338, aV)
                entity.set_entity_rotation(fF, v3(0, -90, 0))
                entity.freeze_entity(fF, true)
                aV = aV + v3(-1.22, 0.58, 0)
                local fG = n.Object(401136338, aV)
                entity.set_entity_rotation(fG, v3(90, -90, 0))
                entity.freeze_entity(fG, true)
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fF, false)
                    entity.set_entity_visible(fG, false)
                end
            end
        )
        t.Feature["Player Food Van Cage"] =
            menu.add_player_feature(
            "Food Van",
            "action_value_str",
            t.Parent["Player Cages"],
            function(V, bB)
                local f8 = {4022605402, 1257426102}
                local ax = f8[V.value + 1]
                local aV = k.PlayerCoords(bB)
                if V.value == 0 then
                    aV = aV + v3(0, 0, -1)
                end
                local fH = n.Object(ax, aV)
                entity.freeze_entity(fH, true)
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fH, false)
                end
            end
        )
        t.Feature["Player Food Van Cage"]:set_str_data({"v1", "v2"})
        t.Feature["Player Coffee Vend Cage"] =
            menu.add_player_feature(
            "Coffee Vend",
            "action",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB) + v3(0, 0, -1)
                local fH = n.Object(2976931766, aV)
                entity.freeze_entity(fH, true)
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fH, false)
                end
            end
        )
        t.Feature["Player Wooden Crate Cage"] =
            menu.add_player_feature(
            "Wooden Crate",
            "action",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                local fH = n.Object(1262767548, aV)
                entity.freeze_entity(fH, true)
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fH, false)
                end
            end
        )
        t.Feature["Player Box Cage"] =
            menu.add_player_feature(
            "Box Cage",
            "action",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                local fH = n.Object(1502702711, aV)
                entity.freeze_entity(fH, true)
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fH, false)
                end
            end
        )
        t.Feature["Player Test Elevator Cage"] =
            menu.add_player_feature(
            "Test Elevator",
            "action",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                local fH = n.Object(251770068, aV)
                entity.set_entity_rotation(fH, v3(90, 0, 0))
                entity.freeze_entity(fH, true)
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fH, false)
                end
            end
        )
        t.Feature["Player Mesh Fence Cage"] =
            menu.add_player_feature(
            "Mesh Fence",
            "action",
            t.Parent["Player Cages"],
            function(V, bB)
                local aV = k.PlayerCoords(bB) + v3(-1, 1, -1)
                local fH = n.Object(206865238, aV)
                entity.set_entity_heading(fH, 180)
                entity.freeze_entity(fH, true)
                aV = aV + v3(3.4, -3.4, 0)
                local fG = n.Object(206865238, aV)
                entity.freeze_entity(fH, true)
                if t.Feature["Player Cages Invisible"].on[bB] then
                    entity.set_entity_visible(fH, false)
                end
            end
        )
        t.Feature["Player Script Freeze"] =
            menu.add_player_feature(
            "Script Freeze",
            "value_str",
            t.Parent["Player Trolling"],
            function(V, bB)
                while V.on do
                    if V.value == 0 then
                        r.Send("Warehouse Invite", {player.player_id(), 0, 1, 0}, bB)
                    else
                        r.Send("Force To Island 2", {player.player_id()}, bB)
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Player Script Freeze"]:set_str_data({"v1", "v2"})
        t.Feature["Player Electrocute"] =
            menu.add_player_feature(
            "Electrocute",
            "action",
            t.Parent["Player Trolling"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                gameplay.shoot_single_bullet_between_coords(
                    aV + v3(0, 0, 2),
                    aV,
                    0,
                    0x3656C8C1,
                    k.OwnPed(),
                    true,
                    false,
                    10000
                )
            end
        )
        t.Feature["Player Looped Electrocution"] =
            menu.add_player_feature(
            "Looped Electrocution",
            "toggle",
            t.Parent["Player Trolling"],
            function(V, bB)
                while V.on do
                    local aV = k.PlayerCoords(bB)
                    gameplay.shoot_single_bullet_between_coords(
                        aV + v3(0, 0, 2),
                        aV,
                        0,
                        0x3656C8C1,
                        k.OwnPed(),
                        true,
                        false,
                        10000
                    )
                    coroutine.yield(2500)
                end
            end
        )
        t.Feature["Player Ragdoll"] =
            menu.add_player_feature(
            "Ragdoll Player",
            "action_value_str",
            t.Parent["Player Trolling"],
            function(V, bB)
                local aV = k.PlayerCoords(bB)
                if V.value == 0 then
                    fire.add_explosion(aV, 70, false, true, 0, k.PlayerPed(bB))
                    return
                end
                fire.add_explosion(aV, 13, false, true, 0, k.PlayerPed(bB))
            end
        )
        t.Feature["Player Ragdoll"]:set_str_data({"v1", "v2"})
        t.Feature["Player Start Cutscene"] =
            menu.add_player_feature(
            "Start Casino Cutscene",
            "action",
            t.Parent["Player Trolling"],
            function(V, bB)
                r.Send("Casino Cutscene", {player.player_id()}, bB)
            end
        )
        t.Feature["Player Force Camera Forward"] =
            menu.add_player_feature(
            "Force Camera Forward",
            "toggle",
            t.Parent["Player Trolling"],
            function(V, bB)
                local ed = 0
                while V.on do
                    r.Send("Camera Manipulation", {player.player_id(), 869796886, 0}, bB)
                    ed = ed + 1
                    if ed == 25 then
                        ed = 0
                        coroutine.yield(50)
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Player Transaction Error"] =
            menu.add_player_feature(
            "Transaction Error",
            "toggle",
            t.Parent["Player Trolling"],
            function(V, bB)
                while V.on do
                    r.Send(
                        "Transaction Error",
                        {player.player_id(), 50000, 0, 1, r.MainGlobal(bB), r.GlobalPair(), 1},
                        bB
                    )
                    coroutine.yield(1000)
                end
            end
        )
        t.Parent["Player Griefing"] = menu.add_player_feature("Griefing", "parent", t.playerparent, nil).id
        t.Feature["Player Radiation Lags"] =
            menu.add_player_feature(
            "Radiation Lags",
            "slider",
            t.Parent["Player Griefing"],
            function(V, bB)
                while V.on do
                    graphics.set_next_ptfx_asset("scr_agencyheistb")
                    while not graphics.has_named_ptfx_asset_loaded("scr_agencyheistb") do
                        graphics.request_named_ptfx_asset("scr_agencyheistb")
                        coroutine.yield(0)
                    end
                    ped.clear_ped_tasks_immediately(k.PlayerPed(bB))
                    graphics.start_networked_ptfx_non_looped_on_entity(
                        "scr_agency3b_elec_box",
                        k.PlayerPed(bB),
                        v3(),
                        v3(),
                        V.value
                    )
                    coroutine.yield(0)
                end
                graphics.remove_named_ptfx_asset("scr_agencyheistb")
            end
        )
        t.Feature["Player Radiation Lags"].min = 10
        t.Feature["Player Radiation Lags"].max = 100
        t.Feature["Player Radiation Lags"].mod = 10
        t.Parent["Player Blame Kill"] =
            menu.add_player_feature(
            "Blame Kill",
            "parent",
            t.Parent["Player Griefing"],
            function(V, bB)
                local ed = 0
                for j = 0, 31 do
                    if ad[j] ~= nil then
                        menu.delete_player_feature(ad[j].id)
                        ad[j] = nil
                        ed = ed + 1
                    end
                    if ed == 15 then
                        ed = 0
                        coroutine.yield(0)
                    end
                end
                for j = 0, 31 do
                    if player.is_player_valid(j) then
                        ad[j] =
                            menu.add_player_feature(
                            k.Name(j),
                            "action",
                            t.Parent["Player Blame Kill"],
                            function(V, bB)
                                ped.clear_ped_tasks_immediately(k.PlayerPed(j))
                                fire.add_explosion(k.PlayerCoords(j), 5, false, true, 1, k.PlayerPed(bB))
                            end
                        )
                    end
                end
            end
        ).id
        t.Parent["Player Blame Refresh"] =
            menu.add_player_feature(
            "Refresh List",
            "action",
            t.Parent["Player Blame Kill"],
            function()
                local ed = 0
                for j = 0, 31 do
                    if ad[j] ~= nil then
                        menu.delete_player_feature(ad[j].id)
                        ad[j] = nil
                        ed = ed + 1
                    end
                    if ed == 5 then
                        ed = 0
                        coroutine.yield(0)
                    end
                end
                for j = 0, 31 do
                    if player.is_player_valid(j) then
                        ad[j] =
                            menu.add_player_feature(
                            k.Name(j),
                            "action",
                            t.Parent["Player Blame Kill"],
                            function(V, bB)
                                ped.clear_ped_tasks_immediately(k.PlayerPed(j))
                                fire.add_explosion(k.PlayerCoords(j), 5, true, false, 1, k.PlayerPed(bB))
                            end
                        )
                    end
                end
            end
        )
        t.Feature["Player Ram with Vehicle"] =
            menu.add_player_feature(
            "Ram with Vehicle",
            "action",
            t.Parent["Player Griefing"],
            function(V, bB)
                local di = 200
                local fI = -10
                local fJ = math.random(1, 2)
                if fJ == 2 then
                    di = -200
                    fI = 10
                end
                local bo = n.Vehicle(3078201489, l.OffsetCoords(k.PlayerCoords(bB), k.PlayerHeading(bB), fI))
                entity.set_entity_rotation(bo, v3(0, 0, k.PlayerHeading(bB)))
                vehicle.set_vehicle_forward_speed(bo, di)
                coroutine.yield(2000)
                l.clear(bo)
            end
        )
        t.Feature["Player Set on Fire"] =
            menu.add_player_feature(
            "Set on Fire",
            "action",
            t.Parent["Player Griefing"],
            function(V, bB)
                local fK
                graphics.set_next_ptfx_asset("scr_recrash_rescue")
                while not graphics.has_named_ptfx_asset_loaded("scr_recrash_rescue") do
                    graphics.request_named_ptfx_asset("scr_recrash_rescue")
                    coroutine.yield(0)
                end
                while not fK do
                    fK =
                        graphics.start_networked_ptfx_looped_on_entity(
                        "scr_recrash_rescue_fire",
                        k.PlayerPed(bB),
                        v3(),
                        v3(),
                        1
                    )
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Player Perma Burn"] =
            menu.add_player_feature(
            "Perma Burn",
            "toggle",
            t.Parent["Player Griefing"],
            function(V, bB)
                local fL = 0
                while V.on do
                    if not graphics.does_looped_ptfx_exist(fL) then
                        graphics.set_next_ptfx_asset("scr_recrash_rescue")
                        while not graphics.has_named_ptfx_asset_loaded("scr_recrash_rescue") do
                            graphics.request_named_ptfx_asset("scr_recrash_rescue")
                            coroutine.yield(0)
                        end
                        fL =
                            graphics.start_networked_ptfx_looped_on_entity(
                            "scr_recrash_rescue_fire",
                            k.PlayerPed(bB),
                            v3(),
                            v3(),
                            1
                        )
                    end
                    coroutine.yield(1000)
                end
                graphics.remove_particle_fx(fL)
            end
        )
        t.Feature["Player Shockwave Spam"] =
            menu.add_player_feature(
            "Shockwave Spam",
            "toggle",
            t.Parent["Player Griefing"],
            function(V, bB)
                while V.on do
                    local aV = k.PlayerCoords(bB)
                    aV.x = aV.x + math.random(-3, 3)
                    aV.y = aV.y + math.random(-3, 3)
                    aV.z = aV.z + math.random(-2, 2)
                    fire.add_explosion(aV, 70, true, false, 0, 0)
                    coroutine.yield(100)
                end
            end
        )
        t.Feature["Player Cluster Bomb"] =
            menu.add_player_feature(
            "Cluster Bomb",
            "action",
            t.Parent["Player Griefing"],
            function(V, bB)
                menu.create_thread(
                    function(aL)
                        local aV = k.PlayerCoords(aL)
                        fire.add_explosion(aV, 47, true, false, 5, 0)
                        coroutine.yield(500)
                        for j = 1, 15 do
                            aV = k.PlayerCoords(aL)
                            aV.x = aV.x + math.random(-6, 6)
                            aV.y = aV.y + math.random(-6, 6)
                            aV.z = m.GetGroundZ(aV.x, aV.y)
                            fire.add_explosion(aV, 54, true, false, 2, 0)
                            coroutine.yield(50)
                        end
                    end,
                    bB
                )
            end
        )
        t.Feature["Player Kill Godmode"] =
            menu.add_player_feature(
            "Kill Godmode Player",
            "action_value_str",
            t.Parent["Player Griefing"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                local time
                local bo = k.PlayerVehicle(bB)
                if bo == 0 then
                    goto ca
                end
                if not entity.get_entity_god_mode(bo) then
                    goto ca
                end
                time = utils.time_ms() + 5000
                while time > utils.time_ms() and entity.get_entity_god_mode(bo) do
                    l.request_ctrl(bo)
                    entity.set_entity_god_mode(bo, false)
                end
                if entity.get_entity_god_mode(bo) then
                    z("Failed to remove godmode from the Players vehicle.", "Error", "")
                    return
                end
                ::ca::
                local dX
                if V.value == 0 then
                    dX = 0
                else
                    dX = k.OwnPed()
                end
                ped.clear_ped_tasks_immediately(k.PlayerPed(bB))
                r.Send("Camera Manipulation", {player.player_id(), 869796886, 0}, bB)
                fire.add_explosion(k.PlayerCoords(bB), 8, false, true, 0, dX)
            end
        )
        t.Feature["Player Kill Godmode"]:set_str_data({"Anonymous", "Named"})
        t.Feature["Player Airstrike"] =
            menu.add_player_feature(
            "Airstrike (Named)",
            "action",
            t.Parent["Player Griefing"],
            function(V, bB)
                if not weapon.has_ped_got_weapon(k.OwnPed(), 0xB1CA77B1) then
                    weapon.give_delayed_weapon_to_ped(k.OwnPed(), 0xB1CA77B1, 0, 0)
                    coroutine.yield(200)
                end
                local cA = gameplay.get_hash_key("weapon_airstrike_rocket")
                local aV = k.PlayerCoords(bB)
                gameplay.shoot_single_bullet_between_coords(
                    aV + v3(0, 0, 50),
                    aV,
                    1000,
                    cA,
                    k.OwnPed(),
                    true,
                    false,
                    5000
                )
            end
        )
        t.Feature["Player Airstrike Rain"] =
            menu.add_player_feature(
            "Airstrike Rain (Named)",
            "value_i",
            t.Parent["Player Griefing"],
            function(V, bB)
                if not weapon.has_ped_got_weapon(k.OwnPed(), 0xB1CA77B1) then
                    weapon.give_delayed_weapon_to_ped(k.OwnPed(), 0xB1CA77B1, 0, 0)
                    coroutine.yield(200)
                end
                local cA = gameplay.get_hash_key("weapon_airstrike_rocket")
                while V.on do
                    local aV = k.PlayerCoords(bB)
                    aV.x = aV.x + math.random(-15, 15)
                    aV.y = aV.y + math.random(-15, 15)
                    gameplay.shoot_single_bullet_between_coords(
                        aV + v3(0, 0, 50),
                        aV,
                        1000,
                        cA,
                        k.OwnPed(),
                        true,
                        false,
                        5000
                    )
                    coroutine.yield(V.value)
                end
            end
        )
        t.Feature["Player Airstrike Rain"].min = 100
        t.Feature["Player Airstrike Rain"].max = 1000
        t.Feature["Player Airstrike Rain"].mod = 100
        t.Feature["Player Airstrike Rain"].value = 500
        t.Feature["Player CEO"] =
            menu.add_player_feature(
            "CEO Removal",
            "action_value_str",
            t.Parent["Player Griefing"],
            function(V, bB)
                if not V.value == 2 and r.CEOID(bB) == -1 then
                    z("Player is not in any Organisation!", "Error", "")
                    return
                end
                local e0 = {
                    {"CEO Kick", {player.player_id(), 1, 5}},
                    {"CEO Kick", {player.player_id(), 1, 6}},
                    {"CEO Ban", {player.player_id(), 1}}
                }
                local L = e0[V.value + 1][1]
                local bu = e0[V.value + 1][2]
                r.Send(L, bu, bB)
            end
        )
        t.Feature["Player CEO"]:set_str_data({"Dismiss", "Terminate", "Ban"})
        t.Feature["Player Set Bounty"] =
            menu.add_player_feature(
            "Set Bounty: Input",
            "action_value_str",
            t.Parent["Player Griefing"],
            function(V, bB)
                if script.get_host_of_this_script() == player.player_id() then
                    z("This doesnt work while you are Script Host!", "Error", "")
                    return
                end
                if r.DoesPlayerHaveBounty(bB) then
                    z("Player already has a Bounty!", "Error", "")
                    return
                end
                local dV = k.Input("Enter Bounty Value (0 - 10000)", 5, 3, "10000")
                if not dV then
                    z("Input canceled.", "Error", "")
                    return
                end
                if tonumber(dV) > 10000 then
                    z("Value cannot be more than 10000!", nil, "")
                    return
                end
                r.setBounty(bB, dV, V.value)
            end
        )
        t.Feature["Player Set Bounty"]:set_str_data({"Named", "Anonymous"})
        t.Feature["Player Bounty After Death"] =
            menu.add_player_feature(
            "Reapply Bounty after Death",
            "value_str",
            t.Parent["Player Griefing"],
            function(V, bB)
                if script.get_host_of_this_script() == player.player_id() then
                    z("This doesnt work while you are Script Host!", "Error", "")
                    V.on = false
                    return
                end
                local e1 = k.Input("Enter Bounty Value (0 - 10000)", 5, 3, "10000")
                if not e1 then
                    z("Input canceled.", "Error", "")
                    V.on = false
                    return
                end
                if tonumber(e1) > 10000 then
                    z("Value cannot be more than 10000!", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    if entity.is_entity_dead(k.PlayerPed(bB)) then
                        z(k.Name(bB) .. " is dead!\nReapplying bounty...", "Neutral")
                        C(k.Name(bB) .. " is dead!\nReapplying bounty...")
                        r.setBounty(bB, e1, V.value)
                        while player.get_player_health(bB) == 0 do
                            coroutine.yield(0)
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Feature["Player Bounty After Death"]:set_str_data({"Named", "Anonymous"})
        t.Feature["Player Bounty Set & Claim"] =
            menu.add_player_feature(
            "Set & Claim Bounty Loop",
            "toggle",
            t.Parent["Player Griefing"],
            function(V, bB)
                if bB == player.player_id() then
                    z("This doesnt work on yourself.", "Error", "")
                    V.on = false
                    return
                end
                if script.get_host_of_this_script() == player.player_id() then
                    z("This doesnt work while you are Script Host!", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    r.setBounty(bB, 10000, 1)
                    coroutine.yield(1000)
                    ped.clear_ped_tasks_immediately(k.PlayerPed(bB))
                    fire.add_explosion(k.PlayerCoords(bB), 8, false, true, 0, k.OwnPed())
                    coroutine.yield(19000)
                end
            end
        )
        t.Feature["Player Asteroid"] =
            menu.add_player_feature(
            "Falling Asteroids",
            "action_value_str",
            t.Parent["Player Griefing"],
            function(V, bB)
                if V.value == 0 then
                    for j = 1, 25 do
                        local aV = k.PlayerCoords(bB)
                        aV.x = math.random(math.floor(aV.x - 80), math.floor(aV.x + 80))
                        aV.y = math.random(math.floor(aV.y - 80), math.floor(aV.y + 80))
                        aV.z = aV.z + math.random(45, 90)
                        Z["asteroids"][#Z["asteroids"] + 1] = n.Object(3751297495, aV, true, true)
                        local fM = math.random(-125, 25)
                        entity.apply_force_to_entity(Z["asteroids"][#Z["asteroids"]], 3, 0, 0, fM, 0, 0, 0, true, true)
                    end
                    for av = 1, 25 do
                        local aV = entity.get_entity_coords(Z["asteroids"][#Z["asteroids"] - 25 + av])
                        fire.add_explosion(aV, 8, true, false, 0, 0)
                        coroutine.yield(100)
                    end
                elseif V.value == 1 then
                    C("Clearing Asteroids...")
                    for j = 1, #Z["asteroids"] do
                        for av = 1, 50 do
                            if entity.is_an_entity(Z["asteroids"][j]) then
                                l.request_ctrl(Z["asteroids"][j])
                                entity.set_entity_velocity(Z["asteroids"][j], v3())
                                entity.set_entity_coords_no_offset(Z["asteroids"][j], v3(8000, 8000, -1000))
                                entity.set_entity_as_mission_entity(Z["asteroids"][j], true, true)
                                entity.set_entity_as_no_longer_needed(Z["asteroids"][j])
                                entity.delete_entity(Z["asteroids"][j])
                            end
                        end
                    end
                    Z["asteroids"] = {}
                    C("Asteroids Successfully Cleared!")
                    z("Asteroids Cleared!", "Success")
                end
            end
        )
        t.Feature["Player Asteroid"]:set_str_data({"Start", "Delete"})
        t.Feature["Player Infinite Apartment Invite"] =
            menu.add_player_feature(
            "Infinite Apartment Invite",
            "action",
            t.Parent["Player Griefing"],
            function(V, bB)
                r.Send("Apartment Invite", {player.player_id(), bB, 4294967295, 1, 115, 0, 0, 0}, bB)
            end
        )
        t.Feature["Player Passive Mode"] =
            menu.add_player_feature(
            "Block Passive Mode",
            "toggle",
            t.Parent["Player Griefing"],
            function(V, bB)
                while V.on do
                    r.Send("Passive Mode", {player.player_id(), 1}, bB)
                    coroutine.yield(100)
                end
                r.Send("Passive Mode", {player.player_id(), 0}, bB)
            end
        )
        t.Feature["Player Spam Script Events"] =
            menu.add_player_feature(
            "Spam Script Events",
            "value_str",
            t.Parent["Player Griefing"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    V.on = false
                    return
                end
                for j = 0, 31 do
                    if j ~= bB and player.is_player_valid(j) and t.Feature["Player Spam Script Events"].on[j] then
                        z("Feature is already on for another Player.", "Error", "")
                        V.on = false
                        return
                    end
                end
                while V.on do
                    r.Send("Warehouse Invite", {player.player_id(), 0, 1, math.random(1, 22)}, bB)
                    r.Send("Apartment Invite", {player.player_id(), bB, 1, 0, math.random(1, 114), 1, 1, 1}, bB)
                    r.Send("Force To Mission", {player.player_id(), math.random(0, 7)}, bB)
                    r.Send("Force To Island", {player.player_id(), 1}, bB)
                    r.Send("Force To Island 2", {player.player_id(), 0, 0, math.random(3, 4), math.random(0, 1)}, bB)
                    r.Send("Casino Cutscene", {player.player_id()}, bB)
                    coroutine.yield(0)
                    r.Send("Vehicle Kick", {player.player_id(), 4294967295, 4294967295, 4294967295}, bB)
                    r.Send("CEO Kick", {player.player_id(), 1, math.random(5, 6)}, bB)
                    r.Send("CEO Ban", {player.player_id(), 1}, bB)
                    r.Send(
                        "Transaction Error",
                        {player.player_id(), 50000, 0, 1, r.MainGlobal(bB), r.GlobalPair(), 1},
                        bB
                    )
                    r.Send("Passive Mode", {player.player_id(), 1}, bB)
                    coroutine.yield(0)
                    r.Send("Notification", {player.player_id(), 689178114, math.random(-2147483647, 2147483647)}, bB)
                    r.Send("Notification", {player.player_id(), 2187973097, math.random(-2147483647, 2147483647)}, bB)
                    r.Send("Notification", {player.player_id(), 1990572980, math.random(-2147483647, 2147483647)}, bB)
                    r.Send(0x9A8982B2, {player.player_id(), 1}, bB)
                    r.Send(
                        "Fake Invite 3",
                        {player.player_id(), math.random(0, 179), aq.smslocations[math.random(#aq.smslocations)]},
                        bB
                    )
                    if V.value == 1 then
                        coroutine.yield(0)
                        r.Send("Warehouse Invite", {player.player_id(), 0, 1, 0}, bB)
                        r.Send("Apartment Invite", {player.player_id(), bB, 4294967295, 1, 115, 0, 0, 0}, bB)
                        coroutine.yield(0)
                        r.kick(bB)
                        coroutine.yield(0)
                        r.crash(bB)
                    end
                    coroutine.yield(100)
                end
            end
        )
        t.Feature["Player Spam Script Events"]:set_str_data({"v1", "v2"})
        t.Parent["Player Friendly"] = menu.add_player_feature("Friendly", "parent", t.playerparent, nil).id
        t.Parent["Player Spawn Vehicle"] =
            menu.add_player_feature("Spawn Vehicle", "parent", t.Parent["Player Friendly"], nil).id
        t.Parent["Player Spawn Vehicle Settings"] =
            menu.add_player_feature("Spawn Settings", "parent", t.Parent["Player Spawn Vehicle"], nil).id
        t.Feature["Player Spawn Vehicle Upgraded"] =
            menu.add_player_feature(
            "Upgraded",
            "value_str",
            t.Parent["Player Spawn Vehicle Settings"],
            function(V)
                c["Player Spawn Vehicle Upgraded"] = {Enabled = V.on, Value = V.value}
            end
        )
        t.Feature["Player Spawn Vehicle Upgraded"]:set_str_data({"Max", "Performance"})
        t.Feature["Player Spawn Vehicle Godmode"] =
            menu.add_player_feature(
            "Godmode",
            "toggle",
            t.Parent["Player Spawn Vehicle Settings"],
            function(V)
                c["Player Spawn Vehicle Godmode"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Spawn Vehicle Lockon"] =
            menu.add_player_feature(
            "Lock-on Disabled",
            "toggle",
            t.Parent["Player Spawn Vehicle Settings"],
            function(V)
                c["Player Spawn Vehicle Lockon"] = {Enabled = V.on}
            end
        )
        t.Feature["Player Spawn Vehicle Input"] =
            menu.add_player_feature(
            "Model/Hash Input",
            "action",
            t.Parent["Player Spawn Vehicle"],
            function(V, bB)
                local dP = k.Input("Enter Vehicle Model Name or Hash")
                if not dP then
                    z("Input canceled.", "Error", "")
                    return
                end
                local ax = dP
                if not tonumber(dP) then
                    if s.veh.GetHashFromName(dP) ~= nil then
                        ax = s.veh.GetHashFromName(dP)
                    else
                        ax = gameplay.get_hash_key(dP)
                    end
                end
                if not streaming.is_model_a_vehicle(ax) then
                    z("Input is not a valid vehicle.", "Error", "")
                    return
                end
                local aV = k.PlayerCoords(bB)
                aV.z = m.GetGroundZ(aV.x, aV.y)
                local bo = n.Vehicle(ax, l.OffsetCoords(aV, k.PlayerHeading(bB), 10))
                if not l.request_ctrl(bo, 5000) then
                    z("Failed to gain control over spawned Vehicle.\nThe upgrades might not have worked.", "Error", "")
                end
                decorator.decor_set_int(bo, "MPBitset", 1 << 10)
                if t.Feature["Player Spawn Vehicle Upgraded"].on[bB] then
                    l.MaxVehicle(bo, t.Feature["Player Spawn Vehicle Upgraded"].value[bB] + 1)
                end
                if t.Feature["Player Spawn Vehicle Godmode"].on[bB] then
                    entity.set_entity_god_mode(bo, true)
                end
                if t.Feature["Player Spawn Vehicle Lockon"].on[bB] then
                    vehicle.set_vehicle_can_be_locked_on(bo, false, false)
                end
            end
        )
        for j = 1, #aq.VehicleCategories do
            local O = aq.VehicleCategories[j]
            t.Parent["Player Spawn " .. O] =
                menu.add_player_feature(O, "parent", t.Parent["Player Spawn Vehicle"], nil).id
            t.Parent["Lobby Spawn " .. O] = menu.add_feature(O, "parent", t.Parent["Lobby Spawn Vehicles"], nil).id
        end
        menu.create_thread(
            function(eM)
                local ed = 0
                for j = 1, #eM do
                    if ed == 50 then
                        coroutine.yield(0)
                    end
                    local fd = eM[j].Hash
                    local O = eM[j].Name
                    local fN = eM[j].Category
                    if
                        fN == "Trains" or fN == "Invalid" or fN == "Utility" and string.find(O:lower(), "trai") or
                            not streaming.is_model_a_vehicle(fd)
                     then
                        goto ca
                    end
                    menu.add_player_feature(
                        O,
                        "action",
                        t.Parent["Player Spawn " .. fN],
                        function(V, bB)
                            local aV = k.PlayerCoords(bB)
                            aV.z = m.GetGroundZ(aV.x, aV.y)
                            local bo = n.Vehicle(fd, l.OffsetCoords(aV, k.PlayerHeading(bB), 10))
                            if not l.request_ctrl(bo, 5000) then
                                z(
                                    "Failed to gain control over spawned Vehicle.\nThe upgrades might not have worked.",
                                    "Error",
                                    ""
                                )
                            end
                            decorator.decor_set_int(bo, "MPBitset", 1 << 10)
                            if t.Feature["Player Spawn Vehicle Upgraded"].on[bB] then
                                l.MaxVehicle(bo, t.Feature["Player Spawn Vehicle Upgraded"].value[bB] + 1)
                            end
                            if t.Feature["Player Spawn Vehicle Godmode"].on[bB] then
                                entity.set_entity_god_mode(bo, true)
                            end
                            if t.Feature["Player Spawn Vehicle Lockon"].on[bB] then
                                vehicle.set_vehicle_can_be_locked_on(bo, false, false)
                            end
                        end
                    )
                    menu.add_feature(
                        O,
                        "action",
                        t.Parent["Lobby Spawn " .. fN],
                        function(V)
                            for bB = 0, 31 do
                                if
                                    player.is_player_valid(bB) and bB ~= player.player_id() and
                                        not player.is_player_god(bB) and
                                        interior.get_interior_from_entity(k.PlayerPed(bB)) == 0
                                 then
                                    local aV = k.PlayerCoords(bB)
                                    aV.z = m.GetGroundZ(aV.x, aV.y)
                                    local bo = n.Vehicle(fd, l.OffsetCoords(aV, k.PlayerHeading(bB), 10))
                                    l.request_ctrl(bo)
                                    decorator.decor_set_int(bo, "MPBitset", 1 << 10)
                                    if t.Feature["Lobby Spawn Vehicle Upgraded"].on then
                                        l.MaxVehicle(bo, t.Feature["Lobby Spawn Vehicle Upgraded"].value + 1)
                                    end
                                    if t.Feature["Lobby Spawn Vehicle Godmode"].on then
                                        entity.set_entity_god_mode(bo, true)
                                    end
                                    if t.Feature["Lobby Spawn Vehicle Lockon"].on then
                                        vehicle.set_vehicle_can_be_locked_on(bo, false, false)
                                    end
                                end
                            end
                        end
                    )
                    ::ca::
                    ed = ed + 1
                end
            end,
            s.veh.GetAllVehicles()
        )
        t.Parent["Player CEO Money"] =
            menu.add_player_feature(
            "CEO Money",
            "parent",
            t.Parent["Player Friendly"],
            function()
                if not t.Feature["Disable Warning Messages"].on then
                    z(
                        "The Target must be an associate in any Organisation to receive the Money.\nEnabling multiple Loops at once can cause Transaction Errors!",
                        "Neutral"
                    )
                    coroutine.yield(5000)
                end
            end
        ).id
        t.Feature["Player CEO Loop Preset"] =
            menu.add_player_feature(
            "Preset",
            "value_str",
            t.Parent["Player CEO Money"],
            function(V, bB)
                if bB == player.player_id() then
                    z("This doesnt work on yourself.", "Error", "")
                    V.on = false
                    return
                end
                if not r.IsPlayerAssociate(bB) then
                    z("Player is not an associate.", "Error", "")
                    V.on = false
                    return
                end
                if V.value == 0 then
                    menu.create_thread(
                        function()
                            while V.on do
                                if r.IsPlayerAssociate(bB) then
                                    r.Send(
                                        "CEO Money",
                                        {player.player_id(), 10000, -1292453789, 1, r.MainGlobal(bB), r.GlobalPair()},
                                        bB
                                    )
                                end
                                coroutine.yield(40000)
                            end
                        end,
                        nil
                    )
                    coroutine.yield(5000)
                    while V.on do
                        if r.IsPlayerAssociate(bB) then
                            r.Send(
                                "CEO Money",
                                {player.player_id(), 30000, 198210293, 1, r.MainGlobal(bB), r.GlobalPair()},
                                bB
                            )
                        end
                        coroutine.yield(150000)
                    end
                    return
                end
                local fO
                while V.on do
                    if not fO then
                        for j = 1, 5 do
                            for av = 1, 5 do
                                if not V.on then
                                    return
                                end
                                if r.IsPlayerAssociate(bB) then
                                    r.Send(
                                        "CEO Money",
                                        {player.player_id(), 10000, -1292453789, 1, r.MainGlobal(bB), r.GlobalPair()},
                                        bB
                                    )
                                end
                                coroutine.yield(30000)
                            end
                            if not V.on then
                                return
                            end
                            coroutine.yield(40000)
                            if r.IsPlayerAssociate(bB) then
                                r.Send(
                                    "CEO Money",
                                    {player.player_id(), 30000, 198210293, 1, r.MainGlobal(bB), r.GlobalPair()},
                                    bB
                                )
                            end
                            coroutine.yield(40000)
                        end
                        fO = true
                    end
                    for j = 1, 10 do
                        if not V.on then
                            return
                        end
                        if r.IsPlayerAssociate(bB) then
                            r.Send(
                                "CEO Money",
                                {player.player_id(), 10000, -1292453789, 1, r.MainGlobal(bB), r.GlobalPair()},
                                bB
                            )
                        end
                        coroutine.yield(30000)
                    end
                    fO = false
                end
            end
        )
        t.Feature["Player CEO Loop Preset"]:set_str_data({"Fast", "Stable"})
        for j = 1, #aq.ceomoney do
            t.Feature["Player CEO Loop " .. j] =
                menu.add_player_feature(
                aq.ceomoney[j][1] .. " (ms)",
                "value_i",
                t.Parent["Player CEO Money"],
                function(V, bB)
                    if bB == player.player_id() then
                        z("This doesnt work on yourself.", "Error", "")
                        V.on = false
                        return
                    end
                    if r.CEOID(bB) == -1 or r.CEOID(bB) == bB then
                        z("Player is not an associate.", "Error", "")
                        V.on = false
                        return
                    end
                    c["Player CEO Loop " .. j] = {Value = V.value}
                    while V.on do
                        if r.CEOID(bB) ~= -1 and not r.CEOID(bB) == bB then
                            r.Send(
                                "CEO Money",
                                {
                                    player.player_id(),
                                    aq.ceomoney[j][2],
                                    aq.ceomoney[j][3],
                                    aq.ceomoney[j][4],
                                    r.MainGlobal(bB),
                                    r.GlobalPair()
                                },
                                bB
                            )
                        end
                        c["Player CEO Loop " .. j].Value = V.value
                        coroutine.yield(V.value)
                    end
                end
            )
            t.Feature["Player CEO Loop " .. j].min = 10000
            t.Feature["Player CEO Loop " .. j].max = 300000
            t.Feature["Player CEO Loop " .. j].mod = 10000
            t.Feature["Player CEO Loop " .. j].value = aq.ceomoney[j][5]
        end
        t.Feature["Player Off The Radar"] =
            menu.add_player_feature(
            "Off The Radar",
            "action",
            t.Parent["Player Friendly"],
            function(V, bB)
                if not r.IsPlayerOTR(bB) then
                    r.Send(
                        "Off The Radar",
                        {player.player_id(), utils.time() - 60, utils.time(), 1, 1, r.MainGlobal(bB)},
                        bB
                    )
                end
            end
        )
        t.Feature["Player Off The Radar Loop"] =
            menu.add_player_feature(
            "Off The Radar",
            "toggle",
            t.Parent["Player Friendly"],
            function(V, bB)
                while V.on do
                    if not r.IsPlayerOTR(bB) then
                        r.Send(
                            "Off The Radar",
                            {player.player_id(), utils.time() - 60, utils.time(), 1, 1, r.MainGlobal(bB)},
                            bB
                        )
                    end
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Player Bribe Authorities"] =
            menu.add_player_feature(
            "Bribe Authorities",
            "toggle",
            t.Parent["Player Friendly"],
            function(V, bB)
                while V.on do
                    r.Send("Bribe Authorities", {player.player_id(), 0, 0, utils.time_ms(), 0, r.MainGlobal(bB)}, bB)
                    coroutine.yield(500)
                end
            end
        )
        t.Feature["Player Explosive Ammo"] =
            menu.add_player_feature(
            "Explosive Ammo",
            "toggle",
            t.Parent["Player Friendly"],
            function(V, bB)
                while V.on do
                    local bk = k.PlayerPed(bB)
                    if ped.is_ped_shooting(bk) then
                        local fP, aV = ped.get_ped_last_weapon_impact(bk)
                        if fP then
                            fire.add_explosion(aV, 1, true, false, 0.5, 0)
                        end
                    end
                    coroutine.yield(0)
                end
            end
        )
        t.Parent["Ped Assassins"] = menu.add_player_feature("Ped Assassins", "parent", t.playerparent, nil).id
        t.Feature["Godmode Assassins"] =
            menu.add_player_feature(
            "Godmode Assassins",
            "toggle",
            t.Parent["Ped Assassins"],
            function(V)
                c["Godmode Assassins"] = {Enabled = V.on}
            end
        )
        t.Feature["Amount of Assassins"] =
            menu.add_player_feature(
            "Amount of Assassins (1-10)",
            "autoaction_value_i",
            t.Parent["Ped Assassins"],
            function(V)
                c["Amount of Assassins"] = {Value = V.value}
            end
        )
        t.Feature["Amount of Assassins"].max = 10
        t.Feature["Amount of Assassins"].min = 1
        t.Feature["Clear Assassins"] =
            menu.add_player_feature(
            "Clear Peds",
            "action",
            t.Parent["Ped Assassins"],
            function()
                C("Clearing Ped Assassins...")
                l.clear(Z["peds"])
                Z["peds"] = {}
                C("Ped Assassins Successfully Cleared!")
                z("Ped Assassins Cleared!", "Success")
            end
        )
        t.Feature["Ped Assassins Input"] =
            menu.add_player_feature(
            "Send Assassins: Input",
            "action",
            t.Parent["Ped Assassins"],
            function(V, bB)
                local dP = k.Input("Enter ped model name")
                if not dP then
                    z("Input canceled.", "Error", "")
                    return
                end
                local ax = gameplay.get_hash_key(dP)
                local aV
                for j = 1, t.Feature["Amount of Assassins"].value[bB] do
                    local fQ = Z["peds"][#Z["peds"] + 1]
                    aV = k.PlayerCoords(bB) + v3(math.random(-50, 50), math.random(-50, 50), 0)
                    aV.z = m.GetGroundZ(aV.x, aV.y)
                    fQ = n.Ped(ax, aV, 26)
                    if ped_type ~= 28 then
                        weapon.give_delayed_weapon_to_ped(fQ, 0xDBBD7280, 1, 1)
                    end
                    if t.Feature["Godmode Assassins"].on[bB] then
                        entity.set_entity_god_mode(fQ, true)
                    else
                        ped.set_ped_max_health(fQ, 328)
                        ped.set_ped_health(fQ, 328)
                    end
                    ped.set_ped_combat_attributes(fQ, 46, true)
                    ped.set_ped_combat_ability(fQ, 2)
                    ped.set_ped_config_flag(fQ, 187, 0)
                    ped.set_ped_can_ragdoll(fQ, false)
                    menu.create_thread(o.Assassins, {fQ, bB})
                end
            end
        )
        t.Feature["Ped Assassins Clones"] =
            menu.add_player_feature(
            "Send Clones",
            "action",
            t.Parent["Ped Assassins"],
            function(V, bB)
                local aV
                local cP = k.PlayerPed(bB)
                local fR = ped.get_current_ped_weapon(cP)
                if
                    fR == 0xA2719263 or fR == 0xBA45E8B8 or fR == 0xAB564B93 or fR == 0x2C3731D9 or fR == 0x24B17070 or
                        fR == 0x497FACC3 or
                        fR == 0x93E220BD
                 then
                    fR = 0xC0A3098D
                end
                for j = 1, t.Feature["Amount of Assassins"].value[bB] do
                    aV = k.PlayerCoords(bB) + v3(math.random(-50, 50), math.random(-50, 50), 0)
                    aV.z = m.GetGroundZ(aV.x, aV.y)
                    Z["peds"][#Z["peds"] + 1] = ped.clone_ped(cP)
                    local fQ = Z["peds"][#Z["peds"]]
                    entity.set_entity_coords_no_offset(fQ, aV)
                    weapon.give_delayed_weapon_to_ped(fQ, fR, 1, 1)
                    if t.Feature["Godmode Assassins"].on[bB] then
                        entity.set_entity_god_mode(fQ, true)
                    else
                        ped.set_ped_max_health(fQ, 328)
                        ped.set_ped_health(fQ, 328)
                    end
                    ped.set_ped_combat_attributes(fQ, 46, true)
                    ped.set_ped_combat_ability(fQ, 2)
                    ped.set_ped_config_flag(fQ, 187, 0)
                    ped.set_ped_can_ragdoll(fQ, false)
                    menu.create_thread(o.Assassins, {fQ, bB})
                end
            end
        )
        for j = 1, #p.ped_assassins do
            menu.add_player_feature(
                "Send " .. p.ped_assassins[j].Name,
                "action",
                t.Parent["Ped Assassins"],
                function(V, bB)
                    local aV
                    local ax = p.ped_assassins[j].Hash
                    local ped_type = p.ped_assassins[j].PedType
                    local fS = p.ped_assassins[j].Weapon
                    if not fS then
                        fS = 0xDBBD7280
                    end
                    for j = 1, t.Feature["Amount of Assassins"].value[bB] do
                        aV = k.PlayerCoords(bB) + v3(math.random(-50, 50), math.random(-50, 50), 0)
                        aV.z = m.GetGroundZ(aV.x, aV.y)
                        Z["peds"][#Z["peds"] + 1] = n.Ped(ax, aV, ped_type)
                        local fQ = Z["peds"][#Z["peds"]]
                        if ped_type ~= 28 then
                            weapon.give_delayed_weapon_to_ped(fQ, fS, 1, 1)
                        end
                        if t.Feature["Godmode Assassins"].on[bB] then
                            entity.set_entity_god_mode(fQ, true)
                        else
                            ped.set_ped_max_health(fQ, 328)
                            ped.set_ped_health(fQ, 328)
                        end
                        ped.set_ped_combat_attributes(fQ, 46, true)
                        ped.set_ped_combat_ability(fQ, 2)
                        ped.set_ped_config_flag(fQ, 187, 0)
                        ped.set_ped_can_ragdoll(fQ, false)
                        ped.set_can_attack_friendly(fQ, false, false)
                        menu.create_thread(o.Assassins, {fQ, bB})
                    end
                end
            )
        end
        t.Parent["Player SMS Sender"] = menu.add_player_feature("SMS Sender", "parent", t.playerparent).id
        t.Feature["Player Send Custom SMS"] =
            menu.add_player_feature(
            "Send SMS: Input",
            "action",
            t.Parent["Player SMS Sender"],
            function(V, bB)
                local e4 = k.Input("Enter message to send")
                if not e4 then
                    z("Input canceled.", "Error", "")
                    return
                end
                player.send_player_sms(bB, e4)
            end
        )
        t.Feature["Player Send SCID And IP"] =
            menu.add_player_feature(
            "Send their SCID & IP",
            "action",
            t.Parent["Player SMS Sender"],
            function(V, bB)
                local L = k.Name(bB)
                local M = tostring(k.SCID(bB))
                local bQ = k.IP(bB)
                player.send_player_sms(bB, "~g~Name: " .. L .. "~n~~y~R*SCID: " .. M .. "~n~~r~IP: " .. bQ)
            end
        )
        t.Feature["Player SMS Delay"] =
            menu.add_player_feature(
            "Spam Delay (ms)",
            "autoaction_value_i",
            t.Parent["Player SMS Sender"],
            function(V)
                c["Player SMS Delay"] = {Value = V.value}
            end
        )
        t.Feature["Player SMS Delay"].min = 100
        t.Feature["Player SMS Delay"].max = 10000
        t.Feature["Player SMS Delay"].mod = 100
        t.Feature["Player Spam Custom SMS"] =
            menu.add_player_feature(
            "Spam SMS: Input",
            "toggle",
            t.Parent["Player SMS Sender"],
            function(V, bB)
                local e4 = k.Input("Enter message to spam")
                if not e4 then
                    z("Input canceled.", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    player.send_player_sms(bB, e4)
                    coroutine.yield(t.Feature["Player SMS Delay"].value[bB])
                end
            end
        )
        t.Feature["Player SMS SCID IP"] =
            menu.add_player_feature(
            "Spam their SCID & IP",
            "toggle",
            t.Parent["Player SMS Sender"],
            function(V, bB)
                local L = k.Name(bB)
                local M = tostring(k.SCID(bB))
                local bQ = k.IP(bB)
                while V.on do
                    player.send_player_sms(bB, "~g~Name: " .. L .. "~n~~y~R*SCID: " .. M .. "~n~~r~IP: " .. bQ)
                    coroutine.yield(t.Feature["Player SMS Delay"].value[bB])
                end
            end
        )
        t.Feature["Player SMS Empty"] =
            menu.add_player_feature(
            "Spam Empty SMS",
            "toggle",
            t.Parent["Player SMS Sender"],
            function(V, bB)
                while V.on do
                    r.Send(0x9A8982B2, {player.player_id(), 1}, bB)
                    coroutine.yield(t.Feature["Player SMS Delay"].value[bB])
                end
            end
        )
        t.Parent["Player SMS Spam Presets"] =
            menu.add_player_feature("Spam Presets", "parent", t.Parent["Player SMS Sender"], nil).id
        for j = 1, #p.sms_texts do
            menu.add_player_feature(
                p.sms_texts[j],
                "toggle",
                t.Parent["Player SMS Spam Presets"],
                function(V, bB)
                    while V.on do
                        player.send_player_sms(bB, p.sms_texts[j])
                        coroutine.yield(t.Feature["Player SMS Delay"].value[bB])
                    end
                end
            )
        end
        t.Parent["Player Miscellaneous"] = menu.add_player_feature("Miscellaneous", "parent", t.playerparent, nil).id
        t.Parent["Player Custom SE"] =
            menu.add_player_feature("Custom Script Events", "parent", t.Parent["Player Miscellaneous"], nil).id
        t.Feature["Player Custom SE Input"] =
            menu.add_player_feature(
            "Send Script Event: Input",
            "action",
            t.Parent["Player Custom SE"],
            function(V, bB)
                local c7 = {}
                local dP
                local ef = k.Input("Enter Custom Script Event (DEC)", 32, 3)
                if not ef then
                    z("Input canceled.", "Error", "")
                    return
                end
                while dP ~= "#" do
                    dP = k.Input("Enter Parameter (DEC), to EXIT and send, enter #", 32)
                    if not dP then
                        return
                    end
                    if dP == "#" then
                        break
                    end
                    dP = tonumber(dP)
                    if type(dP) == "number" then
                        c7[#c7 + 1] = dP
                    else
                        return
                    end
                end
                r.Send(ef, c7, bB)
                z("Sent Custom Script Event to Player.", "Success", "")
            end
        )
        for j = 1, #p.custom_script_events do
            menu.add_player_feature(
                p.custom_script_events[j].Name,
                "action",
                t.Parent["Player Custom SE"],
                function(V, bB)
                    z("Sent Custom Script Event to Player.", "Success", "")
                    for eg = 1, #p.custom_script_events[j].Events do
                        r.Send(p.custom_script_events[j].Events[eg].Hash, p.custom_script_events[j].Events[eg].Args, bB)
                    end
                end
            )
        end
        t.Feature["Player Log Script Events"] =
            menu.add_player_feature(
            "Log Script Events",
            "toggle",
            t.Parent["Player Miscellaneous"],
            function(V, bB)
                while V.on do
                    if ae.script[bB] == nil then
                        ae.script[bB] =
                            hook.register_script_event_hook(
                            function(c6, bn, c7, c8)
                                if c6 == bB then
                                    local fT = m.TimePrefix()
                                    local M = k.SCID(bB)
                                    local L = k.Name(bB)
                                    local fU = tostring(M) .. "-" .. L
                                    local fV = a["Event-Logger"] .. "\\" .. fU .. "\\" .. "Script-Events.log"
                                    local fT = fT .. " [Script-Event-Logger]"
                                    local bC = fT
                                    if not utils.dir_exists(a["Event-Logger"]) then
                                        utils.make_dir(a["Event-Logger"])
                                    end
                                    if not utils.dir_exists(a["Event-Logger"] .. "\\" .. fU) then
                                        utils.make_dir(a["Event-Logger"] .. "\\" .. fU)
                                    end
                                    if not utils.file_exists(fV) then
                                        z("Logging to folder '2Take1Script/Event-Logger/" .. fU, "Success")
                                        bC =
                                            "Starting to log Script-Events from Player: " .. L .. ":" .. M .. "\n" .. fT
                                    end
                                    bC = bC .. "\n" .. c7[1] .. ", {"
                                    for j = 2, #c7 do
                                        bC = bC .. c7[j]
                                        if j ~= #c7 then
                                            bC = bC .. ", "
                                        end
                                    end
                                    bC = bC .. "}\n"
                                    bC = bC .. "Parameter count: " .. c8 - 1 .. "\n"
                                    l.write(io.open(fV, "a"), bC)
                                    print(bC)
                                end
                            end
                        )
                    end
                    coroutine.yield(0)
                end
                if ae.script[bB] then
                    hook.remove_script_event_hook(ae.script[bB])
                    ae.script[bB] = nil
                end
            end
        )
        t.Feature["Player Reset SE Log"] =
            menu.add_player_feature(
            "Reset Script Event Log",
            "action",
            t.Parent["Player Miscellaneous"],
            function(V, bB)
                local M = k.SCID(bB)
                local L = k.Name(bB)
                local fU = tostring(M) .. "-" .. L
                local fV = a["Event-Logger"] .. "\\" .. fU .. "\\" .. "Script-Events.log"
                if utils.file_exists(fV) then
                    io.remove(fV)
                else
                    z("There was no log to reset.", "Error", "")
                end
            end
        )
        t.Feature["Player Log Net Events"] =
            menu.add_player_feature(
            "Log net_events",
            "toggle",
            t.Parent["Player Miscellaneous"],
            function(V, bB)
                while V.on do
                    if ae.net[bB] == nil then
                        ae.net[bB] =
                            hook.register_net_event_hook(
                            function(c6, bn, cd)
                                if c6 == bB then
                                    local fT = m.TimePrefix()
                                    local M = k.SCID(bB)
                                    local L = k.Name(bB)
                                    local fU = tostring(M) .. "-" .. L
                                    local fV = a["Event-Logger"] .. "\\" .. fU .. "\\" .. "Net-Events.log"
                                    local fT = fT .. " [Net-Event-Logger]"
                                    local bC = fT
                                    if not utils.dir_exists(a["Event-Logger"]) then
                                        utils.make_dir(a["Event-Logger"])
                                    end
                                    if not utils.dir_exists(a["Event-Logger"] .. "\\" .. fU) then
                                        utils.make_dir(a["Event-Logger"] .. "\\" .. fU)
                                    end
                                    if not utils.file_exists(fV) then
                                        z("Logging to folder 2Take1Script/Event-Logger/" .. fU, "Success")
                                        bC = "Starting to log Net-Events from Player: " .. L .. ":" .. M .. "\n" .. bC
                                    end
                                    local fW = s.net.GetEventName(cd)
                                    bC = bC .. "\nEvent: " .. fW .. "\nEvent ID: " .. cd .. "\n"
                                    l.write(io.open(fV, "a"), bC)
                                end
                            end
                        )
                    end
                    coroutine.yield(0)
                end
                if ae.net[bB] then
                    hook.remove_net_event_hook(ae.net[bB])
                    ae.net[bB] = nil
                end
            end
        )
        t.Feature["Player Reset Net Log"] =
            menu.add_player_feature(
            "Reset net_event Log",
            "action",
            t.Parent["Player Miscellaneous"],
            function(V, bB)
                local M = k.SCID(bB)
                local L = k.Name(bB)
                local fU = tostring(M) .. "-" .. L
                local fV = a["Event-Logger"] .. "\\" .. fU .. "\\" .. "Net-Events.log"
                if utils.file_exists(fV) then
                    io.remove(fV)
                else
                    z("There was no log to reset.", "Error", "")
                end
            end
        )
        t.Parent["Entity Spam"] =
            menu.add_player_feature(
            "Entity Spam",
            "parent",
            t.playerparent,
            function()
                if not t.Feature["Disable Warning Messages"].on then
                    z("Its recommended to keep distance from the Target while using this.", "Neutral")
                    coroutine.yield(5000)
                end
            end
        ).id
        t.Feature["Entity Spam Amount"] =
            menu.add_player_feature(
            "Amount of Entities",
            "autoaction_value_i",
            t.Parent["Entity Spam"],
            function(V)
                c["Entity Spam Amount"] = {Value = V.value}
            end
        )
        t.Feature["Entity Spam Amount"].max = 160
        t.Feature["Entity Spam Amount"].min = 10
        t.Feature["Entity Spam Amount"].mod = 10
        t.Feature["Entity Spam Location"] =
            menu.add_player_feature(
            "Spam Loaction",
            "autoaction_value_str",
            t.Parent["Entity Spam"],
            function(V)
                c["Entity Spam Location"] = {Value = V.value}
            end
        )
        t.Feature["Entity Spam Location"]:set_str_data({"Around Player", "Above Player", "On top of Player"})
        t.Feature["Entity Spam Cleanup"] =
            menu.add_player_feature(
            "Automatic Cleanup",
            "toggle",
            t.Parent["Entity Spam"],
            function(V)
                c["Entity Spam Cleanup"] = {Enabled = V.on}
            end
        )
        t.Feature["Entity Spam Clear"] =
            menu.add_player_feature(
            "Delete Spam Entities",
            "action",
            t.Parent["Entity Spam"],
            function()
                C("Clearing Spam Entities...")
                l.clear(Z["entity_spam"])
                Z["entity_spam"] = {}
                C("Spam Entities Successfully Cleared!")
                z("Spam Entities Cleared!", "Success")
            end
        )
        t.Parent["Entity Spam Presets"] =
            menu.add_player_feature("Spam Presets", "parent", t.Parent["Entity Spam"], nil).id
        for j = 1, #p.entity_spam do
            menu.add_player_feature(
                p.entity_spam[j].Name,
                "action",
                t.Parent["Entity Spam Presets"],
                function(V, bB)
                    local ax = p.entity_spam[j].Hash
                    local aV
                    if streaming.is_model_a_ped(ax) then
                        for j = 1, t.Feature["Entity Spam Amount"].value[bB] do
                            if t.Feature["Entity Spam Location"].value[bB] == 0 then
                                aV = k.PlayerCoords(bB) + v3(math.random(-10, 10), math.random(-10, 10), 0)
                                aV.z = m.GetGroundZ(aV.x, aV.y)
                            elseif t.Feature["Entity Spam Location"].value[bB] == 1 then
                                aV = k.PlayerCoords(bB) + v3(0, 0, 75)
                            else
                                aV = k.PlayerCoords(bB) + v3(0, 0, 1)
                            end
                            Z["entity_spam"][#Z["entity_spam"] + 1] = n.Ped(ax, aV)
                            coroutine.yield(0)
                        end
                    elseif streaming.is_model_a_vehicle(ax) then
                        for j = 1, t.Feature["Entity Spam Amount"].value[bB] do
                            if t.Feature["Entity Spam Location"].value[bB] == 0 then
                                aV = k.PlayerCoords(bB) + v3(math.random(-10, 10), math.random(-10, 10), 0)
                                aV.z = m.GetGroundZ(aV.x, aV.y)
                            elseif t.Feature["Entity Spam Location"].value[bB] == 1 then
                                aV = k.PlayerCoords(bB) + v3(0, 0, 75)
                            else
                                aV = k.PlayerCoords(bB) + v3(0, 0, 1)
                            end
                            Z["entity_spam"][#Z["entity_spam"] + 1] = n.Vehicle(ax, aV)
                            coroutine.yield(0)
                        end
                    elseif streaming.is_model_an_object(ax) then
                        for j = 1, t.Feature["Entity Spam Amount"].value[bB] do
                            if t.Feature["Entity Spam Location"].value[bB] == 0 then
                                aV = k.PlayerCoords(bB) + v3(math.random(-10, 10), math.random(-10, 10), 0)
                                aV.z = m.GetGroundZ(aV.x, aV.y)
                            elseif t.Feature["Entity Spam Location"].value[bB] == 1 then
                                aV = k.PlayerCoords(bB) + v3(0, 0, 75)
                            else
                                aV = k.PlayerCoords(bB) + v3(0, 0, 1)
                            end
                            Z["entity_spam"][#Z["entity_spam"] + 1] = n.Object(ax, aV)
                            coroutine.yield(0)
                        end
                    else
                        z("Invalid Preset!\nHash is not a valid entity", "Error", "")
                        return
                    end
                    if not t.Feature["Entity Spam Cleanup"].on[bB] then
                        z("Entities sent", "Success")
                        return
                    end
                    z("Entities sent, starting cleanup in 10 seconds...", "Success")
                    coroutine.yield(10000)
                    l.clear(Z["entity_spam"])
                    Z["entity_spam"] = {}
                    z("Cleanup complete!", "Success")
                end
            )
        end
        t.Feature["Ped Spam Input"] =
            menu.add_player_feature(
            "Ped: Input",
            "action",
            t.Parent["Entity Spam"],
            function(V, bB)
                local dP = k.Input("Enter Ped Model Name or Hash")
                if not dP then
                    z("Input canceled.", "Error", "")
                    return
                end
                local ax = dP
                if not tonumber(dP) then
                    ax = gameplay.get_hash_key(dP)
                end
                if not streaming.is_model_a_ped(ax) then
                    z("Input is not a valid ped.", "Error", "")
                    return
                end
                for j = 1, t.Feature["Entity Spam Amount"].value[bB] do
                    local aV
                    if t.Feature["Entity Spam Location"].value[bB] == 0 then
                        aV = k.PlayerCoords(bB) + v3(math.random(-10, 10), math.random(-10, 10), 0)
                        aV.z = m.GetGroundZ(aV.x, aV.y)
                    elseif t.Feature["Entity Spam Location"].value[bB] == 1 then
                        aV = k.PlayerCoords(bB) + v3(0, 0, 10)
                    else
                        aV = k.PlayerCoords(bB) + v3(0, 0, 1)
                    end
                    Z["entity_spam"][#Z["entity_spam"] + 1] = n.Ped(ax, aV)
                    coroutine.yield(0)
                end
                if not t.Feature["Entity Spam Cleanup"].on[bB] then
                    z("Peds sent", "Success")
                    return
                end
                z("Peds sent, starting cleanup in 10 seconds...", "Success")
                coroutine.yield(10000)
                l.clear(Z["entity_spam"])
                Z["entity_spam"] = {}
                z("Cleanup complete!", "Success")
            end
        )
        t.Feature["Vehicle Spam Input"] =
            menu.add_player_feature(
            "Vehicle: Input",
            "action",
            t.Parent["Entity Spam"],
            function(V, bB)
                local dP = k.Input("Enter Vehicle Model Name or Hash")
                if not dP then
                    z("Input canceled.", "Error", "")
                    return
                end
                local ax = dP
                if not tonumber(dP) then
                    ax = gameplay.get_hash_key(dP)
                end
                if not streaming.is_model_a_vehicle(ax) then
                    z("Input is not a valid vehicle.", "Error", "")
                    return
                end
                for j = 1, t.Feature["Entity Spam Amount"].value[bB] do
                    local aV
                    if t.Feature["Entity Spam Location"].value[bB] == 0 then
                        aV = k.PlayerCoords(bB) + v3(math.random(-10, 10), math.random(-10, 10), 0)
                        aV.z = m.GetGroundZ(aV.x, aV.y)
                    elseif t.Feature["Entity Spam Location"].value[bB] == 1 then
                        aV = k.PlayerCoords(bB) + v3(0, 0, 10)
                    else
                        aV = k.PlayerCoords(bB) + v3(0, 0, 1)
                    end
                    Z["entity_spam"][#Z["entity_spam"] + 1] = n.Vehicle(ax, aV)
                end
                if not t.Feature["Entity Spam Cleanup"].on[bB] then
                    z("Vehicles sent", "Success")
                    return
                end
                z("Vehicles sent, starting cleanup in 10 seconds...", "Success")
                coroutine.yield(10000)
                l.clear(Z["entity_spam"])
                Z["entity_spam"] = {}
                z("Cleanup complete!", "Success")
            end
        )
        t.Feature["Object Spam Input"] =
            menu.add_player_feature(
            "Object: Input",
            "action",
            t.Parent["Entity Spam"],
            function(V, bB)
                local dP = k.Input("Enter Object Model Name or Hash")
                if not dP then
                    z("Input canceled.", "Error", "")
                    return
                end
                local ax = dP
                if not tonumber(dP) then
                    ax = gameplay.get_hash_key(dP)
                end
                if not streaming.is_model_an_object(ax) then
                    z("Input is not a valid object.", "Error", "")
                    return
                end
                for j = 1, t.Feature["Entity Spam Amount"].value[bB] do
                    local aV
                    if t.Feature["Entity Spam Location"].value[bB] == 0 then
                        aV = k.PlayerCoords(bB) + v3(math.random(-10, 10), math.random(-10, 10), 0)
                        aV.z = m.GetGroundZ(aV.x, aV.y)
                    elseif t.Feature["Entity Spam Location"].value[bB] == 1 then
                        aV = k.PlayerCoords(bB) + v3(0, 0, 10)
                    else
                        aV = k.PlayerCoords(bB) + v3(0, 0, 1)
                    end
                    Z["entity_spam"][#Z["entity_spam"] + 1] = n.Object(ax, aV)
                    coroutine.yield(0)
                end
                if not t.Feature["Entity Spam Cleanup"].on[bB] then
                    z("Objects sent", "Success")
                    return
                end
                z("Objects sent, starting cleanup in 10 seconds...", "Success")
                coroutine.yield(10000)
                l.clear(Z["entity_spam"])
                Z["entity_spam"] = {}
                z("Cleanup complete!", "Success")
            end
        )
        t.Feature["Dump All Entites onto Player"] =
            menu.add_player_feature(
            "Dump All Entites onto Player",
            "action",
            t.Parent["Entity Spam"],
            function(V, bB)
                if bB == player.player_id() then
                    z("Doing this on yourself would result in a crash.", "Error", "")
                    return
                end
                local aV = k.PlayerCoords(bB)
                local eO = ped.get_all_peds()
                local fX = vehicle.get_all_vehicles()
                local fY = object.get_all_objects()
                local cW = k.OwnPed()
                local fZ = k.OwnVehicle()
                for j = 1, #eO do
                    if eO[j] ~= cW then
                        entity.set_entity_coords_no_offset(eO[j], aV)
                    end
                end
                for j = 1, #fX do
                    if fX[j] ~= fZ then
                        entity.set_entity_coords_no_offset(fX[j], aV)
                    end
                end
                for j = 1, #fY do
                    entity.set_entity_coords_no_offset(fY[j], aV)
                end
            end
        )
        t.Parent["Player Malicious"] = menu.add_player_feature("Malicious", "parent", t.playerparent, nil).id
        t.Feature["Host Kick"] =
            menu.add_player_feature(
            "Host Kick",
            "action",
            t.Parent["Player Malicious"],
            function(V, bB)
                if not network.network_is_host() then
                    z("You are not Session Host!", "Error", "")
                    return
                end
                network.network_session_kick_player(bB)
            end
        )
        t.Feature["Player Script Event Kick"] =
            menu.add_player_feature(
            "Script Event Kick",
            "action_value_str",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                if V.value == 0 then
                    r.kick(bB)
                else
                    r.kick(bB, true)
                end
                z("Kick sent.", "Success", "")
            end
        )
        t.Feature["Player Script Event Kick"]:set_str_data({"v1", "v2"})
        t.Feature["Player Script Kick Spam"] =
            menu.add_player_feature(
            "Script Kick Spam",
            "toggle",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    V.on = false
                    return
                end
                while V.on do
                    r.kick(bB, true)
                    coroutine.yield(200)
                end
            end
        )
        t.Feature["Player Script Event Crash"] =
            menu.add_player_feature(
            "Script Event Crash",
            "action",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                r.crash(bB)
                z("Crash sent.", "Success", "")
            end
        )
        t.Feature["Player Net Event Crash"] =
            menu.add_player_feature(
            "Net Event Crash",
            "action_value_str",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                local dW = {
                    {Name = "ROUND_ENDING_STINGER_CUSTOM", Ref = "CELEBRATION_SOUNDSET"},
                    {Name = "Object_Dropped_Remote", Ref = "GTAO_FM_Events_Soundset"},
                    {Name = "Oneshot_Final", Ref = "MP_MISSION_COUNTDOWN_SOUNDSET"},
                    {Name = "5s", Ref = "MP_MISSION_COUNTDOWN_SOUNDSET"}
                }
                local es = dW[math.random(#dW)]
                local f_
                if V.value == 0 then
                    f_ = 1
                else
                    f_ = 100
                end
                local time = utils.time_ms() + 2500
                while time > utils.time_ms() do
                    local aV = player.get_player_coords(bB)
                    for j = 1, 10 do
                        audio.play_sound_from_coord(-1, es.Name, aV, es.Ref, true, f_, false)
                    end
                    coroutine.yield(0)
                end
                z("Crash done.", "Success", "")
            end
        )
        t.Feature["Player Net Event Crash"]:set_str_data({"Low Range", "High Range"})
        t.Feature["Player Tow Truck Crash"] =
            menu.add_player_feature(
            "Tow Truck Crash",
            "action",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                local aV = k.PlayerCoords(bB)
                local g0 = n.Vehicle(0xE5A2D6C6, l.OffsetCoords(v3(aV.x, aV.y, aV.z + 5), k.PlayerHeading(bB), 10))
                local g1 = n.Vehicle(0x82CAC433, aV)
                entity.set_entity_visible(g0, false)
                entity.set_entity_visible(g1, false)
                entity.attach_entity_to_entity(g1, g0, 0, v3(), v3(), true, true, false, 0, true)
                z("Crash sent, starting cleanup in 5 seconds.", "Success")
                coroutine.yield(10000)
                l.clear({g1, g0})
                coroutine.yield(500)
                if not entity.is_an_entity(g0) then
                    z("Cleanup successful.", "Success")
                else
                    z("Cleanup failed.", "Error")
                end
            end
        )
        t.Feature["World Object Crash"] =
            menu.add_player_feature(
            "World Object Crash",
            "action_value_str",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                local g2 = {
                    386259036,
                    450174759,
                    1567950121,
                    1734157390,
                    1759812941,
                    2040219850,
                    1727217687,
                    -993438434,
                    -990984874,
                    -818431457,
                    -681705050,
                    -568850501,
                    3301528862,
                    3303982422,
                    3476535839,
                    3726116795,
                    -1231365640
                }
                if V.value == 0 then
                    local ax = g2[tonumber(#g2)]
                    local g3 = n.Worldobject(ax, k.PlayerCoords(bB), true, false)
                    z("Crash sent, attemping cleanup in 5 seconds.", "Success")
                    coroutine.yield(5000)
                    l.clear(g3)
                    coroutine.yield(500)
                    if not entity.is_an_entity(g3) then
                        z("Cleanup Successful.", "Success")
                    else
                        z("Cleanup failed.", "Error")
                    end
                    return
                end
                local g4 = at(g2)
                local fx = {}
                for j = 1, #g4 do
                    local fd = g2[g4[j]]
                    fx[#fx + 1] = n.Worldobject(fd, k.PlayerCoords(bB), true, false)
                end
                z("Crash sent, attemping cleanup in 5 seconds.", "Success")
                coroutine.yield(5000)
                l.clear(fx)
                z("Cleanup done.", "Success")
            end
        )
        t.Feature["World Object Crash"]:set_str_data({"v1", "v2"})
        t.Feature["Invalid Entity Crash"] =
            menu.add_player_feature(
            "Invalid Entity Crash",
            "action_value_str",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                local ds = k.PlayerCoords(bB)
                local cw = k.OwnCoords()
                if V.value ~= 2 and cw:magnitude(ds) < 1000 then
                    z("You are too close to the Target.", "Error", "")
                    return
                end
                local g5
                local aV = l.OffsetCoords(ds, k.PlayerHeading(bB), 10)
                if V.value == 0 then
                    local f8 = {0x3F039CBA, 0x856CFB02, 0x2D7030F3}
                    g5 = n.Ped(f8[math.random(#f8)], aV)
                elseif V.value == 1 then
                    local f8 = {956849991, 1133471123, 2803699023, 386089410, 1549009676}
                    g5 = n.Vehicle(f8[math.random(#f8)], aV)
                elseif V.value == 2 then
                    local ax = gameplay.get_hash_key("exc_prop_tr_meet_stool_01")
                    g5 = n.Object(ax, aV, true, false)
                end
                z("Crash sent, attemping cleanup in 5 seconds.\nDont go near the Target.", "Success")
                coroutine.yield(5000)
                l.clear(g5)
                coroutine.yield(500)
                if not entity.is_an_entity(g5) then
                    z("Cleanup Successful.", "Success")
                else
                    z("Cleanup failed.", "Error")
                end
            end
        )
        t.Feature["Invalid Entity Crash"]:set_str_data({"Ped", "Vehicle", "Object"})
        t.Feature["Invalid Outfit Crash"] =
            menu.add_player_feature(
            "Invalid Outfit Crash",
            "action",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                local cs = k.OwnPed()
                local cx = k.OwnCoords()
                local g6 = ped.get_ped_drawable_variation(cs, 3)
                local g7 = ped.get_ped_drawable_variation(cs, 8)
                local g8 = ped.get_ped_drawable_variation(cs, 6)
                local g9 = ped.get_ped_drawable_variation(cs, 4)
                if player.is_player_female(player.player_id()) then
                    ped.set_ped_component_variation(cs, 3, 415, 0, 0)
                    ped.set_ped_component_variation(cs, 8, 234, 0, 0)
                    ped.set_ped_component_variation(cs, 6, 106, 0, 0)
                    ped.set_ped_component_variation(cs, 4, 151, 0, 0)
                else
                    ped.set_ped_component_variation(cs, 3, 393, 0, 0)
                    ped.set_ped_component_variation(cs, 8, 189, 0, 0)
                    ped.set_ped_component_variation(cs, 6, 102, 0, 0)
                    ped.set_ped_component_variation(cs, 4, 144, 0, 0)
                end
                for j = 1, 10 do
                    entity.set_entity_coords_no_offset(cs, k.PlayerCoords(bB))
                    coroutine.yield(200)
                end
                coroutine.yield(500)
                ped.set_ped_component_variation(cs, 3, g6, 0, 0)
                ped.set_ped_component_variation(cs, 8, g7, 0, 0)
                ped.set_ped_component_variation(cs, 6, g8, 0, 0)
                ped.set_ped_component_variation(cs, 4, g9, 0, 0)
                entity.set_entity_coords_no_offset(cs, cx)
                z("Crash done.", "Success", "")
            end
        )
        t.Feature["Player Vehicle Component Crash"] =
            menu.add_player_feature(
            "Vehicle Component Crash",
            "action_value_str",
            t.Parent["Player Malicious"],
            function(V, bB)
                local f8 = {1349725314, 3253274834}
                local cw = l.OffsetCoords(k.PlayerCoords(bB), k.PlayerHeading(bB), 10)
                local ga = n.Vehicle(f8[V.value + 1], cw)
                l.MaxVehicle(ga, nil, true)
                z("Crash sent, attemping cleanup in 5 seconds.", "Success")
                coroutine.yield(5000)
                l.clear(ga)
                coroutine.yield(500)
                if not entity.is_an_entity(ga) then
                    z("Cleanup Successful.", "Success")
                else
                    z("Cleanup failed.", "Error")
                end
            end
        )
        t.Feature["Player Vehicle Component Crash"]:set_str_data({"v1", "v2"})
        t.Feature["Player AIO Crash"] =
            menu.add_player_feature(
            "AIO",
            "action",
            t.Parent["Player Malicious"],
            function(V, bB)
                if bB == player.player_id() then
                    z("No point in doing this on yourself", "Error", "")
                    return
                end
                local ds = k.PlayerCoords(bB)
                local cw = k.OwnCoords()
                if cw:magnitude(ds) < 1000 then
                    z("You are too close to the Target.", "Error", "")
                    return
                end
                local gb = {}
                z("AIO Crash starting in 5 seconds.\nDont go near the Target.", "Neutral", "")
                coroutine.yield(5000)
                menu.create_thread(
                    function()
                        gb[#gb + 1] = n.Vehicle(1349725314, ds)
                        l.MaxVehicle(gb[gb])
                    end,
                    nil
                )
                menu.create_thread(
                    function()
                        local f8 = {956849991, 1133471123, 2803699023, 386089410, 1549009676}
                        for j = 1, #f8 do
                            gb[#gb + 1] = n.Vehicle(f8[j], ds)
                        end
                    end,
                    nil
                )
                menu.create_thread(
                    function()
                        gb[#gb + 1] = n.Object(gameplay.get_hash_key("exc_prop_tr_meet_stool_01"), ds)
                    end,
                    nil
                )
                menu.create_thread(
                    function()
                        local time = utils.time_ms() + 2500
                        while time > utils.time_ms() do
                            local aV = player.get_player_coords(bB)
                            for j = 1, 10 do
                                audio.play_sound_from_coord(
                                    -1,
                                    "ROUND_ENDING_STINGER_CUSTOM",
                                    aV,
                                    "CELEBRATION_SOUNDSET",
                                    true,
                                    1,
                                    false
                                )
                            end
                            coroutine.yield(0)
                        end
                    end,
                    nil
                )
                menu.create_thread(
                    function()
                        local f8 = {0x3F039CBA, 0x856CFB02, 0x2D7030F3}
                        for j = 1, #f8 do
                            gb[#gb + 1] = n.Ped(f8[j], ds)
                        end
                    end,
                    nil
                )
                menu.create_thread(
                    function()
                        local g2 = {
                            386259036,
                            450174759,
                            1567950121,
                            1734157390,
                            1759812941,
                            2040219850,
                            -1231365640,
                            1727217687,
                            3613262246 - 993438434,
                            -990984874,
                            -818431457,
                            -681705050,
                            -568850501,
                            3301528862,
                            3303982422,
                            3476535839,
                            3726116795
                        }
                        local g4 = at(g2)
                        for j = 1, #g4 do
                            local fd = g2[g4[j]]
                            gb[#gb + 1] = n.Worldobject(fd, ds, true, false)
                        end
                    end,
                    nil
                )
                menu.create_thread(
                    function()
                        gb[#gb + 1] = n.Vehicle(0xE5A2D6C6, ds)
                        local g0 = gb[#gb]
                        gb[#gb + 1] = n.Vehicle(0x82CAC433, ds)
                        local g1 = gb[#gb]
                        entity.set_entity_visible(g0, false)
                        entity.set_entity_visible(g1, false)
                        entity.attach_entity_to_entity(g1, g0, 0, v3(), v3(), true, true, false, 0, true)
                    end,
                    nil
                )
                menu.create_thread(
                    function()
                        r.crash(bB)
                    end,
                    nil
                )
                coroutine.yield(2000)
                z("AIO Crash sent, attemping cleanup in 5 seconds.", "Success", "")
                coroutine.yield(5000)
                l.clear(gb)
                z("Cleanup Complete.", "Success", "")
            end
        )
        e.Log("Player features successfully loaded.")
    end,
    nil
)
menu.create_thread(
    function()
        while not menu.has_thread_finished(cf) and not menu.has_thread_finished(fv) do
            coroutine.yield(0)
        end
        if not menu.is_trusted_mode_enabled() then
            z("Trusted Mode is not enabled, some features are not available.", "Neutral")
        end
        if utils.file_exists(b["DefaultConfig"]) then
            e.Log("Loading Settings...")
            e.LoadSettings()
        else
            e.Log("Creating Default Config...")
            e.SaveSettings()
        end
        if t.Feature["Weapon Loadout Toggle"].on and t.Feature["Weapon Loadout Remove"].on then
            weapon.remove_all_ped_weapons(k.OwnPed())
        end
        c["Vehicle Blacklist Reaction"] = {Value = t.Feature["Vehicle Blacklist Reaction"].value}
        c["Player Bar Text Green"] = {Value = t.Feature["Player Bar Text Green"].value}
        c["Player Bar Text Red"] = {Value = t.Feature["Player Bar Text Red"].value}
        c["Player Bar Text Blue"] = {Value = t.Feature["Player Bar Text Blue"].value}
        c["Kill Aura Range"] = {Value = t.Feature["Kill Aura Range"].value}
        c["Kill Aura Option"] = {Value = t.Feature["Kill Aura Option"].value}
        c["Force Field Range"] = {Value = t.Feature["Force Field Range"].value}
        c["Force Field Strength"] = {Value = t.Feature["Force Field Strength"].value}
        c["Bodyguard Health"] = {Value = t.Feature["Bodyguard Health"].value}
        c["Bodyguard Behavior"] = {Value = t.Feature["Bodyguard Behavior"].value}
        c["Bodyguard Distance"] = {Value = t.Feature["Bodyguard Distance"].value}
        c["Bodyguard Formation"] = {Value = t.Feature["Bodyguard Formation"].value}
        c["Bodyguard Count"] = {Value = t.Feature["Bodyguard Count"].value}
        c["Vehicle Colors Speed"] = {Value = t.Feature["Vehicle Colors Speed"].value}
        c["AI Driving Style"] = {Value = t.Feature["AI Driving Style"].value}
        c["Sound Spam Speed"] = {Value = t.Feature["Sound Spam Speed"].value}
        c["Explosion Delay"] = {Value = t.Feature["Explosion Delay"].value}
        c["Explosion Camshake"] = {Value = t.Feature["Explosion Camshake"].value}
        c["Chat Spam Delay"] = {Value = t.Feature["Chat Spam Delay"].value}
        c["SMS Delay"] = {Value = t.Feature["SMS Delay"].value}
        c["Player Blacklist Kick Type"] = {Value = t.Feature["Player Blacklist Kick Type"].value}
        c["Ad Blacklist Kick Type"] = {Value = t.Feature["Ad Blacklist Kick Type"].value}
        c["Player Bar Text Allign"] = {Value = t.Feature["Player Bar Text Allign"].value}
        for j = 0, 31 do
            if player.is_player_valid(j) then
                ac[j] = {ID = j, Name = k.Name(j)}
            end
        end
        menu.create_thread(
            function()
                while true do
                    if menu.is_trusted_mode_enabled() then
                        t.Feature["Prevent Spectate Death"].hidden = false
                        t.Feature["Leave Online"].hidden = false
                        t.Feature["Fake Wanted Level"].hidden = false
                        t.Feature["Vehicle Godmode v2"].hidden = false
                        t.Feature["Explode All Vehicles"].hidden = false
                    else
                        t.Feature["Prevent Spectate Death"].hidden = true
                        t.Feature["Prevent Spectate Death"].on = false
                        t.Feature["Leave Online"].hidden = true
                        t.Feature["Fake Wanted Level"].hidden = true
                        t.Feature["Vehicle Godmode v2"].hidden = true
                        t.Feature["Vehicle Godmode v2"].on = false
                        t.Feature["Explode All Vehicles"].hidden = true
                        t.Feature["Explode All Vehicles"].on = false
                    end
                    if menu.is_trusted_mode_enabled() and network.is_session_started() then
                        t.Parent["Stats Editor"].hidden = false
                    else
                        t.Parent["Stats Editor"].hidden = true
                    end
                    coroutine.yield(1000)
                end
            end,
            nil
        )
        if utils.file_exists(b["Dev"]) then
            _2t1sdevParent = menu.add_feature("Dev Features", "parent", t.mainparent, nil).id
            _2t1sdevPlayerparent = menu.add_player_feature("Dev Features", "parent", t.playerparent, nil).id
            local gc = loadfile(b["Dev"])
            gc()
        end
        e.Log("2Take1Script Successfully executed!")
        z("2Take1Script Successfully executed!", "Success")
    end,
    nil
)
