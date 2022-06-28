local a = {
    {"Remembered", 8388608},
    {"Modded Health", 16777216},
    {"Modded Armor", 33554432},
    {"Vehicle Godmode", 67108864},
    {"Modded Off The Radar", 134217728},
    {"Modded Script Event", 268435456},
    {"Max Speed Bypass", 536870912},
    {"Player Godmode", 1073741824},
    {"Bad Net Event", 2147483648},
    {"Profanity Filter Bypass", 4294967296}
}
function a.Load()
    for b = 1, #a do
        a[b][2] = 1
        while #player.get_modder_flag_text(a[b][2]) > 0 do
            a[b][2] = a[b][2] << 1
        end
        a[b][2] = player.add_modder_flag(a[b][1])
    end
end
return a
