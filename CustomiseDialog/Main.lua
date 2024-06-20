local _, addonTable = ...

local IsRetailCheck = function()
  return Baganator.Constants.IsRetail
end

local NotIsEraCheck = function()
  return not Baganator.Constants.IsEra
end

local GENERAL_OPTIONS = {
  {
    type = "dropdown",
    text = BAGANATOR_L_VIEW_TYPE,
    option = "view_type",
    entries = {
      BAGANATOR_L_SINGLE_BAG,
      BAGANATOR_L_CATEGORY_GROUPS,
    },
    values = {
      "single",
      "category",
    }
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_LOCK_WINDOWS,
    option = "lock_frames",
  },
  { type = "spacing" },
  {
    type = "checkbox",
    text = BAGANATOR_L_USE_BACKPACK_VIEW,
    rightText = BAGANATOR_L_BRACKETS_RELOAD_REQUIRED,
    option = "enable_backpack_view",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_USE_BANK_VIEW,
    rightText = BAGANATOR_L_BRACKETS_RELOAD_REQUIRED,
    option = "enable_bank_view",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_USE_GUILD_VIEW,
    rightText = BAGANATOR_L_BRACKETS_RELOAD_REQUIRED,
    option = "enable_guild_view",
    check = NotIsEraCheck,
  },
  { type = "spacing" },
}

local LAYOUT_OPTIONS = {
  {
    type = "dropdown",
    text = BAGANATOR_L_SHOW_BUTTONS,
    option = "show_buttons_on_alt",
    entries = {
      BAGANATOR_L_ALWAYS,
      BAGANATOR_L_WHEN_HOLDING_ALT,
    },
    values = {
      false,
      true,
    }
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_SHOW_SORT_BUTTON,
    option = "show_sort_button_2",
  },
  { type = "spacing" },
  {
    type = "slider",
    min = 1,
    max = 24,
    lowText = "1",
    highText = "24",
    valuePattern = BAGANATOR_L_X_BAG_COLUMNS,
    option = "bag_view_width",
  },
  {
    type = "slider",
    min = 1,
    max = 42,
    lowText = "1",
    highText = "42",
    valuePattern = BAGANATOR_L_X_BANK_COLUMNS,
    option = "bank_view_width",
  },
  {
    type = "slider",
    min = 1,
    max = 42,
    lowText = "1",
    highText = "42",
    valuePattern = BAGANATOR_L_X_WARBAND_BANK_COLUMNS,
    option = "warband_bank_view_width",
    check = function() return Syndicator.Constants.WarbandBankActive end,
  },
  {
    type = "slider",
    min = 1,
    max = 42,
    lowText = "1",
    highText = "42",
    valuePattern = BAGANATOR_L_X_GUILD_COLUMNS,
    option = "guild_view_width",
    check = NotIsEraCheck,
  },
  { type = "spacing" },
  {
    type = "dropdown",
    text = BAGANATOR_L_BLANK_SPACE,
    option = "bag_empty_space_at_top",
    entries = {
      BAGANATOR_L_AT_THE_BOTTOM,
      BAGANATOR_L_AT_THE_TOP,
    },
    values = {
      false,
      true,
    }
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_RECENT_CHARACTER_TABS,
    option = "show_recents_tabs_main_view",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_REDUCE_UI_SPACING,
    option = "reduce_spacing",
  },
}

local THEME_OPTIONS = {
  {
    type = "slider",
    min = 1,
    max = 100,
    lowText = "0%",
    highText = "100%",
    scale = 100,
    valuePattern = BAGANATOR_L_X_TRANSPARENCY,
    option = "view_alpha",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_REMOVE_BORDERS,
    option = "no_frame_borders",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_HIDE_ICON_BACKGROUNDS,
    option = "empty_slot_background",
  },
}

