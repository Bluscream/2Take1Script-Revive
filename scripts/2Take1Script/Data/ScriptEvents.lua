local a = {
    ["Netbail Kick"] = 0x493FC6BB,
    ["Script Host Curse 1"] = 0x820DD3E4,
    ["Script Host Curse 2"] = 0x2A0520FE,
    ["Script Host Curse 3"] = 0xD11E424B,
    ["Passive Mode"] = 0x4267B065,
    ["CEO Kick"] = 0xED6F046,
    ["CEO Ban"] = 0xD26E4A01,
    ["CEO Money"] = 0x70AB59D5,
    ["Force To Mission"] = 0x786FBAAE,
    ["Force To Mission 2"] = 0xA517E3C8,
    ["Start CEO Mission"] = 0x1F1FFC3A,
    ["Start Warehouse Mission"] = 0xc7c4a641,
    ["Force To Island"] = 0xDAF8082C,
    ["Force To Island 2"] = 0x57420247,
    ["Casino Cutscene"] = 0x3FAC59CA,
    ["Transaction Error"] = 0x9A6CDD38,
    ["Camera Manipulation"] = 0x2FC154DC,
    ["Off The Radar"] = 0xE8A824A0,
    ["Bribe Authorities"] = 0x66B0F59A,
    ["Insurance Notification"] = 0x2FCF970F,
    ["Notification"] = 0x285DDF33,
    ["Typing Begin"] = 0x2C8A72D0,
    ["Typing Stop"] = 0xC4EF2D0B,
    ["Fake Invite"] = 0x43865AE4,
    ["Fake Invite 2"] = 0x9C1DEF98,
    ["Fake Invite 3"] = 0x36FB79ED,
    ["Apartment Invite"] = 0x23F74138,
    ["Warehouse Invite"] = 0xE56661F6,
    ["Vehicle Kick"] = 0x2280A552,
    ["Vehicle EMP"] = 0x863B6494,
    ["Destroy Personal Vehicle"] = 0xC2CC7762,
    ["SMS"] = 0x717AB445,
    ["Bounty"] = 0x4D3010A8,
    ["Remove Wanted"] = 0xFA8E0C52
}
function a.MainGlobal(b)
    return script.get_global_i(1893551 + 1 + b * 599 + 510)
end
function a.CEOID(b)
    return script.get_global_i(1893551 + 1 + b * 599 + 10)
end
function a.IsPlayerAssociate(b)
    local c = script.get_global_i(1893551 + 1 + b * 599 + 10)
    return c ~= -1 and c ~= b
end
function a.IsPlayerOTR(b)
    return script.get_global_i(2689224 + 1 + b * 451 + 207) == 1
end
function a.DoesPlayerHaveBounty(b)
    return script.get_global_i(1835502 + 1 + b * 4 + 3) == 1
end
function a.GetPersonalVehicle(b)
    return script.get_global_i(2703660 + 173 + b + 1)
end
function a.GlobalPair()
    return script.get_global_i(1921039 + 9), script.get_global_i(1921036 + 10)
end
function a.Send(d, e, b)
    if not b or not player.is_player_valid(b) then
        return
    end
    if not tonumber(d) then
        if a[d] then
            d = a[d]
        else
            return
        end
    end
    script.trigger_script_event(d, b, e)
end
function a.setBounty(b, f, g)
    if not b or not player.is_player_valid(b) then
        return
    end
    for h = 0, 31 do
        if player.is_player_valid(h) then
            script.trigger_script_event(
                a["Bounty"],
                h,
                {player.player_id(), b, 1, f or 10000, 0, g, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, a.GlobalPair()}
            )
        end
    end
end
local function i(j, f, k, l)
    local m = {j}
    if not f or f == 0 then
        return m
    end
    if not k then
        k = -2147483647
    end
    if not l then
        l = 2147483647
    end
    for n = 1, f do
        m[#m + 1] = math.random(k, l)
    end
    return m
end
local function o(p)
    for n = #p, 2, -1 do
        local q = math.random(n)
        p[n], p[q] = p[q], p[n]
    end
    return p
end
function a.kick(b, r)
    if not b or not player.is_player_valid(b) then
        return
    end
    if r then
        local s =
            o(
            {
                0x8f7b5919,
                0xc394791f,
                0x775b1c07,
                0x83b8e835,
                0xf26c0baf,
                0x9f97c32b,
                0xde0c42b4,
                0x83ac68b8,
                0x906a223a,
                0xed161b1d,
                0xf756cb9c,
                0xdd5e10b7,
                0x5a45ac72,
                0x42a33d7,
                0x3b0b7534,
                0x37437C28,
                0xB1FCAF3A,
                0x364F7E34,
                0xEEB39C54,
                0x7167c07b,
                0xEA0A4E2C,
                0xDB601EE5,
                0x894EE698,
                0xFC173895,
                0x8f8bb98,
                0x96ACD460,
                0x562BAE0D,
                0x428AE4D5,
                0x1A0416B7,
                0x95C21538,
                0x8A924376,
                0x68C5399F,
                0x23F74138
            }
        )
        for n = 1, #s do
            script.trigger_script_event(s[n], b, i(player.player_id(), 25))
        end
        return
    end
    if script.get_host_of_this_script() == b then
        script.trigger_script_event(a["Start CEO Mission"], b, {player.player_id(), 0, 4294967295})
    end
    script.trigger_script_event(a["Netbail Kick"], b, {player.player_id(), a.MainGlobal(b)})
    local m = i(player.player_id(), 25)
    m[5] = 115
    script.trigger_script_event(a["Apartment Invite"], b, m)
end
function a.crash(b)
    if not b or not player.is_player_valid(b) then
        return
    end
    local s = o({0xAD63290E, 0x39624029, 0xE88ECD48})
    for n = 1, #s do
        script.trigger_script_event(s[n], b, i(player.player_id(), 25))
    end
end
function a.curse(t)
    local h = script.get_host_of_this_script()
    if h == player.player_id() then
        return
    end
    if player.is_player_valid(h) then
        script.trigger_script_event(a["Script Host Curse " .. t or 1], h, i(player.player_id(), 25))
    end
end
return a
