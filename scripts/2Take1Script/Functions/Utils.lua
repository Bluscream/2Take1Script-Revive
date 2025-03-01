local a = {}
local function b(c)
    local d = "0X"
    for e, f in pairs(c) do
        local g = ""
        while f > 0 do
            local h = math.fmod(f, 16) + 1
            f = math.floor(f / 16)
            g = string.sub("0123456789ABCDEF", h, h) .. g
        end
        if string.len(g) == 0 then
            g = "00"
        elseif string.len(g) == 1 then
            g = "0" .. g
        end
        d = d .. g
    end
    return d
end
function a.request_ctrl(i, j)
    if entity.is_an_entity(i) then
        if not network.has_control_of_entity(i) then
            network.request_control_of_entity(i)
            j = j or 50
            local k = utils.time_ms() + j
            while entity.is_an_entity(i) and not network.has_control_of_entity(i) do
                system.wait(0)
                network.request_control_of_entity(i)
                if k < utils.time_ms() then
                    return false
                end
            end
        end
        return network.has_control_of_entity(i)
    end
    return false
end
function a.request_model(l)
    if l and not streaming.has_model_loaded(l) then
        streaming.request_model(l)
        local m = utils.time_ms() + 7500
        while not streaming.has_model_loaded(l) do
            system.wait(0)
            if m < utils.time_ms() then
                return false
            end
        end
    end
    return streaming.has_model_loaded(l)
end
function a.valid_player(n, o)
    if player.is_player_valid(n) then
        if n ~= player.player_id() and player.get_player_scid(n) ~= -1 then
            if o and player.is_player_friend(n) then
                return false
            else
                return true
            end
        end
    end
    return false
end
function a.valid_modder(n)
    if player.is_player_valid(n) then
        if n ~= player.player_id() and player.can_player_be_modder(n) and not player.is_player_modder(n, -1) then
            return true
        end
    end
    return false
end
function a.valid_vehicle(p)
    if p and vehicle.get_ped_in_vehicle_seat(p, -1) == player.get_player_ped(player.player_id()) then
        return true
    end
    return false
end
function a.write(q, r)
    if q and r then
        io.output(q)
        io.write(r .. "\n")
        io.close(q)
    end
end
function a.set_coords(i, s)
    entity.set_entity_velocity(i, v3())
    entity.set_entity_coords_no_offset(i, s)
end
function a.print_table(t, u)
    u = u or 1
    if type(t) == "table" then
        if u == 1 then
            local v = "\n"
            for w, x in pairs(t) do
                if type(w) ~= "number" then
                    w = '"' .. w .. '"'
                end
                v = v .. a.print_table(x) .. ", "
            end
            return v
        elseif u == 2 then
            local v = ""
            for w, x in pairs(t) do
                if type(w) ~= "number" then
                    w = '"' .. w .. '"'
                end
                v = v .. a.print_table(x, 2) .. ", "
            end
            return v
        else
            local v = ""
            local y, z
            for w, x in pairs(t) do
                if type(w) ~= "number" then
                    w = '"' .. w .. '"'
                end
                v = v .. a.print_table(x, 3) .. " "
                if string.len(v) > 200 and not y then
                    v = v .. "\n"
                    y = true
                elseif string.len(v) > 400 and not z then
                    v = v .. "\n"
                    z = true
                end
            end
            return v
        end
    else
        return tostring(t)
    end
end
function a.MaxVehicle(p, u, A)
    if not p then
        return
    end
    u = u or 1
    if A then
        A = 49
    end
    vehicle.set_vehicle_mod_kit_type(p, 0)
    if u == 1 then
        for B = 0, A or 47 do
            local C = vehicle.get_num_vehicle_mods(p, B) - 1
            vehicle.set_vehicle_mod(p, B, C, true)
            vehicle.toggle_vehicle_mod(p, C, true)
        end
        for D = 0, 20 do
            if vehicle.does_extra_exist(p, D) then
                vehicle.set_vehicle_extra(p, D, true)
            end
        end
        vehicle.set_vehicle_bulletproof_tires(p, true)
        vehicle.set_vehicle_window_tint(p, 1)
        vehicle.set_vehicle_number_plate_index(p, 1)
    elseif u == 2 then
        local E = {11, 12, 13, 15, 16}
        for B = 1, #E do
            local C = vehicle.get_num_vehicle_mods(p, E[B]) - 1
            vehicle.set_vehicle_mod(p, E[B], C, true)
        end
        vehicle.toggle_vehicle_mod(p, 18, true)
        vehicle.set_vehicle_bulletproof_tires(p, true)
    elseif u == 3 then
        for B = 0, A or 47 do
            local C = vehicle.get_num_vehicle_mods(p, B) - 1
            if C > 0 then
                C = math.random(0, C)
            end
            local F
            if math.random(0, 10) > 5 then
                F = true
            else
                F = false
            end
            vehicle.set_vehicle_mod(p, B, C, F)
            vehicle.toggle_vehicle_mod(p, C, true)
        end
        for D = 0, 20 do
            if vehicle.does_extra_exist(p, D) then
                vehicle.set_vehicle_extra(p, D, true)
            end
        end
        vehicle.set_vehicle_bulletproof_tires(p, true)
        vehicle.set_vehicle_window_tint(p, math.random(0, 3))
        vehicle.set_vehicle_number_plate_index(p, math.random(0, 5))
    end
