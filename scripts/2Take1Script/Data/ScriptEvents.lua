local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L0_1["Netbail Kick"] = 1228916411
L0_1["Script Host Curse 1"] = 2181944292
L0_1["Script Host Curse 2"] = 704979198
L0_1["Script Host Curse 3"] = 3508421195
L0_1["Passive Mode"] = 1114091621
L0_1["CEO Kick"] = 248967238
L0_1["CEO Ban"] = 3530443265
L0_1["CEO Money"] = 1890277845
L0_1["Force To Mission"] = 2020588206
L0_1["Force To Mission 2"] = 2769806280
L0_1["Start CEO Mission"] = 522189882
L0_1["Start Warehouse Mission"] = 3351553601
L0_1["Force To Island"] = 3673688108
L0_1["Force To Island 2"] = 1463943751
L0_1["Casino Cutscene"] = 1068259786
L0_1["Transaction Error"] = 2590825784
L0_1["Camera Manipulation"] = 801199324
L0_1["Off The Radar"] = 3903333536
L0_1["Bribe Authorities"] = 1722873242
L0_1["Insurance Notification"] = 802133775
L0_1.Notification = 677240627
L0_1["Typing Begin"] = 747270864
L0_1["Typing Stop"] = 3304008971
L0_1["Fake Invite"] = 1132878564
L0_1["Fake Invite 2"] = 2619207576
L0_1["Fake Invite 3"] = 922450413
L0_1["Apartment Invite"] = 603406648
L0_1["Warehouse Invite"] = 3848692214
L0_1["Vehicle Kick"] = 578856274
L0_1["Vehicle EMP"] = 2252039316
L0_1["Destroy Personal Vehicle"] = 3268179810
L0_1.SMS = 1903866949
L0_1.Bounty = 1294995624
L0_1["Remove Wanted"] = 4203613266
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = script
  L1_2 = L1_2.get_global_i
  L2_2 = A0_2 * 599
  L2_2 = 1 + L2_2
  L2_2 = L2_2 + 510
  L2_2 = 1893551 + L2_2
  return L1_2(L2_2)
end
L0_1.MainGlobal = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = script
  L1_2 = L1_2.get_global_i
  L2_2 = A0_2 * 599
  L2_2 = 1 + L2_2
  L2_2 = 1893551 + L2_2
  L2_2 = L2_2 + 10
  return L1_2(L2_2)
end
L0_1.CEOID = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = script
  L1_2 = L1_2.get_global_i
  L2_2 = A0_2 * 599
  L2_2 = 1 + L2_2
  L2_2 = 1893551 + L2_2
  L2_2 = L2_2 + 10
  L1_2 = L1_2(L2_2)
  L2_2 = -1 ~= L1_2 and L1_2 ~= A0_2
  return L2_2
end
L0_1.IsPlayerAssociate = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = script
  L1_2 = L1_2.get_global_i
  L2_2 = A0_2 * 451
  L2_2 = 1 + L2_2
  L2_2 = 2689224 + L2_2
  L2_2 = L2_2 + 207
  L1_2 = L1_2(L2_2)
  L1_2 = 1 == L1_2
  return L1_2
end
L0_1.IsPlayerOTR = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = script
  L1_2 = L1_2.get_global_i
  L2_2 = A0_2 * 4
  L2_2 = 1 + L2_2
  L2_2 = 1835502 + L2_2
  L2_2 = L2_2 + 3
  L1_2 = L1_2(L2_2)
  L1_2 = 1 == L1_2
  return L1_2
end
L0_1.DoesPlayerHaveBounty = L1_1
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = script
  L1_2 = L1_2.get_global_i
  L2_2 = 173 + A0_2
  L2_2 = L2_2 + 1
  L2_2 = 2703660 + L2_2
  return L1_2(L2_2)
end
L0_1.GetPersonalVehicle = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = script
  L0_2 = L0_2.get_global_i
  L1_2 = 1921048
  L0_2 = L0_2(L1_2)
  L1_2 = script
  L1_2 = L1_2.get_global_i
  L2_2 = 1921046
  L1_2, L2_2 = L1_2(L2_2)
  return L0_2, L1_2, L2_2
