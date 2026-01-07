-- CDVA - UI.lua (Classic Era 1.15.x)
-- Guaranteed /cdva open:
-- 1) Interface Options (if present)
-- 2) Standalone config window fallback (always works)

CDVASavedVars = CDVASavedVars or {}
if type(CDVASavedVars.masterEnabled) ~= "boolean" then CDVASavedVars.masterEnabled = true end
if type(CDVASavedVars.spellEnabled) ~= "table" then CDVASavedVars.spellEnabled = {} end
if type(CDVASavedVars.volume) ~= "number" then CDVASavedVars.volume = 1.0 end -- 0.0 to 1.0

local function IsAddonEnabled()
    return CDVASavedVars.masterEnabled == true
end

local function SetAddonEnabled(v)
    CDVASavedVars.masterEnabled = v and true or false
end

local function IsSpellEnabled(spellID)
    local v = CDVASavedVars.spellEnabled[spellID]
    if v == nil then return true end
    return v == true
end

local function SetSpellEnabled(spellID, v)
    CDVASavedVars.spellEnabled[spellID] = v and true or false
end

local function GetSpellTable()
    -- core.lua should add: _G.CDVA_SPELLS = spellCooldowns
    return _G.CDVA_SPELLS
end

local function GetSortedSpellIDs(spells)
    local ids = {}
    for spellID in pairs(spells) do
        table.insert(ids, spellID)
    end
    table.sort(ids, function(a, b)
        local an = GetSpellInfo(a) or (spells[a] and spells[a].name) or tostring(a)
        local bn = GetSpellInfo(b) or (spells[b] and spells[b].name) or tostring(b)
        return an < bn
    end)
    return ids
end

-- =========================================================
-- Addon "Volume" workaround (Classic-friendly)
-- Temporarily scales SFX (and Master as fallback), plays file, then restores.
-- =========================================================
local _cdvaRestoreTimer
local _cdvaOldSFX, _cdvaOldMaster

local function PlayCDVASound(path)
    if type(path) ~= "string" or path == "" then return end

    local vol = tonumber(CDVASavedVars.volume) or 1.0
    if vol < 0 then vol = 0 elseif vol > 1 then vol = 1 end

    -- Cancel any pending restore so multiple sounds don't fight
    if _cdvaRestoreTimer and _cdvaRestoreTimer.Cancel then
        _cdvaRestoreTimer:Cancel()
    end

    _cdvaOldSFX = tonumber(GetCVar("Sound_SFXVolume")) or 1.0
    _cdvaOldMaster = tonumber(GetCVar("Sound_MasterVolume")) or 1.0

    local newSFX = _cdvaOldSFX * vol
    local newMaster = _cdvaOldMaster * vol

    SetCVar("Sound_SFXVolume", tostring(newSFX))
    -- Some Classic setups ignore PlaySoundFile channel for mp3; master scaling is a fallback.
    SetCVar("Sound_MasterVolume", tostring(newMaster))

    PlaySoundFile(path, "SFX")

    -- Restore after a moment so the sound starts playing at the scaled volume
    _cdvaRestoreTimer = C_Timer.NewTimer(2.0, function()
        if _cdvaOldSFX then SetCVar("Sound_SFXVolume", tostring(_cdvaOldSFX)) end
        if _cdvaOldMaster then SetCVar("Sound_MasterVolume", tostring(_cdvaOldMaster)) end
        _cdvaRestoreTimer = nil
    end)
end

-- Expose to core.lua so normal cooldown announcements respect slider
_G.CDVA_PlaySound = PlayCDVASound

local function PlayTestSoundForSpell(spells, spellID)
    local info = spells and spells[spellID]
    local mp3 = info and info.mp3
    if type(mp3) == "string" and mp3 ~= "" then
        PlayCDVASound(mp3)
    else
        print("|cff00ffccCDVA:|r No sound file set for this spell.")
    end
end

-- =========================================================
-- Standalone fallback window (always visible)
-- =========================================================
local standalone

