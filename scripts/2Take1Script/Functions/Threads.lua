local a = require("2Take1Script.Functions.Utils")
local b = require("2Take1Script.Functions.Math")
local c = require("2Take1Script.Data.ScriptEvents")
local d = {}
function d.Killaura(e)
    local f = e[1]
    local g = e[2]
    local h = e[3]
    local i = entity.get_entity_coords(f)
    local j = player.get_player_coords(player.player_id())
    local k = j:magnitude(i)
    if k < g then
        if h == 0 and not entity.is_entity_dead(f) then
            if ped.get_vehicle_ped_is_using(f) ~= 0 then
                ped.clear_ped_tasks_immediately(f)
            end
            local i = entity.get_entity_coords(f)
            gameplay.shoot_single_bullet_between_coords(
                i + v3(0, 0, 1),
                i,
                1000,
                0xC472FE2,
                player.get_player_ped(player.player_id()),
                false,
                true,
                1000
            )
        elseif h == 1 and not entity.is_entity_dead(f) then
            fire.add_explosion(i, 5, true, false, 0, 0)
        end
    end
end
function d.Forcefield(e)
    local l = e[1]
    local g = e[2]
    local m = e[3]
    local i = entity.get_entity_coords(l)
    local j = player.get_player_coords(player.player_id())
    local k = j:magnitude(i)
    if k < g then
        local n = (i - j) * m / k
        a.request_ctrl(l, 100)
        entity.set_entity_velocity(l, n)
    end
end
function d.Assassins(e)
    local o = e[1]
    local p = e[2]
    while entity.is_an_entity(o) and player.is_player_valid(p) do
        local q = player.get_player_ped(p)
        ai.task_combat_ped(o, q, 0, 16)
        local r, s = ped.get_ped_last_weapon_impact(o)
        if r and s:magnitude(player.get_player_coords(p)) > 2 then
            ped.clear_ped_tasks_immediately(o)
            ai.task_combat_ped(o, q, 0, 16)
        end
        coroutine.yield(1000)
    end
end
function d.Clearpeds(e)
    local t = 0
    for u = 1, #e do
        if
            not ped.is_ped_a_player(e[u]) and
                entity.get_entity_coords(e[u]):magnitude(player.get_player_coords(player.player_id())) < 1000
         then
            a.clear(e[u])
            t = t + 1
        end
        if t == 20 then
            t = 0
            coroutine.yield(0)
        end
    end
end
function d.Clearvehicles(e)
    local v = {}
    local t = 0
    for u = 0, 31 do
        local w = c.GetPersonalVehicle(u)
        if w ~= 0 then
            v[#v + 1] = w
        end
    end
    for u = 1, #e do
        local x
        for y = 1, #v do
            if e[u] == v[y] then
                x = true
            end
        end
        if
            not x and not ped.is_ped_a_player(vehicle.get_ped_in_vehicle_seat(e[u], -1)) and
                entity.get_entity_coords(e[u]):magnitude(player.get_player_coords(player.player_id())) < 1000
         then
            a.clear(e[u])
            t = t + 1
        end
        if t == 20 then
            t = 0
            coroutine.yield(0)
        end
    end
end
function d.Clearobjects(e)
    local t = 0
    for u = 1, #e do
        if entity.get_entity_coords(e[u]):magnitude(player.get_player_coords(player.player_id())) < 1000 then
            a.clear(e[u])
            t = t + 1
        end
        if t == 20 then
            t = 0
            coroutine.yield(0)
        end
    end
end
function d.Vehiclecollision(e)
    local z = e[1]
    local o = e[2]
    for u = 1, #z do
        entity.set_entity_no_collsion_entity(z[u], o, true)
        entity.set_entity_no_collsion_entity(o, z[u], true)
    end
end
function d.Objectcollision(e)
    local A = e[1]
    local o = e[2]
    for u = 1, #A do
        entity.set_entity_no_collsion_entity(A[u], o, true)
        entity.set_entity_no_collsion_entity(o, A[u], true)
    end
end
function d.Upgradevehicles(l)
    local B = entity.get_entity_speed(l)
    a.request_ctrl(l)
    entity.freeze_entity(l, true)
    a.MaxVehicle(l)
    entity.freeze_entity(l, false)
    vehicle.set_vehicle_forward_speed(l, B)
end
return d
