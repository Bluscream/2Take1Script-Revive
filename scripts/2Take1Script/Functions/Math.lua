local a = {}
function a.TimePrefix()
    local b = os.date("*t")
    if b.month < 10 then
        b.month = "0" .. b.month
    end
    if b.day < 10 then
        b.day = "0" .. b.day
    end
    if b.hour < 10 then
        b.hour = "0" .. b.hour
    end
    if b.min < 10 then
        b.min = "0" .. b.min
    end
    if b.sec < 10 then
        b.sec = "0" .. b.sec
    end
    return "[" .. b.year .. "-" .. b.month .. "-" .. b.day .. " " .. b.hour .. ":" .. b.min .. ":" .. b.sec .. "]"
end
function a.RGBAToInt(c, d, e, f)
    f = f or 255
    return c & 0x0ff << 0x00 | (d & 0x0ff << 0x08) | (e & 0x0ff << 0x10) | (f & 0x0ff << 0x18)
end
function a.RGBToHex(g)
    local h = "0X"
    for i, j in pairs(g) do
        local k = ""
        while j > 0 do
            local l = math.fmod(j, 16) + 1
            j = math.floor(j / 16)
            k = string.sub("0123456789ABCDEF", l, l) .. k
        end
        if string.len(k) == 0 then
            k = "00"
        elseif string.len(k) == 1 then
            k = "0" .. k
        end
        h = h .. k
    end
    return h
end
function a.DecToHex(m)
    return string.format("%0X", m)
end
function a.DecToHex2(n)
    return string.format("%02X", n)
end
function a.HexToDec(k)
    return tonumber(k, 16)
end
function a.ToInt(o)
    local p = tostring(o)
    local q, r = p:find("%.")
    if q then
        return tonumber(p:sub(1, q - 1))
    else
        return o
    end
end
function a.Round(s, t)
    local u = 10 ^ (t or 0)
    return math.floor(s * u + 0.5) / u
end
function a.GetGroundZ(v, w, x)
    x = x or 800
    local y, z = gameplay.get_ground_z(v3(v, w, x))
    while not y do
        x = x - 5
        y, z = gameplay.get_ground_z(v3(v, w, x))
        if x < -200 then
            x = -200
            y = true
        end
    end
    return z
end
function a.GetPedBoneCoords(A, B, C)
    C = C or v3()
    local y, D = ped.get_ped_bone_coords(A, B, C)
    while not y do
        system.wait(0)
        y, D = ped.get_ped_bone_coords(A, B, C)
    end
    return D
end
function a.SetIntStat(E, F, j, G)
    G = G or true
    local H, I = E, E
    if F then
        H = "MP0_" .. E
        I = "MP1_" .. E
        I = gameplay.get_hash_key(I)
    end
    H = gameplay.get_hash_key(H)
    local J, K = stats.stat_get_int(H, -1)
    if J ~= j then
        stats.stat_set_int(H, j, G)
    end
    if F then
        local L, K = stats.stat_get_int(I, -1)
        if L ~= j then
            stats.stat_set_int(I, j, G)
        end
    end
end
function a.SetFloatStat(E, F, j, G)
    G = G or true
    local H, I = E, E
    if F then
        H = "MP0_" .. E
        I = "MP1_" .. E
        I = gameplay.get_hash_key(I)
    end
    H = gameplay.get_hash_key(H)
    local J, K = stats.stat_get_float(H, -1)
    if J ~= j then
        stats.stat_set_float(H, j, G)
    end
    if F then
        local L, K = stats.stat_get_float(I, -1)
        if L ~= j then
            stats.stat_set_float(I, j, G)
        end
    end
end
return a
