local L0_1, L1_1, L2_1
L0_1 = {}
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  if A0_2 then
    L1_2 = streaming
    L1_2 = L1_2.has_model_loaded
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = streaming
      L1_2 = L1_2.request_model
      L2_2 = A0_2
      L1_2(L2_2)
      L1_2 = utils
      L1_2 = L1_2.time_ms
      L1_2 = L1_2()
      L1_2 = L1_2 + 7500
      while true do
        L2_2 = streaming
        L2_2 = L2_2.has_model_loaded
        L3_2 = A0_2
        L2_2 = L2_2(L3_2)
        if L2_2 then
          break
        end
        L2_2 = system
        L2_2 = L2_2.wait
        L3_2 = 0
        L2_2(L3_2)
        L2_2 = utils
        L2_2 = L2_2.time_ms
        L2_2 = L2_2()
        if L1_2 < L2_2 then
          L2_2 = false
          return L2_2
        end
      end
    end
  end
  L1_2 = true
  return L1_2
end
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  if A0_2 then
    L6_2 = streaming
    L6_2 = L6_2.is_model_a_ped
    L7_2 = A0_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L6_2 = L1_1
  L7_2 = A0_2
  L6_2(L7_2)
  if not A2_2 then
    A2_2 = 26
  end
  if not A1_2 then
    L6_2 = player
    L6_2 = L6_2.get_player_coords
    L7_2 = player
    L7_2 = L7_2.player_id
    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2()
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    A1_2 = L6_2
  end
  if not A3_2 then
    A3_2 = 0.0
  end
  if not A4_2 then
    A4_2 = true
  end
  if not A5_2 then
    A5_2 = false
  end
  L6_2 = ped
  L6_2 = L6_2.create_ped
  L7_2 = A2_2
  L8_2 = A0_2
  L9_2 = A1_2
  L10_2 = A3_2
  L11_2 = A4_2
  L12_2 = A5_2
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
  L7_2 = streaming
  L7_2 = L7_2.set_model_as_no_longer_needed
  L8_2 = A0_2
  L7_2(L8_2)
  return L6_2
end
L0_1.Ped = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A0_2 then
    L5_2 = streaming
    L5_2 = L5_2.is_model_a_vehicle
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    if L5_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L5_2 = L1_1
  L6_2 = A0_2
  L5_2(L6_2)
  if not A1_2 then
    L5_2 = v3
    L5_2 = L5_2()
    A1_2 = L5_2
  end
  if not A2_2 then
    A2_2 = 0.0
  end
  if not A3_2 then
    A3_2 = true
  end
  if not A4_2 then
    A4_2 = false
  end
  L5_2 = vehicle
  L5_2 = L5_2.create_vehicle
  L6_2 = A0_2
  L7_2 = A1_2
  L8_2 = A2_2
  L9_2 = A3_2
  L10_2 = A4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L6_2 = streaming
  L6_2 = L6_2.set_model_as_no_longer_needed
  L7_2 = A0_2
  L6_2(L7_2)
  return L5_2
end
L0_1.Vehicle = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L4_2 = streaming
    L4_2 = L4_2.is_model_an_object
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L4_2 = L1_1
  L5_2 = A0_2
  L4_2(L5_2)
  if not A1_2 then
    L4_2 = v3
    L4_2 = L4_2()
    A1_2 = L4_2
  end
  if not A2_2 then
    A2_2 = true
  end
  if not A3_2 then
    A3_2 = false
  end
  L4_2 = object
  L4_2 = L4_2.create_object
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = streaming
  L5_2 = L5_2.set_model_as_no_longer_needed
  L6_2 = A0_2
  L5_2(L6_2)
  return L4_2
end
L0_1.Object = L2_1
function L2_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2
  if A0_2 then
    L4_2 = streaming
    L4_2 = L4_2.is_model_a_world_object
    L5_2 = A0_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L4_2 = L1_1
  L5_2 = A0_2
  L4_2(L5_2)
  if not A1_2 then
    L4_2 = v3
    L4_2 = L4_2()
    A1_2 = L4_2
  end
  if not A2_2 then
    A2_2 = true
  end
  if not A3_2 then
    A3_2 = false
  end
  L4_2 = object
  L4_2 = L4_2.create_world_object
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L8_2 = A3_2
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L5_2 = streaming
  L5_2 = L5_2.set_model_as_no_longer_needed
  L6_2 = A0_2
  L5_2(L6_2)
  return L4_2
end
L0_1.Worldobject = L2_1
return L0_1
