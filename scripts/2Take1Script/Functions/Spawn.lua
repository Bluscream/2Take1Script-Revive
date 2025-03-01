local a = {}
local function b(c)
    if c and not streaming.has_model_loaded(c) then
        streaming.request_model(c)
        local d = utils.time_ms() + 7500
        while not streaming.has_model_loaded(c) do
            system.wait(0)
            if d < utils.time_ms() then
                return false
            end
        end
    end
    return true
end
function a.Ped(c, e, f, g, h, i)
    if not c or not streaming.is_model_a_ped(c) then
        return
    end
    b(c)
    f = f or 26
    e = e or player.get_player_coords(player.player_id())
    g = g or 0.0
    h = h or true
    i = i or false
    local j = ped.create_ped(f, c, e, g, h, i)
    streaming.set_model_as_no_longer_needed(c)
    return j
end
function a.Vehicle(c, e, g, h, i)
    if not c or not streaming.is_model_a_vehicle(c) then
        return
    end
    b(c)
    e = e or v3()
    g = g or 0.0
    h = h or true
    i = i or false
    local k = vehicle.create_vehicle(c, e, g, h, i)
    streaming.set_model_as_no_longer_needed(c)
    return k
end
function a.Object(c, e, h, l)
    if not c or not streaming.is_model_an_object(c) then
        return
    end
    b(c)
    e = e or v3()
    h = h or true
    l = l or false
    local m = object.create_object(c, e, h, l)
    streaming.set_model_as_no_longer_needed(c)
    return m
end
function a.Worldobject(c, e, h, l)
    if not c or not streaming.is_model_a_world_object(c) then
        return
    end
    b(c)
    e = e or v3()
    h = h or true
    l = l or false
    local n = object.create_world_object(c, e, h, l)
    streaming.set_model_as_no_longer_needed(c)
    return n
end
return a