end
L0_1.GlobalPair = L1_1
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  if A2_2 then
    L3_2 = player
    L3_2 = L3_2.is_player_valid
    L4_2 = A2_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L3_2 = tonumber
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = L0_1
    L3_2 = L3_2[A0_2]
    if L3_2 then
      L3_2 = L0_1
      A0_2 = L3_2[A0_2]
    else
      return
    end
  end
  L3_2 = script
  L3_2 = L3_2.trigger_script_event
  L4_2 = A0_2
  L5_2 = A2_2
  L6_2 = A1_2
  L3_2(L4_2, L5_2, L6_2)
end
L0_1.Send = L1_1
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = {}
  L5_2 = A0_2
  L4_2[1] = L5_2
  if not A1_2 or 0 == A1_2 then
    return L4_2
  end
  if not A2_2 then
    A2_2 = -2147483647
  end
  if not A3_2 then
    A3_2 = 2147483647
  end
  L5_2 = 1
  L6_2 = A1_2
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = #L4_2
    L9_2 = L9_2 + 1
    L10_2 = math
    L10_2 = L10_2.random
    L11_2 = A2_2
    L12_2 = A3_2
    L10_2 = L10_2(L11_2, L12_2)
    L4_2[L9_2] = L10_2
  end
  return L4_2
end
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = #A0_2
  L2_2 = 2
  L3_2 = -1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = math
    L5_2 = L5_2.random
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    L6_2 = A0_2[L5_2]
    L7_2 = A0_2[L4_2]
    A0_2[L5_2] = L7_2
    A0_2[L4_2] = L6_2
  end
  return A0_2