end
function a.RepairVehicle(p)
    if not p then
        return
    end
    local G = entity.get_entity_speed(p)
    vehicle.set_vehicle_fixed(p)
    vehicle.set_vehicle_deformation_fixed(p)
    vehicle.set_vehicle_engine_health(p, 1000.0)
    vehicle.set_vehicle_undriveable(p, false)
    if entity.is_entity_on_fire(p) then
        fire.stop_entity_fire(p)
    end
    if not vehicle.is_vehicle_engine_running(p) then
        vehicle.set_vehicle_engine_on(p, true, true, false)
    end
    if G > 75.0 then
        vehicle.set_vehicle_forward_speed(p, G)
    end
end
function a.GetVehicleMods(p)
    local H = {}
    H.primary = vehicle.get_vehicle_primary_color(p)
    H.secondary = vehicle.get_vehicle_secondary_color(p)
    H.pearlcolor = vehicle.get_vehicle_pearlecent_color(p)
    H.wheelcolor = vehicle.get_vehicle_wheel_color(p)
    H.lights = vehicle.get_vehicle_headlight_color(p)
    H.neoncolor = vehicle.get_vehicle_neon_lights_color(p)
    H.window = vehicle.get_vehicle_window_tint(p)
    H.wheeltype = vehicle.get_vehicle_wheel_type(p)
    H.platetype = vehicle.get_vehicle_number_plate_index(p)
    H.platetext = vehicle.get_vehicle_number_plate_text(p)
    H.neon = {}
    for B = 0, 3 do
        if vehicle.is_vehicle_neon_light_enabled(p, B) then
            H.neon[#H.neon + 1] = true
        end
    end
    H.mods = {}
    for B = 0, 49 do
        if vehicle.is_toggle_mod_on(p, B) then
            H.mods[B] = B
        else
            H.mods[B] = vehicle.get_vehicle_mod(p, B)
        end
    end
    return H
end
function a.SetVehicleMods(p, H, I)
    vehicle.set_vehicle_mod_kit_type(p, 0)
    vehicle.set_vehicle_colors(p, H.primary, H.secondary)
    vehicle.set_vehicle_extra_colors(p, H.pearlcolor, H.wheelcolor)
    vehicle.set_vehicle_headlight_color(p, H.lights)
    vehicle.set_vehicle_neon_lights_color(p, H.neoncolor)
    vehicle.set_vehicle_window_tint(p, H.window)
    vehicle.set_vehicle_wheel_type(p, H.wheeltype)
    vehicle.set_vehicle_bulletproof_tires(p, true)
    vehicle.set_vehicle_number_plate_index(p, H.platetype)
    for B = 1, #H.neon do
        vehicle.set_vehicle_neon_light_enabled(p, B, true)
    end
    for B = 0, 49 do
        if H.mods[B] then
            vehicle.set_vehicle_mod(p, B, H.mods[B], false)
            vehicle.toggle_vehicle_mod(p, B, true)
        end
    end
end
function a.OffsetCoords(s, J, K)
    J = math.rad((J - 180) * -1)
    s.x = s.x + math.sin(J) * -K
    s.y = s.y + math.cos(J) * -K
    return s
end
function a.id_from_name(L)
    L = string.lower(L)
    local M
    for N = 0, 31 do
        if player.get_player_scid(N) ~= -1 then
            M = string.lower(player.get_player_name(N))
            if M == L then
                return N
            end
        end
    end
    return -1
end
function a.tp(i, O, J)
    local P, Q, R, S = player.get_player_ped(player.player_id())
    if type(i) == "number" then
        S = ped.get_vehicle_ped_is_using(i)
        if S ~= 0 then
            if ped.is_ped_in_any_vehicle(P) then
                ped.clear_ped_tasks_immediately(P)
                system.wait(10)
            end
        end
    end
    R = ped.get_vehicle_ped_is_using(P)
    if R ~= 0 then
        a.request_ctrl(R)
        entity.set_entity_velocity(R, v3())
        P = R
    end
    if type(i) == "number" then
        Q = entity.get_entity_coords(i)
    else
        Q = i
    end
    if O then
        Q.z = Q.z + O
    end
    a.set_coords(P, Q)
    if J then
        entity.set_entity_heading(P, J)
    end
    if S then
        system.wait(1500)
        ped.set_ped_into_vehicle(player.get_player_ped(player.player_id()), S, vehicle.get_free_seat(S))
    end
end
function a.color_veh(p, T, B, U)
    a.request_ctrl(p)
    system.wait(0)
    vehicle.set_vehicle_tire_smoke_color(p, T[1], T[2], T[3])
    vehicle.set_vehicle_custom_primary_colour(p, b({T[1], T[2], T[3]}))
    vehicle.set_vehicle_custom_secondary_colour(p, b({T[1], T[2], T[3]}))
    vehicle.set_vehicle_custom_pearlescent_colour(p, b({T[1], T[2], T[3]}))
    vehicle.set_vehicle_neon_lights_color(p, b({T[1], T[2], T[3]}))
    vehicle.set_vehicle_custom_wheel_colour(p, b({T[1], T[2], T[3]}))
    if not B then
        B = 0
    end
    if T[1] > 200 and T[1] < 256 and T[2] > 200 and T[2] < 256 and T[3] > 220 and T[3] < 256 then
        B = 0
    end
    if T[1] >= 0 and T[1] < 30 and T[2] >= 0 and T[2] < 50 and T[3] > 220 and T[3] < 256 then
        B = 1
    end
    if T[1] >= 0 and T[1] < 30 and T[2] >= 50 and T[2] < 110 and T[3] > 220 and T[3] < 256 then
        B = 2
    end
    if T[1] >= 0 and T[1] < 30 and T[2] >= 110 and T[2] < 256 and T[3] > 100 and T[3] <= 220 then
        B = 3
    end
    if T[1] >= 30 and T[1] < 120 and T[2] >= 110 and T[2] < 256 and T[3] >= 0 and T[3] <= 100 then
        B = 4
    end
    if T[1] >= 120 and T[1] < 256 and T[2] >= 110 and T[2] < 256 and T[3] >= 0 and T[3] < 100 then
        B = 5
    end
    if T[1] >= 120 and T[1] < 256 and T[2] >= 110 and T[2] < 200 and T[3] >= 0 and T[3] < 100 then
        B = 6
    end
    if T[1] >= 120 and T[1] < 256 and T[2] > 45 and T[2] < 109 and T[3] >= 0 and T[3] < 100 then
        B = 7
    end
    if T[1] >= 120 and T[1] < 256 and T[2] >= 0 and T[2] <= 45 and T[3] >= 0 and T[3] < 100 then
        B = 8
    end
    if T[1] >= 120 and T[1] < 256 and T[2] > 45 and T[2] < 100 and T[3] >= 50 and T[3] < 150 then
        B = 9
    end
    if T[1] >= 120 and T[1] < 256 and T[2] >= 0 and T[2] <= 45 and T[3] >= 150 and T[3] < 256 then
        B = 10
    end
    if T[1] >= 0 and T[1] < 120 and T[2] >= 0 and T[2] <= 45 and T[3] >= 150 and T[3] < 256 then
        B = 11
    end
    if T[1] >= 0 and T[1] < 30 and T[2] >= 0 and T[2] <= 45 and T[3] >= 150 and T[3] < 256 then
        B = 12
    end
    if U then
        B = U
    end
    vehicle.set_vehicle_headlight_color(p, B)
end
function a.random_outfit(V, W)
    if not V or not W then
        return
    end
    local X = math.random(0, ped.get_number_of_ped_drawable_variations(V, W))
    local Y = math.random(0, ped.get_number_of_ped_texture_variations(V, W, X))
    return ped.set_ped_component_variation(V, W, X, Y, math.random(0, 3))
end
function a.random_property(V, W, Z)
    if not V or not W then
        return
    end
    Z = Z or false
    local X = math.random(0, ped.get_number_of_ped_drawable_variations(V, W))
    local Y = math.random(0, ped.get_number_of_ped_texture_variations(V, W, X))
    return ped.set_ped_prop_index(V, W, X, Y, Z)
end
function a.clear(_, j)
    if _ and type(_) == "table" then
        j = j or 50
        for B = 1, #_ do
            if
                _[B] ~= player.get_player_ped(player.player_id()) and
                    _[B] ~= ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
             then
                a.request_ctrl(_[B], j)
                entity.detach_entity(_[B])
                entity.set_entity_as_mission_entity(_[B], true, true)
                entity.set_entity_as_no_longer_needed(_[B])
                entity.set_entity_velocity(_[B], v3())
                entity.set_entity_coords_no_offset(_[B], v3(8000, 8000, -1000))
                entity.delete_entity(_[B])
            end
        end
    else
        a.request_ctrl(_, j)
        entity.detach_entity(_)
        entity.set_entity_as_mission_entity(_, true, true)
        entity.set_entity_as_no_longer_needed(_)
        entity.set_entity_velocity(_, v3())
        entity.set_entity_coords_no_offset(_, v3(8000, 8000, -1000))
        entity.delete_entity(_)
    end
end
return a
