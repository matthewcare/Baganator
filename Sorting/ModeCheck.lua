local _, addonTable = ...
local _, addonTable = ...

local always = {
  "quality",
  "type",
  "combine_stacks_only",
}
function addonTable.Sorting.IsModeAvailable(mode)
  return tIndexOf(always, mode) ~= nil or
    (mode == "expansion" and (ItemVersion or addonTable.Constants.IsRetail)) or
    addonTable.API.ExternalContainerSorts[mode]
end