end
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2
  if A0_2 then
    L2_2 = player
    L2_2 = L2_2.is_player_valid
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  if A1_2 then
    L2_2 = L2_1
    L3_2 = {}
    L4_2 = 2407225625
    L5_2 = 3281287455
    L6_2 = 2002459655
    L7_2 = 2209933365
    L8_2 = 4067167151
    L9_2 = 2677523243
    L10_2 = 3725345460
    L11_2 = 2209114296
    L12_2 = 2422874682
    L13_2 = 3977648925
    L14_2 = 4149660572
    L15_2 = 3713929399
    L16_2 = 1514515570
    L17_2 = 69874647
    L18_2 = 990606644
    L19_2 = 927169576
    L20_2 = 2986127162
    L21_2 = 911179316
    L22_2 = 4004748372
    L23_2 = 1902624891
    L24_2 = 3926543916
    L25_2 = 3680509669
    L26_2 = 2303649432
    L27_2 = 4229380245
    L28_2 = 150518680
    L29_2 = 2527908960
    L30_2 = 1445703181
    L31_2 = 1116398805
    L32_2 = 436475575
    L33_2 = 2512524600
    L34_2 = 2324841334
    L35_2 = 1757755807
    L36_2 = 603406648
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L3_2[4] = L7_2
    L3_2[5] = L8_2
    L3_2[6] = L9_2
    L3_2[7] = L10_2
    L3_2[8] = L11_2
    L3_2[9] = L12_2
    L3_2[10] = L13_2
    L3_2[11] = L14_2
    L3_2[12] = L15_2
    L3_2[13] = L16_2
    L3_2[14] = L17_2
    L3_2[15] = L18_2
    L3_2[16] = L19_2
    L3_2[17] = L20_2
    L3_2[18] = L21_2
    L3_2[19] = L22_2
    L3_2[20] = L23_2
    L3_2[21] = L24_2
    L3_2[22] = L25_2
    L3_2[23] = L26_2
    L3_2[24] = L27_2
    L3_2[25] = L28_2
    L3_2[26] = L29_2
    L3_2[27] = L30_2
    L3_2[28] = L31_2
    L3_2[29] = L32_2
    L3_2[30] = L33_2
    L3_2[31] = L34_2
    L3_2[32] = L35_2
    L3_2[33] = L36_2
    L2_2 = L2_2(L3_2)
    L3_2 = 1
    L4_2 = #L2_2
    L5_2 = 1
    for L6_2 = L3_2, L4_2, L5_2 do
      L7_2 = script
      L7_2 = L7_2.trigger_script_event
      L8_2 = L2_2[L6_2]
      L9_2 = A0_2
      L10_2 = L1_1
      L11_2 = player
      L11_2 = L11_2.player_id
      L11_2 = L11_2()
      L12_2 = 25
      L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2 = L10_2(L11_2, L12_2)
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2)
    end
    return
  end
  L2_2 = script
  L2_2 = L2_2.get_host_of_this_script
  L2_2 = L2_2()
  if L2_2 == A0_2 then
    L2_2 = script
    L2_2 = L2_2.trigger_script_event
    L3_2 = L0_1["Start CEO Mission"]
    L4_2 = A0_2
    L5_2 = {}
    L6_2 = player
    L6_2 = L6_2.player_id
    L6_2 = L6_2()
    L7_2 = 0
    L8_2 = 4294967295
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L2_2(L3_2, L4_2, L5_2)
  end
  L2_2 = script
  L2_2 = L2_2.trigger_script_event
  L3_2 = L0_1["Netbail Kick"]
  L4_2 = A0_2
  L5_2 = {}
  L6_2 = player
  L6_2 = L6_2.player_id
  L6_2 = L6_2()
  L7_2 = L0_1.MainGlobal
  L8_2 = A0_2
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2, L36_2 = L7_2(L8_2)
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L5_2[4] = L9_2
  L5_2[5] = L10_2
  L5_2[6] = L11_2
  L5_2[7] = L12_2
  L5_2[8] = L13_2
  L5_2[9] = L14_2
  L5_2[10] = L15_2
  L5_2[11] = L16_2
  L5_2[12] = L17_2
  L5_2[13] = L18_2
  L5_2[14] = L19_2
  L5_2[15] = L20_2
  L5_2[16] = L21_2
  L5_2[17] = L22_2
  L5_2[18] = L23_2
  L5_2[19] = L24_2
  L5_2[20] = L25_2
  L5_2[21] = L26_2
  L5_2[22] = L27_2
  L5_2[23] = L28_2
  L5_2[24] = L29_2
  L5_2[25] = L30_2
  L5_2[26] = L31_2
  L5_2[27] = L32_2
  L5_2[28] = L33_2
  L5_2[29] = L34_2
  L5_2[30] = L35_2
  L5_2[31] = L36_2
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = L1_1
  L3_2 = player
  L3_2 = L3_2.player_id
  L3_2 = L3_2()
  L4_2 = 25
  L2_2 = L2_2(L3_2, L4_2)
  L2_2[5] = 115
  L3_2 = script
  L3_2 = L3_2.trigger_script_event
  L4_2 = L0_1["Apartment Invite"]
  L5_2 = A0_2
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
L0_1.kick = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  if A0_2 then
    L1_2 = player
    L1_2 = L1_2.is_player_valid
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      goto lbl_10
    end
  end
  do return end
  ::lbl_10::
  L1_2 = L2_1
  L2_2 = {}
  L3_2 = 2908956942
  L4_2 = 962740265
  L5_2 = 3901672776
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L2_2[3] = L5_2
  L1_2 = L1_2(L2_2)
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = script
    L6_2 = L6_2.trigger_script_event
    L7_2 = L1_2[L5_2]
    L8_2 = A0_2
    L9_2 = L1_1
    L10_2 = player
    L10_2 = L10_2.player_id
    L10_2 = L10_2()
    L11_2 = 25
    L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)
    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
  end
end
L0_1.crash = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = script
  L1_2 = L1_2.get_host_of_this_script
  L1_2 = L1_2()
  L2_2 = player
  L2_2 = L2_2.player_id
  L2_2 = L2_2()
  if L1_2 == L2_2 then
    return
  end
  L2_2 = player
  L2_2 = L2_2.is_player_valid
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = script
    L2_2 = L2_2.trigger_script_event
    L3_2 = "Script Host Curse "
    L4_2 = A0_2
    L3_2 = L3_2 .. L4_2
    if not L3_2 then
      L3_2 = 1
    end
    L4_2 = L0_1
    L3_2 = L4_2[L3_2]
    L4_2 = L1_2
    L5_2 = L1_1
    L6_2 = player
    L6_2 = L6_2.player_id
    L6_2 = L6_2()
    L7_2 = 25
    L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end
L0_1.curse = L3_1
return L0_1
