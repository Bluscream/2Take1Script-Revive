local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = require
L1_1 = "2Take1Script.Functions.Utils"
L0_1 = L0_1(L1_1)
L1_1 = require
L2_1 = "2Take1Script.Functions.Math"
L1_1 = L1_1(L2_1)
L2_1 = require
L3_1 = "2Take1Script.Data.ScriptEvents"
L2_1 = L2_1(L3_1)
L3_1 = {}
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = A0_2[1]
  L2_2 = A0_2[2]
  L3_2 = A0_2[3]
  L4_2 = entity
  L4_2 = L4_2.get_entity_coords
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L5_2 = player
  L5_2 = L5_2.get_player_coords
  L6_2 = player
  L6_2 = L6_2.player_id
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
  L7_2 = L5_2
  L6_2 = L5_2.magnitude
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  if L2_2 > L6_2 then
    if 0 == L3_2 then
      L7_2 = entity
      L7_2 = L7_2.is_entity_dead
      L8_2 = L1_2
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = ped
        L7_2 = L7_2.get_vehicle_ped_is_using
        L8_2 = L1_2
        L7_2 = L7_2(L8_2)
        if 0 ~= L7_2 then
          L7_2 = ped
          L7_2 = L7_2.clear_ped_tasks_immediately
          L8_2 = L1_2
          L7_2(L8_2)
        end
        L7_2 = entity
        L7_2 = L7_2.get_entity_coords
        L8_2 = L1_2
        L7_2 = L7_2(L8_2)
        L8_2 = gameplay
        L8_2 = L8_2.shoot_single_bullet_between_coords
        L9_2 = v3
        L10_2 = 0
        L11_2 = 0
        L12_2 = 1
        L9_2 = L9_2(L10_2, L11_2, L12_2)
        L9_2 = L7_2 + L9_2
        L10_2 = L7_2
        L11_2 = 1000
        L12_2 = 205991906
        L13_2 = player
        L13_2 = L13_2.get_player_ped
        L14_2 = player
        L14_2 = L14_2.player_id
        L14_2, L15_2, L16_2 = L14_2()
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        L14_2 = false
        L15_2 = true
        L16_2 = 1000
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
    end
    elseif 1 == L3_2 then
      L7_2 = entity
      L7_2 = L7_2.is_entity_dead
      L8_2 = L1_2
      L7_2 = L7_2(L8_2)
      if not L7_2 then
        L7_2 = fire
        L7_2 = L7_2.add_explosion
        L8_2 = L4_2
        L9_2 = 5
        L10_2 = true
        L11_2 = false
        L12_2 = 0
        L13_2 = 0
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      end
    end
  end
end
L3_1.Killaura = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2[1]
  L2_2 = A0_2[2]
  L3_2 = A0_2[3]
  L4_2 = entity
  L4_2 = L4_2.get_entity_coords
  L5_2 = L1_2
  L4_2 = L4_2(L5_2)
  L5_2 = player
  L5_2 = L5_2.get_player_coords
  L6_2 = player
  L6_2 = L6_2.player_id
  L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L7_2 = L5_2
  L6_2 = L5_2.magnitude
  L8_2 = L4_2
  L6_2 = L6_2(L7_2, L8_2)
  if L2_2 > L6_2 then
    L7_2 = L4_2 - L5_2
    L8_2 = L3_2 / L6_2
    L7_2 = L7_2 * L8_2
    L8_2 = L0_1.request_ctrl
    L9_2 = L1_2
    L10_2 = 100
    L8_2(L9_2, L10_2)
    L8_2 = entity
    L8_2 = L8_2.set_entity_velocity
    L9_2 = L1_2
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
end
L3_1.Forcefield = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2[1]
  L2_2 = A0_2[2]
  while true do
    L3_2 = entity
    L3_2 = L3_2.is_an_entity
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      break
    end
    L3_2 = player
    L3_2 = L3_2.is_player_valid
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      break
    end
    L3_2 = player
    L3_2 = L3_2.get_player_ped
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = ai
    L4_2 = L4_2.task_combat_ped
    L5_2 = L1_2
    L6_2 = L3_2
    L7_2 = 0
    L8_2 = 16
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = ped
    L4_2 = L4_2.get_ped_last_weapon_impact
    L5_2 = L1_2
    L4_2, L5_2 = L4_2(L5_2)
    if L4_2 then
      L7_2 = L5_2
      L6_2 = L5_2.magnitude
      L8_2 = player
      L8_2 = L8_2.get_player_coords
      L9_2 = L2_2
      L8_2, L9_2, L10_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
      if L6_2 > 2 then
        L6_2 = ped
        L6_2 = L6_2.clear_ped_tasks_immediately
        L7_2 = L1_2
        L6_2(L7_2)
        L6_2 = ai
        L6_2 = L6_2.task_combat_ped
        L7_2 = L1_2
        L8_2 = L3_2
        L9_2 = 0
        L10_2 = 16
        L6_2(L7_2, L8_2, L9_2, L10_2)
      end
    end
    L6_2 = coroutine
    L6_2 = L6_2.yield
    L7_2 = 1000
    L6_2(L7_2)
  end