local ICON_OPTIONS = {
  {
    type = "checkbox",
    text = BAGANATOR_L_ITEM_QUALITY_TEXT_COLORS,
    option = "icon_text_quality_colors",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_GREY_JUNK_ITEMS,
    option = "icon_grey_junk",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_FLASH_DUPLICATE_ITEMS,
    rightText = BAGANATOR_L_ALT_CLICK,
    option = "icon_flash_similar_alt",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_HIDE_BOE_STATUS_ON_COMMON_2,
    option = "hide_boe_on_common",
  },
  { type = "spacing" },
  {
    type = "slider",
    min = 10,
    max = 70,
    lowText = "10",
    highText = "70",
    valuePattern = BAGANATOR_L_X_ICON_SIZE,
    option = "bag_icon_size",
  },
  {
    type = "slider",
    min = 5,
    max = 40,
    lowText = "5",
    highText = "40",
    valuePattern = BAGANATOR_L_X_ICON_TEXT_FONT_SIZE,
    option = "icon_text_font_size",
  },
  { type = "spacing" },
  {
    type = "header",
    text = BAGANATOR_L_ICON_CORNER_PRIORITIES,
    level = 2,
  },
}
local OPEN_CLOSE_OPTIONS = {
  {
    type = "checkbox",
    text = BAGANATOR_L_BANK,
    option = "bank",
    root = "auto_open",
  },
  {
    type = "checkbox",
    text = GUILD_BANK,
    option = "guild_bank",
    root = "auto_open",
    check = NotIsEraCheck,
  },
  {
    type = "checkbox",
    text = TRADE,
    option = "trade_partner",
    root = "auto_open",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_CRAFTING_WINDOW,
    option = "tradeskill",
    root = "auto_open",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_AUCTION_HOUSE,
    option = "auction_house",
    root = "auto_open",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_VOID_STORAGE,
    option = "void_storage",
    root = "auto_open",
    check = IsRetailCheck,
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_MAIL,
    option = "mail",
    root = "auto_open",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_VENDOR,
    option = "merchant",
    root = "auto_open",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_SOCKET_INTERFACE,
    option = "sockets",
    root = "auto_open",
    check = NotIsEraCheck,
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_SCRAPPING_MACHINE,
    option = "scrapping_machine",
    root = "auto_open",
    check = IsRetailCheck,
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_FORGE_OF_BONDS,
    option = "forge_of_bonds",
    root = "auto_open",
    check = IsRetailCheck,
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_CHARACTER_PANEL,
    option = "character_panel",
    root = "auto_open",
  },
}
local SORTING_OPTIONS = {
  {
    type = "checkbox",
    text = BAGANATOR_L_SORT_ON_OPEN,
    option = "auto_sort_on_open",
  },
  { type = "spacing" },
  {
    type = "checkbox",
    text = BAGANATOR_L_REVERSE_GROUPS_SORT_ORDER,
    option = "reverse_groups_sort_order",
  },
  { type = "spacing" },
  {
    type = "dropdown",
    text = BAGANATOR_L_ARRANGE_ITEMS,
    option = "sort_start_at_bottom",
    entries = {
      BAGANATOR_L_FROM_THE_TOP,
      BAGANATOR_L_FROM_THE_BOTTOM,
    },
    values = {
      false,
      true,
    }
  },
  { type = "spacing" },
  {
    type = "dropdown",
    text = BAGANATOR_L_IGNORED_SLOTS,
    option = "sort_ignore_slots_at_end",
    entries = {
      BAGANATOR_L_FROM_THE_TOP,
      BAGANATOR_L_FROM_THE_BOTTOM,
    },
    values = {
      false,
      true,
    }
  },
  {
    type = "slider",
    min = 0,
    max = 128,
    lowText = "0",
    highText = "128",
    valuePattern = BAGANATOR_L_X_BAG_SLOTS_TO_IGNORE_WHEN_SORTING_CHARACTER_SPECIFIC,
    option = "sort_ignore_slots_count_2",
  },
  {
    type = "slider",
    min = 0,
    max = 500,
    lowText = "0",
    highText = "500",
    valuePattern = BAGANATOR_L_X_BANK_SLOTS_TO_IGNORE_WHEN_SORTING_CHARACTER_SPECIFIC,
    option = "sort_ignore_bank_slots_count",
  },
}

local CATEGORIES_OPTIONS = {
  {
    type = "slider",
    min = 0,
    max = 200,
    scale = 100,
    lowText = "0%",
    highText = "200%",
    valuePattern = BAGANATOR_L_X_PERCENT_ITEM_BUTTONS_SPACING_BETWEEN_CATEGORIES,
    option = "category_horizontal_spacing",
  },
  {
    type = "checkbox",
    text = BAGANATOR_L_GROUP_IDENTICAL_ITEMS,
    option = "category_item_grouping",
  },
}

table.sort(OPEN_CLOSE_OPTIONS, function(a, b)
  return a.text < b.text
end)

