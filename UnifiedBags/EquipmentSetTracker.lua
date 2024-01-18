BaganatorEquipmentSetTrackerMixin = {}

function BaganatorEquipmentSetTrackerMixin:OnLoad()
  FrameUtil.RegisterFrameForEvents(self, {
    "BANKFRAME_OPENED",
    "EQUIPMENT_SETS_CHANGED",
    "PLAYER_LOGIN",
  })
  self.equipmentSetInfo = {}
end

function BaganatorEquipmentSetTrackerMixin:QueueScan()
  self:SetScript("OnUpdate", self.OnUpdate)
end

function BaganatorEquipmentSetTrackerMixin:OnEvent()
  self:QueueScan()
end

function BaganatorEquipmentSetTrackerMixin:OnUpdate()
  self:SetScript("OnUpdate", nil)
  self:ScanEquipmentSets()
end

-- Determine the GUID of all accessible items in an equipment set
function BaganatorEquipmentSetTrackerMixin:ScanEquipmentSets()
  if IsMacClient() and not Baganator.Constants.IsRetail then
    -- May crash on Macs when 19 slots in use, so turn the feature off
    return
  end

  if not Baganator.Config.Get(Baganator.Config.Options.ENABLE_EQUIPMENT_SET_INFO) then
    return
  end

  local start = debugprofilestop()

  local oldSetInfo = CopyTable(self.equipmentSetInfo)

  local cache = {}
  for _, setID in ipairs(C_EquipmentSet.GetEquipmentSetIDs()) do
    local name, iconTexture = C_EquipmentSet.GetEquipmentSetInfo(setID)
    local info = {name = name, iconTexture = iconTexture, setID = setID}
    -- Uses or {} because a set might exist without any associated item
    -- locations
    for _, location in pairs(C_EquipmentSet.GetItemLocations(setID) or {}) do
      if location ~= -1 and location ~= 0 and location ~= 1 then
        local player, bank, bags, voidStorage, slot, bag
        if Baganator.Constants.IsClassic then
          player, bank, bags, slot, bag = EquipmentManager_UnpackLocation(location)
        else
          player, bank, bags, voidStorage, slot, bag = EquipmentManager_UnpackLocation(location)
        end
        local location, bagID, slotID
        if (player or bank) and bags then
          bagID = bag
          slotID = slot
          location = ItemLocation:CreateFromBagAndSlot(bagID, slotID)
        elseif bank and not bags then
          bagID = Baganator.Constants.AllBankIndexes[1]
          slotID = slot - BankButtonIDToInvSlotID(0)
          location = ItemLocation:CreateFromBagAndSlot(bagID, slotID)
        elseif player then
          location = ItemLocation:CreateFromEquipmentSlot(slot)
        end
        if location then
          local guid = C_Item.GetItemGUID(location)
          if not cache[guid] then
            cache[guid] = {}
          end
          table.insert(cache[guid], info)
        end
      end
    end
  end
  if Baganator.Config.Get(Baganator.Config.Options.DEBUG_TIMERS) then
    print("equipment set tracking took", debugprofilestop() - start)
  end
  if not tCompare(oldSetInfo, cache, 15) then
    self.equipmentSetInfo = cache
    Baganator.API.RequestItemButtonsRefresh()
  end
end

function BaganatorEquipmentSetTrackerMixin:Get(location)
  local guid = C_Item.DoesItemExist(location) and C_Item.GetItemGUID(location)

  return self.equipmentSetInfo[guid]
end