end
L3_1.Assassins = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = 0
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = ped
    L6_2 = L6_2.is_ped_a_player
    L7_2 = A0_2[L5_2]
    L6_2 = L6_2(L7_2)
    if not L6_2 then
      L6_2 = entity
      L6_2 = L6_2.get_entity_coords
      L7_2 = A0_2[L5_2]
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.magnitude
      L8_2 = player
      L8_2 = L8_2.get_player_coords
      L9_2 = player
      L9_2 = L9_2.player_id
      L9_2 = L9_2()
      L8_2, L9_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L7_2 = 1000
      if L6_2 < L7_2 then
        L6_2 = L0_1.clear
        L7_2 = A0_2[L5_2]
        L6_2(L7_2)
        L1_2 = L1_2 + 1
      end
    end
    if 20 == L1_2 then
      L1_2 = 0
      L6_2 = coroutine
      L6_2 = L6_2.yield
      L7_2 = 0
      L6_2(L7_2)
    end
  end
end
L3_1.Clearpeds = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  L2_2 = 0
  L3_2 = 0
  L4_2 = 31
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L2_1.GetPersonalVehicle
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if 0 ~= L7_2 then
      L8_2 = #L1_2
      L8_2 = L8_2 + 1
      L1_2[L8_2] = L7_2
    end
  end
  L3_2 = 1
  L4_2 = #A0_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = nil
    L8_2 = 1
    L9_2 = #L1_2
    L10_2 = 1
    for L11_2 = L8_2, L9_2, L10_2 do
      L12_2 = A0_2[L6_2]
      L13_2 = L1_2[L11_2]
      if L12_2 == L13_2 then
        L7_2 = true
      end
    end
    if not L7_2 then
      L8_2 = ped
      L8_2 = L8_2.is_ped_a_player
      L9_2 = vehicle
      L9_2 = L9_2.get_ped_in_vehicle_seat
      L10_2 = A0_2[L6_2]
      L11_2 = -1
      L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2, L11_2)
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      if not L8_2 then
        L8_2 = entity
        L8_2 = L8_2.get_entity_coords
        L9_2 = A0_2[L6_2]
        L8_2 = L8_2(L9_2)
        L9_2 = L8_2
        L8_2 = L8_2.magnitude
        L10_2 = player
        L10_2 = L10_2.get_player_coords
        L11_2 = player
        L11_2 = L11_2.player_id
        L11_2, L12_2, L13_2 = L11_2()
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2, L12_2, L13_2)
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
        L9_2 = 1000
        if L8_2 < L9_2 then
          L8_2 = L0_1.clear
          L9_2 = A0_2[L6_2]
          L8_2(L9_2)
          L2_2 = L2_2 + 1
        end
      end
    end
    if 20 == L2_2 then
      L2_2 = 0
      L8_2 = coroutine
      L8_2 = L8_2.yield
      L9_2 = 0
      L8_2(L9_2)
    end
  end
end
L3_1.Clearvehicles = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = 0
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = entity
    L6_2 = L6_2.get_entity_coords
    L7_2 = A0_2[L5_2]
    L6_2 = L6_2(L7_2)
    L7_2 = L6_2
    L6_2 = L6_2.magnitude
    L8_2 = player
    L8_2 = L8_2.get_player_coords
    L9_2 = player
    L9_2 = L9_2.player_id
    L9_2 = L9_2()
    L8_2, L9_2 = L8_2(L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = 1000
    if L6_2 < L7_2 then
      L6_2 = L0_1.clear
      L7_2 = A0_2[L5_2]
      L6_2(L7_2)
      L1_2 = L1_2 + 1
    end
    if 20 == L1_2 then
      L1_2 = 0
      L6_2 = coroutine
      L6_2 = L6_2.yield
      L7_2 = 0
      L6_2(L7_2)
    end
  end
end
L3_1.Clearobjects = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2[1]
  L2_2 = A0_2[2]
  L3_2 = 1
  L4_2 = #L1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = entity
    L7_2 = L7_2.set_entity_no_collsion_entity
    L8_2 = L1_2[L6_2]
    L9_2 = L2_2
    L10_2 = true
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = entity
    L7_2 = L7_2.set_entity_no_collsion_entity
    L8_2 = L2_2
    L9_2 = L1_2[L6_2]
    L10_2 = true
    L7_2(L8_2, L9_2, L10_2)
  end
end
L3_1.Vehiclecollision = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = A0_2[1]
  L2_2 = A0_2[2]
  L3_2 = 1
  L4_2 = #L1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = entity
    L7_2 = L7_2.set_entity_no_collsion_entity
    L8_2 = L1_2[L6_2]
    L9_2 = L2_2
    L10_2 = true
    L7_2(L8_2, L9_2, L10_2)
    L7_2 = entity
    L7_2 = L7_2.set_entity_no_collsion_entity
    L8_2 = L2_2
    L9_2 = L1_2[L6_2]
    L10_2 = true
    L7_2(L8_2, L9_2, L10_2)
  end
end
L3_1.Objectcollision = L4_1
function L4_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = entity
  L1_2 = L1_2.get_entity_speed
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  L2_2 = L0_1.request_ctrl
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = entity
  L2_2 = L2_2.freeze_entity
  L3_2 = A0_2
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = L0_1.MaxVehicle
  L3_2 = A0_2
  L2_2(L3_2)
  L2_2 = entity
  L2_2 = L2_2.freeze_entity
  L3_2 = A0_2
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = vehicle
  L2_2 = L2_2.set_vehicle_forward_speed
  L3_2 = A0_2
  L4_2 = L1_2
  L2_2(L3_2, L4_2)
end
L3_1.Upgradevehicles = L4_1
return L3_1