local function GenerateFrames(options, parent)
  local lastFrame = nil
  local allFrames = {}
  local offsetY = 0
  for _, option in ipairs(options) do
    if not option.check or option.check() then
      local frame
      if option.type == "checkbox" then
        frame = CreateFrame("Frame", nil, parent, "BaganatorCheckBoxTemplate")
        frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, offsetY)
        frame:SetPoint("LEFT", parent, 40, 0)
        frame:SetPoint("RIGHT", parent, -40, 0)
      elseif option.type == "slider" then
        frame = CreateFrame("Frame", nil, parent, "BaganatorSliderTemplate")
        frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, offsetY)
      elseif option.type == "dropdown" then
        if DoesTemplateExist("SelectionPopoutButtonTemplate") then
          frame = CreateFrame("Frame", nil, parent, "BaganatorDropDownTemplate")
        else
          frame = CreateFrame("Frame", nil, parent)
          local dropdown = CreateFrame("DropdownButton", nil, frame, "WowStyle1DropdownTemplate")
          dropdown:SetWidth(250)
          dropdown:SetPoint("CENTER")
          frame:SetPoint("LEFT", 30, 0)
          frame:SetPoint("RIGHT", -30, 0)
          frame.Init = function(_, option)
            local entries = {}
            for index = 1, #option.entries do
              table.insert(entries, {option.entries[index], option.values[index]})
            end
            MenuUtil.CreateRadioMenu(dropdown, function(value)
              return Baganator.Config.Get(option.option) == value
            end, function(value)
              Baganator.Config.Set(option.option, value)
            end, unpack(entries))
          end
          frame.SetValue = function(_, value)
            -- don't need to do anything as dropdown's onshow handles this
          end
          frame:SetHeight(40)
        end
        frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, offsetY)
      elseif option.type == "header" then
        frame = CreateFrame("Frame", nil, parent, "BaganatorHeaderTemplate")
        frame:SetPoint("TOP", lastFrame, "BOTTOM", 0, offsetY)
      elseif option.type == "spacing" then
        offsetY = -30
      end
      if frame then
        offsetY = 0
        frame:Init(option)
        table.insert(allFrames, frame)
        lastFrame = frame
      end
    end
  end

  allFrames[1]:ClearAllPoints()
  allFrames[1]:SetPoint("TOP", parent)
  allFrames[1]:SetPoint("LEFT", parent, 40, 0)
  allFrames[1]:SetPoint("RIGHT", parent, -40, 0)

  return allFrames
end