local function CreateStandaloneWindow()
    if standalone then return standalone end

    local f = CreateFrame("Frame", "CDVAStandaloneFrame", UIParent, "BackdropTemplate")
    f:SetSize(520, 600)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })

    local title = f:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("CDVA - Cooldown Vocal Announcement")

    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -6, -6)

    local master = CreateFrame("CheckButton", nil, f, "UICheckButtonTemplate")
    master:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
    master.text:SetText("Enable CDVA")
    master:SetScript("OnClick", function(self)
        SetAddonEnabled(self:GetChecked())
    end)

    local btnEnableAll = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    btnEnableAll:SetSize(110, 22)
    btnEnableAll:SetPoint("TOPLEFT", master, "BOTTOMLEFT", 0, -10)
    btnEnableAll:SetText("Enable All")

    local btnDisableAll = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    btnDisableAll:SetSize(110, 22)
    btnDisableAll:SetPoint("LEFT", btnEnableAll, "RIGHT", 8, 0)
    btnDisableAll:SetText("Disable All")

    local hint = f:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    hint:SetPoint("TOPLEFT", btnEnableAll, "BOTTOMLEFT", 0, -8)
    hint:SetText("Tip: This list is class-based. Toggle spells you want announced.")

    -- Volume slider (Standalone)
    local volLabel = f:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    volLabel:SetPoint("TOPLEFT", hint, "BOTTOMLEFT", 0, -10)
    volLabel:SetText(("CDVA Volume: %d%%"):format(math.floor((CDVASavedVars.volume or 1) * 100 + 0.5)))

    local vol = CreateFrame("Slider", "CDVAVolumeSliderStandalone", f, "OptionsSliderTemplate")
    vol:SetWidth(220)
    vol:SetPoint("TOPLEFT", volLabel, "BOTTOMLEFT", 0, -6)
    vol:SetMinMaxValues(0, 100)
    vol:SetValueStep(5)
    vol:SetObeyStepOnDrag(true)
    vol:SetValue((CDVASavedVars.volume or 1) * 100)

    _G[vol:GetName().."Low"]:SetText("0%")
    _G[vol:GetName().."High"]:SetText("100%")
    _G[vol:GetName().."Text"]:SetText("")

    vol:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value + 0.5)
        CDVASavedVars.volume = value / 100
        volLabel:SetText(("CDVA Volume: %d%%"):format(value))
    end)

    local scrollFrame = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", vol, "BOTTOMLEFT", 0, -10)
    scrollFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -32, 16)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(1, 1)
    scrollFrame:SetScrollChild(content)

    local rows = {}

    local function ClearRows()
        for _, r in ipairs(rows) do
            if r.cb then r.cb:Hide(); r.cb:SetParent(nil) end
            if r.testBtn then r.testBtn:Hide(); r.testBtn:SetParent(nil) end
        end
        wipe(rows)
    end

    local function BuildList()
        ClearRows()
        master:SetChecked(IsAddonEnabled())

        local spells = GetSpellTable()
        if type(spells) ~= "table" then
            local warn = content:CreateFontString(nil, "ARTWORK", "GameFontRedSmall")
            warn:SetPoint("TOPLEFT", 0, -4)
            warn:SetText("Spell list not found.\nIn core.lua add:  _G.CDVA_SPELLS = spellCooldowns")
            content:SetHeight(60)
            return
        end

        local ids = GetSortedSpellIDs(spells)
        local y = -4
        local TEST_X = 280 -- fixed column for ▶ buttons

        for _, spellID in ipairs(ids) do
            local info = spells[spellID]
            local spellName, _, texture = GetSpellInfo(spellID)
            spellName = spellName or (info and info.name) or ("SpellID " .. spellID)

            local cb = CreateFrame("CheckButton", nil, content, "UICheckButtonTemplate")
            cb:SetPoint("TOPLEFT", 0, y)
            cb:SetChecked(IsSpellEnabled(spellID))

            local icon = cb:CreateTexture(nil, "ARTWORK")
            icon:SetSize(18, 18)
            icon:SetPoint("LEFT", cb, "RIGHT", 4, 0)
            icon:SetTexture(texture or "Interface\\Icons\\INV_Misc_QuestionMark")

            cb.text:ClearAllPoints()
            cb.text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
            cb.text:SetText(spellName)


    -- Below is a button to play the sounds in the UI menu to 'test' what they sound like. Needs work before release 
    -- Spells are sometimes calling out other spell names. no idea why 

            --local testBtn = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
            --testBtn:SetSize(40, 18)
            --testBtn:SetText("Play")
            --testBtn:SetPoint("TOPLEFT", TEST_X, y + 2)
            --testBtn:SetScript("OnClick", function()
                --PlayTestSoundForSpell(spells, spellID)
            --end)

            local function UpdateVisual()
                if IsSpellEnabled(spellID) then
                    icon:SetDesaturated(false)
                    cb.text:SetTextColor(1, 1, 1)
                else
                    icon:SetDesaturated(true)
                    cb.text:SetTextColor(0.5, 0.5, 0.5)
                end
            end

            cb:SetScript("OnClick", function(self)
                SetSpellEnabled(spellID, self:GetChecked())
                UpdateVisual()
            end)

            cb:SetScript("OnEnter", function()
                GameTooltip:SetOwner(cb, "ANCHOR_RIGHT")
                if GameTooltip.SetSpellByID then
                    GameTooltip:SetSpellByID(spellID)
                else
                    GameTooltip:SetText(spellName)
                end
                GameTooltip:Show()
            end)

            cb:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)

            UpdateVisual()

            table.insert(rows, { cb = cb })
            --table.insert(rows, { cb = cb, testBtn = testBtn })  USE THIS ONLY IF TEST BUTTON IS ACTIVE
            y = y - 24
        end

        content:SetHeight(math.max(1, -y + 10))
    end

    btnEnableAll:SetScript("OnClick", function()
        local spells = GetSpellTable()
        if type(spells) ~= "table" then BuildList(); return end
        for spellID in pairs(spells) do
            SetSpellEnabled(spellID, true)
        end
        BuildList()
    end)

    btnDisableAll:SetScript("OnClick", function()
        local spells = GetSpellTable()
        if type(spells) ~= "table" then BuildList(); return end
        for spellID in pairs(spells) do
            SetSpellEnabled(spellID, false)
        end
        BuildList()
    end)

    f.Refresh = BuildList
    standalone = f
    return f
