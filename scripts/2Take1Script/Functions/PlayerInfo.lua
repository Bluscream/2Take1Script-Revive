local a = {}
function a.Name(b)
    if player.is_player_valid(b) then
        return player.get_player_name(b)
    else
        return "Invalid Player"
    end
end
function a.SCID(b)
    return player.get_player_scid(b)
end
function a.IP(b)
    if player.is_player_valid(b) then
        local c = player.get_player_ip(b)
        return string.format("%i.%i.%i.%i", c >> 24 & 0xff, c >> 16 & 0xff, c >> 8 & 0xff, c & 0xff)
    else
        return -1
    end
end
function a.HostToken(b)
    if player.is_player_valid(b) then
        return player.get_player_host_token(b)
    else
        return -1
    end
end
function a.HostPriority(b)
    if player.is_player_valid(b) then
        return player.get_player_host_priority(b)
    else
        return 31
    end
end
function a.Input(d, e, f, g)
    if not d then
        return nil
    end
    g = g or ""
    e = e or 64
    f = f or 0
    local h, i = input.get(d, g, e, f)
    while h == 1 do
        system.wait(0)
        h, i = input.get(d, g, e, f)
    end
    if h == 2 then
        return nil
    end
    return i
end
function a.GodmodeState(b, j)
    if not player.is_player_god(b) then
        return false
    end
    local k = player.get_player_ped(b)
    if interior.get_interior_from_entity(k) ~= 0 then
        return false
    end
    j = j or player.get_player_coords(b)
    if not (j.z > 0 or j.z == -50) then
        return false
    end
    local l = ped.get_vehicle_ped_is_using(k)
    if l ~= 0 then
        local m = entity.get_entity_model_hash(l)
        if m == 3040635986 or m == 4008920556 then
            return false
        end
    end
    return true
end
function a.VehicleGodmodeState(b, j)
    if not player.is_player_vehicle_god(b) then
        return false
    end
    local k = player.get_player_ped(b)
    if interior.get_interior_from_entity(k) ~= 0 then
        return false
    end
    j = j or player.get_player_coords(b)
    if not (j.z > 0 or j.z == -50) then
        return false
    end
    return true
end
function a.PlayerPed(b)
    return player.get_player_ped(b)
end
function a.PlayerVehicle(b)
    return ped.get_vehicle_ped_is_using(player.get_player_ped(b))
end
function a.PlayerHeading(b)
    return player.get_player_heading(b)
end
function a.PlayerCoords(b)
    return player.get_player_coords(b)
end
function a.OwnPed()
    return player.get_player_ped(player.player_id())
end
function a.OwnVehicle()
    return ped.get_vehicle_ped_is_using(player.get_player_ped(player.player_id()))
end
function a.OwnHeading()
    return player.get_player_heading(player.player_id())
end
function a.OwnCoords()
    return player.get_player_coords(player.player_id())
end
return a