local function GetTab(parent)
  local tab
  if Baganator.Constants.IsRetail then
    tab = CreateFrame("Button", nil, parent, "BaganatorRetailTabTopTemplate")
  else
    tab = CreateFrame("Button", nil, parent, "BaganatorClassicTabTopTemplate")
  end

  if tIndexOf(parent.Tabs, tab) == nil then
    table.insert(parent.Tabs, tab)
  end

  if #parent.Tabs > 1 then
    tab:SetPoint("TOPLEFT", parent.Tabs[#parent.Tabs - 1], "TOPRIGHT", 5, 0)
  else
    tab:SetPoint("TOPLEFT", 10, -20)
  end

  local tabIndex = #parent.Tabs
  tab:SetScript("OnClick", function()
    parent:SetIndex(tabIndex)
  end)

  Baganator.Skins.AddFrame("TopTabButton", tab)

  return tab
end

local function GetWrapperFrame(parent)
  local frame = CreateFrame("Frame", nil, parent)
  frame:SetPoint("TOP", 0, -70)
  frame:SetPoint("LEFT")
  frame:SetPoint("RIGHT")
  frame:SetPoint("BOTTOM")
  frame:Hide()

  table.insert(parent.Views, frame)

  return frame
end

BaganatorCustomiseDialogMixin = {}

function BaganatorCustomiseDialogMixin:OnLoad()
  ButtonFrameTemplate_HidePortrait(self)
  ButtonFrameTemplate_HideButtonBar(self)
  self.Inset:Hide()
  Baganator.Skins.AddFrame("ButtonFrame", self)

  self:SetTitle(BAGANATOR_L_CUSTOMISE_BAGANATOR)

  self.Tabs = {}
  self.Views = {}
  self.lowestFrames = {}
  self.optionFrames = {}

  self:SetupGeneral()
  self:SetupLayout()
  self:SetupTheme()
  self:SetupIcon()
  self:SetupOpenClose()
  self:SetupSorting()
  self:SetupCategoriesOptions()

  PanelTemplates_SetNumTabs(self, #self.Tabs)

  self:RegisterForDrag("LeftButton")
  self:SetMovable(true)
  self:SetClampedToScreen(true)

  if TSM_API then
    self:SetFrameStrata("HIGH")
  end
end

function BaganatorCustomiseDialogMixin:OnDragStart()
  self:StartMoving()
  self:SetUserPlaced(false)
end

function BaganatorCustomiseDialogMixin:OnDragStop()
  self:StopMovingOrSizing()
  self:SetUserPlaced(false)
end

function BaganatorCustomiseDialogMixin:SetIndex(index)
  for _, v in ipairs(self.Views) do
    v:Hide()
  end
  self.Views[index]:Show()

  PanelTemplates_SetTab(self, index)
  self.lastIndex = index
end

function BaganatorCustomiseDialogMixin:SetupGeneral()
  local tab = GetTab(self)
  tab:SetText(BAGANATOR_L_GENERAL)

  local frame = GetWrapperFrame(self)

  frame.ResetFramePositions = CreateFrame("Button", nil, frame, "UIPanelDynamicResizeButtonTemplate")
  frame.ResetFramePositions:SetPoint("TOP", frame, 0, -48)
  frame.ResetFramePositions:SetPoint("LEFT", frame, "CENTER", 55, 0)
  frame.ResetFramePositions:SetText(BAGANATOR_L_RESET_POSITIONS)
  DynamicResizeButton_Resize(frame.ResetFramePositions)
  frame.ResetFramePositions:SetScript("OnClick", function()
    Baganator.CallbackRegistry:TriggerEvent("ResetFramePositions")
  end)
  Baganator.Skins.AddFrame("Button", frame.ResetFramePositions)

  do
    local junkPlugins = {
      {label = BAGANATOR_L_POOR_QUALITY, id = "poor_quality"},
    }
    for id, pluginDetails in pairs(addonTable.JunkPlugins) do
      table.insert(junkPlugins, {
        label = pluginDetails.label,
        id = id,
      })
    end
    table.sort(junkPlugins, function(a, b)
      return a.label < b.label
    end)
    local dropdown = {
      type = "dropdown",
      text = BAGANATOR_L_JUNK_DETECTION_2,
      option = "junk_plugin",
      entries = {},
      values = {},
    }
    for _, pluginInfo in ipairs(junkPlugins) do
      table.insert(dropdown.entries, pluginInfo.label)
      table.insert(dropdown.values, pluginInfo.id)
    end
    if addonTable.JunkPlugins[Baganator.Config.Get("junk_plugin")] == nil then
      Baganator.Config.ResetOne("junk_plugin")
    end

    table.insert(GENERAL_OPTIONS, dropdown)
  end

  local allFrames = GenerateFrames(GENERAL_OPTIONS, frame)

  allFrames[2].CheckBox.HoverBackground:SetPoint("RIGHT", frame.ResetFramePositions, "LEFT")

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      frame:SetValue(Baganator.Config.Get(frame.option))
    end
  end)
  frame:SetScript("OnUpdate", function()
    for index, frame in ipairs(allFrames) do
      frame:SetValue(Baganator.Config.Get(frame.option))
    end
  end)

  local tooltipButtonFrame = CreateFrame("Frame", nil, frame)
  do
    tooltipButtonFrame:SetPoint("LEFT")
    tooltipButtonFrame:SetPoint("RIGHT")
    tooltipButtonFrame:SetPoint("TOP", allFrames[#allFrames], 0, -30)
    local text = tooltipButtonFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    text:SetPoint("RIGHT", tooltipButtonFrame, "CENTER", -50, 0)
    text:SetText(BAGANATOR_L_TOOLTIP_SETTINGS)
    text:SetJustifyH("RIGHT")
    local button = CreateFrame("Button", nil, tooltipButtonFrame, "UIPanelDynamicResizeButtonTemplate")
    button:SetText(BAGANATOR_L_OPEN_SYNDICATOR)
    DynamicResizeButton_Resize(button)
    button:SetPoint("LEFT", tooltipButtonFrame, "CENTER", -35, 0)
    button:SetScript("OnClick", function()
      Settings.OpenToCategory(SYNDICATOR_L_SYNDICATOR)
    end)
  end

  table.insert(self.lowestFrames, allFrames[#allFrames])
end

function BaganatorCustomiseDialogMixin:SetupIcon()
  local tab = GetTab(self)
  tab:SetText(BAGANATOR_L_ICONS)

  local frame = GetWrapperFrame(self)

  local allFrames = GenerateFrames(ICON_OPTIONS, frame)

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      frame:SetValue(Baganator.Config.Get(frame.option))
    end
  end)

  local cornersEditor = Baganator.CustomiseDialog.GetCornersEditor(frame)
  cornersEditor:SetPoint("TOP", allFrames[#allFrames], "BOTTOM", 0, 0)
  table.insert(allFrames, cornersEditor)

  local itemButton
  if Baganator.Constants.IsRetail then
    itemButton = CreateFrame("ItemButton", nil, frame)
  else
    itemButton = CreateFrame("Button", nil, frame, "ItemButtonTemplate")
  end
  itemButton:SetPoint("CENTER", cornersEditor, 0, -15)
  Baganator.Skins.AddFrame("ItemButton", itemButton)

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      if frame.SetValue then
        frame:SetValue(Baganator.Config.Get(frame.option))
      end
    end
  end)

  table.insert(self.lowestFrames, allFrames[#allFrames])
end

function BaganatorCustomiseDialogMixin:SetupOpenClose()
  local tab = GetTab(self)
  tab:SetText(BAGANATOR_L_AUTO_OPEN)

  local frame = GetWrapperFrame(self)

  local allFrames = GenerateFrames(OPEN_CLOSE_OPTIONS, frame)

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      frame:SetValue(Baganator.Config.Get(Baganator.Config.Options.AUTO_OPEN)[frame.option])
    end
  end)

  table.insert(self.lowestFrames, allFrames[#allFrames])
end

function BaganatorCustomiseDialogMixin:SetupSorting()
  local tab = GetTab(self)
  tab:SetText(BAGANATOR_L_SORTING)

  local frame = GetWrapperFrame(self)

  do
    local allModes = {
      {"type", BAGANATOR_L_ITEM_TYPE},
      {"quality", BAGANATOR_L_ITEM_QUALITY},
      {"combine_stacks_only", BAGANATOR_L_COMBINE_STACKS_ONLY},
      {"expansion", BAGANATOR_L_EXPANSION},
    }

    for id, details in pairs(addonTable.ExternalContainerSorts) do
      table.insert(allModes, {id, details.label})
    end

    table.sort(allModes, function(a, b) return a[2] < b[2] end)

    local typeDropDown = {
      type = "dropdown",
      text = BAGANATOR_L_SORT_METHOD_2,
      option = "sort_method",
      entries = {},
      values = {},
    }

    for _, details in ipairs(allModes) do
      if Baganator.Sorting.IsModeAvailable(details[1]) then
        table.insert(typeDropDown.values, details[1])
        table.insert(typeDropDown.entries, details[2])
      end
    end

    if not Baganator.Sorting.IsModeAvailable(Baganator.Config.Get("sort_method")) then
      Baganator.Config.ResetOne("sort_method")
    end

    table.insert(SORTING_OPTIONS, 3, typeDropDown)
  end
  if next(addonTable.ExternalGuildBankSorts) ~= nil then
    local allModes = {}

    Baganator.Utilities.AutoSetGuildSortMethod()

    for id, details in pairs(addonTable.ExternalGuildBankSorts) do
      table.insert(allModes, {id, details.label})
    end

    table.sort(allModes, function(a, b) return a[2] < b[2] end)

    local typeDropDown = {
      type = "dropdown",
      option = "guild_bank_sort_method",
      entries = {NONE},
      values = {"none"},
    }

    for _, details in ipairs(allModes) do
      table.insert(typeDropDown.values, details[1])
      table.insert(typeDropDown.entries, details[2])
    end

    table.insert(SORTING_OPTIONS, {
      type = "header",
      text = BAGANATOR_L_GUILD_BANK_SORT_METHOD,
      level = 2,
    })

    table.insert(SORTING_OPTIONS, typeDropDown)
  end

  local allFrames = GenerateFrames(SORTING_OPTIONS, frame)

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      frame:SetValue(Baganator.Config.Get(frame.option))
    end
  end)

  table.insert(self.lowestFrames, allFrames[#allFrames])
end

function BaganatorCustomiseDialogMixin:SetupLayout()
  local tab = GetTab(self)
  tab:SetText(BAGANATOR_L_LAYOUT)

  local frame = GetWrapperFrame(self)

  local allFrames = GenerateFrames(LAYOUT_OPTIONS, frame)

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      frame:SetValue(Baganator.Config.Get(frame.option))
    end
  end)

  table.insert(self.lowestFrames, allFrames[#allFrames])
end

function BaganatorCustomiseDialogMixin:SetupTheme()
  local tab = GetTab(self)
  tab:SetText(BAGANATOR_L_THEME)

  local frame = GetWrapperFrame(self)

  local allFrames = GenerateFrames(THEME_OPTIONS, frame)

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      frame:SetValue(Baganator.Config.Get(frame.option))
    end
  end)

  table.insert(self.lowestFrames, allFrames[#allFrames])
end

function BaganatorCustomiseDialogMixin:SetupCategoriesOptions()
  local tab = GetTab(self)
  tab:SetText(BAGANATOR_L_CATEGORIES)

  local frame = GetWrapperFrame(self)

  local allFrames = GenerateFrames(CATEGORIES_OPTIONS, frame)

  local top = allFrames[#allFrames]

  local editorHeader = unpack(GenerateFrames({{
    type = "header",
    text = BAGANATOR_L_CUSTOM_CATEGORIES,
    level = 2,
  }}, frame))
  editorHeader:SetPoint("TOP", top, "BOTTOM", 0, -10)
  editorHeader:SetPoint("LEFT", frame, "CENTER", 10 + Baganator.Constants.ButtonFrameOffset, 0)
  editorHeader:SetPoint("RIGHT", frame, -10, 0)
  table.insert(allFrames, editorHeader)

  local orderHeader = unpack(GenerateFrames({
    {
      type = "header",
      text = BAGANATOR_L_DISPLAY_ORDER,
      level = 2,
    },
  }, frame))

  orderHeader:SetPoint("TOP", top, "BOTTOM", 0, -10)
  orderHeader:SetPoint("RIGHT", frame, "CENTER", -10, 0)
  orderHeader:SetPoint("LEFT", frame, "LEFT", Baganator.Constants.ButtonFrameOffset + 10, 0)
  table.insert(allFrames, orderHeader)

  top = orderHeader

  local categoriesEditor = CreateFrame("Frame", nil, frame, "BaganatorCustomiseDialogCategoriesEditorTemplate")
  categoriesEditor:SetPoint("TOP", top, "BOTTOM")
  categoriesEditor:SetPoint("RIGHT", frame, -10, 0)
  categoriesEditor:SetPoint("LEFT", frame, "CENTER", Baganator.Constants.ButtonFrameOffset + 10, 0)
  categoriesEditor:SetHeight(230)
  table.insert(allFrames, categoriesEditor)

  local exportHeader = unpack(GenerateFrames({
    {
      type = "header",
      text = BAGANATOR_L_IMPORT_EXPORT,
      level = 2,
    },
  }, frame))

  exportHeader:SetPoint("TOP", categoriesEditor, "BOTTOM", 0, -30)
  exportHeader:SetPoint("LEFT", frame, "CENTER", 10, 0)
  exportHeader:SetPoint("RIGHT", frame, "RIGHT", -10, 0)
  table.insert(allFrames, exportHeader)

  local categoriesImportExport = Baganator.CustomiseDialog.GetCategoriesImportExport(frame)
  categoriesImportExport:SetPoint("TOPLEFT", exportHeader, "BOTTOMLEFT")
  categoriesImportExport:SetPoint("TOPRIGHT", exportHeader, "BOTTOMRIGHT")

  local categoriesOrder = Baganator.CustomiseDialog.GetCategoriesOrganiser(frame)
  categoriesOrder:SetPoint("TOP", top, "BOTTOM")
  table.insert(allFrames, categoriesOrder)
  categoriesOrder:SetPoint("LEFT", frame, Baganator.Constants.ButtonFrameOffset + 20, 0)
  categoriesOrder:SetPoint("RIGHT", frame, "CENTER")

  frame:SetScript("OnShow", function()
    for index, frame in ipairs(allFrames) do
      if frame.SetValue then
        frame:SetValue(Baganator.Config.Get(frame.option))
      end
    end
  end)

  table.insert(self.lowestFrames, allFrames[#allFrames])
end

function BaganatorCustomiseDialogMixin:RefreshOptions()
  local bottom = self.lowestFrames[1]:GetBottom()
  for _, f in ipairs(self.lowestFrames) do
    bottom = math.min(bottom, f:GetBottom())
  end

  self:SetHeight(self:GetTop() - bottom + 20)
end

function BaganatorCustomiseDialogMixin:OnShow()
  self:SetIndex(self.lastIndex or 1)
  self:RefreshOptions()

  local tabsWidth = self.Tabs[#self.Tabs]:GetRight() - self.Tabs[1]:GetLeft()

  self:SetWidth(math.max(self:GetWidth(), tabsWidth + 20))
end
