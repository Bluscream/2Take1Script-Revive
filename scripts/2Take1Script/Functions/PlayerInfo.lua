local L0_1, L1_1
L0_1 = {}
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = player
  L1_2 = L1_2.is_player_valid
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = player
    L1_2 = L1_2.get_player_name
    L2_2 = A0_2
    return L1_2(L2_2)
  else
    L1_2 = "Invalid Player"
    return L1_2
  end
end
L0_1.Name = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = player
  L1_2 = L1_2.get_player_scid
  L2_2 = A0_2
  return L1_2(L2_2)
end
L0_1.SCID = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = player
  L1_2 = L1_2.is_player_valid
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = player
    L1_2 = L1_2.get_player_ip
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = string
    L2_2 = L2_2.format
    L3_2 = "%i.%i.%i.%i"
    L4_2 = L1_2 >> 24
    L4_2 = L4_2 & 255
    L5_2 = L1_2 >> 16
    L5_2 = L5_2 & 255
    L6_2 = L1_2 >> 8
    L6_2 = L6_2 & 255
    L7_2 = L1_2 & 255
    return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  else
    L1_2 = -1
    return L1_2
  end
end
L0_1.IP = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = player
  L1_2 = L1_2.is_player_valid
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = player
    L1_2 = L1_2.get_player_host_token
    L2_2 = A0_2
    return L1_2(L2_2)
  else
    L1_2 = -1
    return L1_2
  end
end
L0_1.HostToken = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = player
  L1_2 = L1_2.is_player_valid
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 then
    L1_2 = player
    L1_2 = L1_2.get_player_host_priority
    L2_2 = A0_2
    return L1_2(L2_2)
  else
    L1_2 = 31
    return L1_2
  end
end
L0_1.HostPriority = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if not A0_2 then
    L4_2 = nil
    return L4_2
  end
  if not A3_2 then
    A3_2 = ""
  end
  if not A1_2 then
    A1_2 = 64
  end
  if not A2_2 then
    A2_2 = 0
  end
  L4_2 = input
  L4_2 = L4_2.get
  L5_2 = A0_2
  L6_2 = A3_2
  L7_2 = A1_2
  L8_2 = A2_2
  L4_2, L5_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  while 1 == L4_2 do
    L6_2 = system
    L6_2 = L6_2.wait
    L7_2 = 0
    L6_2(L7_2)
    L6_2 = input
    L6_2 = L6_2.get
    L7_2 = A0_2
    L8_2 = A3_2
    L9_2 = A1_2
    L10_2 = A2_2
    L6_2, L7_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L5_2 = L7_2
    L4_2 = L6_2
  end
  if 2 == L4_2 then
    L6_2 = nil
    return L6_2
  end
  return L5_2
end
L0_1.Input = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = player
  L2_2 = L2_2.is_player_god
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = player
  L2_2 = L2_2.get_player_ped
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = interior
  L3_2 = L3_2.get_interior_from_entity
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if 0 ~= L3_2 then
    L3_2 = false
    return L3_2
  end
  if not A1_2 then
    L3_2 = player
    L3_2 = L3_2.get_player_coords
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    A1_2 = L3_2
  end
  L3_2 = A1_2.z
  if not (L3_2 > 0) then
    L3_2 = A1_2.z
    if -50 ~= L3_2 then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = ped
  L3_2 = L3_2.get_vehicle_ped_is_using
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if 0 ~= L3_2 then
    L4_2 = entity
    L4_2 = L4_2.get_entity_model_hash
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    if 3040635986 == L4_2 or 4008920556 == L4_2 then
      L5_2 = false
      return L5_2
    end
  end
  L4_2 = true
  return L4_2
end
L0_1.GodmodeState = L1_1
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = player
  L2_2 = L2_2.is_player_vehicle_god
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    return L2_2
  end
  L2_2 = player
  L2_2 = L2_2.get_player_ped
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = interior
  L3_2 = L3_2.get_interior_from_entity
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  if 0 ~= L3_2 then
    L3_2 = false
    return L3_2
  end
  if not A1_2 then
    L3_2 = player
    L3_2 = L3_2.get_player_coords
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    A1_2 = L3_2
  end
  L3_2 = A1_2.z
  if not (L3_2 > 0) then
    L3_2 = A1_2.z
    if -50 ~= L3_2 then
      L3_2 = false
      return L3_2
    end
  end
  L3_2 = true
  return L3_2
end
L0_1.VehicleGodmodeState = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = player
  L1_2 = L1_2.get_player_ped
  L2_2 = A0_2
  return L1_2(L2_2)
end
L0_1.PlayerPed = L1_1
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = ped
  L1_2 = L1_2.get_vehicle_ped_is_using
  L2_2 = player
  L2_2 = L2_2.get_player_ped
  L3_2 = A0_2
  L2_2, L3_2 = L2_2(L3_2)
  return L1_2(L2_2, L3_2)
end
L0_1.PlayerVehicle = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = player
  L1_2 = L1_2.get_player_heading
  L2_2 = A0_2
  return L1_2(L2_2)
end
L0_1.PlayerHeading = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = player
  L1_2 = L1_2.get_player_coords
  L2_2 = A0_2
  return L1_2(L2_2)
end
L0_1.PlayerCoords = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = player
  L0_2 = L0_2.get_player_ped
  L1_2 = player
  L1_2 = L1_2.player_id
  L1_2 = L1_2()
  return L0_2(L1_2)
end
L0_1.OwnPed = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = ped
  L0_2 = L0_2.get_vehicle_ped_is_using
  L1_2 = player
  L1_2 = L1_2.get_player_ped
  L2_2 = player
  L2_2 = L2_2.player_id
  L2_2 = L2_2()
  L1_2, L2_2 = L1_2(L2_2)
  return L0_2(L1_2, L2_2)
end
L0_1.OwnVehicle = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = player
  L0_2 = L0_2.get_player_heading
  L1_2 = player
  L1_2 = L1_2.player_id
  L1_2 = L1_2()
  return L0_2(L1_2)
end
L0_1.OwnHeading = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = player
  L0_2 = L0_2.get_player_coords
  L1_2 = player
  L1_2 = L1_2.player_id
  L1_2 = L1_2()
  return L0_2(L1_2)
end
L0_1.OwnCoords = L1_1
return L0_1