end

-- =========================================================
-- Options Panel (Interface Options)
-- IMPORTANT: Unique frame name to avoid conflicts with anything in core.lua
-- =========================================================
local optionsPanel

local function EnsureOptionsPanel()
    if optionsPanel then return end

    optionsPanel = CreateFrame("Frame", "CDVAOptionsPanel_UI", UIParent)
    optionsPanel.name = "CDVA"

    local title = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -16)
    title:SetText("CDVA - Cooldown Vocal Announcement")

    local sub = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    sub:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -6)
    sub:SetText("Toggle which spell cooldowns are announced for your class.")

    local master = CreateFrame("CheckButton", nil, optionsPanel, "UICheckButtonTemplate")
    master:SetPoint("TOPLEFT", sub, "BOTTOMLEFT", 0, -12)
    master.text:SetText("Enable CDVA")
    master:SetScript("OnClick", function(self)
        SetAddonEnabled(self:GetChecked())
    end)

    -- Volume slider (Options Panel)
    local volLabel = optionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    volLabel:SetPoint("TOPLEFT", master, "BOTTOMLEFT", 0, -10)

    local vol = CreateFrame("Slider", "CDVAVolumeSliderOptions", optionsPanel, "OptionsSliderTemplate")
    vol:SetWidth(220)
    vol:SetPoint("TOPLEFT", volLabel, "BOTTOMLEFT", 0, -6)
    vol:SetMinMaxValues(0, 100)
    vol:SetValueStep(5)
    vol:SetObeyStepOnDrag(true)

    _G[vol:GetName().."Low"]:SetText("0%")
    _G[vol:GetName().."High"]:SetText("100%")
    _G[vol:GetName().."Text"]:SetText("")

    vol:SetScript("OnValueChanged", function(self, value)
        value = math.floor(value + 0.5)
        CDVASavedVars.volume = value / 100
        volLabel:SetText(("CDVA Volume: %d%%"):format(value))
    end)

    local scrollFrame = CreateFrame("ScrollFrame", nil, optionsPanel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", vol, "BOTTOMLEFT", 0, -12)
    scrollFrame:SetPoint("BOTTOMRIGHT", optionsPanel, "BOTTOMRIGHT", -30, 16)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(1, 1)
    scrollFrame:SetScrollChild(content)

    local rows = {}

    local function ClearRows()
        for _, r in ipairs(rows) do
            if r.cb then r.cb:Hide(); r.cb:SetParent(nil) end
            if r.testBtn then r.testBtn:Hide(); r.testBtn:SetParent(nil) end
        end
        wipe(rows)
    end

    local function BuildList()
        ClearRows()
        master:SetChecked(IsAddonEnabled())

        local spells = GetSpellTable()
        if type(spells) ~= "table" then
            local warn = content:CreateFontString(nil, "ARTWORK", "GameFontRedSmall")
            warn:SetPoint("TOPLEFT", 0, -4)
            warn:SetText("Spell list not found. In core.lua add:  _G.CDVA_SPELLS = spellCooldowns")
            content:SetHeight(40)
            return
        end

        local ids = GetSortedSpellIDs(spells)
        local y = -4
        local TEST_X = 280

        for _, spellID in ipairs(ids) do
            local info = spells[spellID]
            local spellName, _, texture = GetSpellInfo(spellID)
            spellName = spellName or (info and info.name) or ("SpellID " .. spellID)

            local cb = CreateFrame("CheckButton", nil, content, "UICheckButtonTemplate")
            cb:SetPoint("TOPLEFT", 0, y)
            cb:SetChecked(IsSpellEnabled(spellID))

            local icon = cb:CreateTexture(nil, "ARTWORK")
            icon:SetSize(18, 18)
            icon:SetPoint("LEFT", cb, "RIGHT", 4, 0)
            icon:SetTexture(texture or "Interface\\Icons\\INV_Misc_QuestionMark")

            cb.text:ClearAllPoints()
            cb.text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
            cb.text:SetText(spellName)

            local testBtn = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
            testBtn:SetSize(40, 18)
            testBtn:SetText("Play")
            testBtn:SetPoint("TOPLEFT", TEST_X, y + 2)
            testBtn:SetScript("OnClick", function()
                PlayTestSoundForSpell(spells, spellID)
            end)

            local function UpdateVisual()
                if IsSpellEnabled(spellID) then
                    icon:SetDesaturated(false)
                    cb.text:SetTextColor(1, 1, 1)
                else
                    icon:SetDesaturated(true)
                    cb.text:SetTextColor(0.5, 0.5, 0.5)
                end
            end

            cb:SetScript("OnClick", function(self)
                SetSpellEnabled(spellID, self:GetChecked())
                UpdateVisual()
            end)

            cb:SetScript("OnEnter", function()
                GameTooltip:SetOwner(cb, "ANCHOR_RIGHT")
                if GameTooltip.SetSpellByID then
                    GameTooltip:SetSpellByID(spellID)
                else
                    GameTooltip:SetText(spellName)
                end
                GameTooltip:Show()
            end)

            cb:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)

            UpdateVisual()

            table.insert(rows, { cb = cb, testBtn = testBtn })
            y = y - 24
        end

        content:SetHeight(math.max(1, -y + 10))
    end

    optionsPanel:SetScript("OnShow", function()
        local pct = math.floor((CDVASavedVars.volume or 1) * 100 + 0.5)
        volLabel:SetText(("CDVA Volume: %d%%"):format(pct))
        vol:SetValue(pct)
        BuildList()
    end)

    if InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(optionsPanel)
    end
end

-- =========================================================
-- /cdva opener
-- =========================================================
local function OpenCDVA()
    EnsureOptionsPanel()

    if InterfaceOptionsFrame and InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame:Show()
        InterfaceOptionsFrame_OpenToCategory(optionsPanel)
        InterfaceOptionsFrame_OpenToCategory(optionsPanel) -- Classic bug: call twice
        return
    end

    local f = CreateStandaloneWindow()
    f:Show()
    f:Raise()
    if f.Refresh then f:Refresh() end
end

SLASH_CDVA1 = "/cdva"
SlashCmdList.CDVA = function()
    OpenCDVA()
end
