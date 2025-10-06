local CDVA, addon = ...

local class = select(2, UnitClass("player")) -- Get the player's class


local spellCooldowns = {}


-- Define spells based on the player's class
if class == "HUNTER" then
    spellCooldowns = {



        -- HUNTER SPELLS --



        [14310] = {
            name = "Freezing Trap",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\IceTraps.mp3",
            onCooldown = false,
        },
        [13809] = {                                                          -- 'Ice Traps Ready'
            name = "Frost Trap",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\",
            onCooldown = false,
        },
        [5384] = {
            name = "Feign Death",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FeignDeath.mp3",
            onCooldown = false,
        },
        [781] = {
            name = "Disengage",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Disengage.mp3",
            onCooldown = false,
        },
        [3045] = {
            name = "Rapid Fire",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\RapidFire.mp3",
            onCooldown = false,
        },
        [5116] = {
            name = "Concussive Shot",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ConcussiveShot.mp3",
            onCooldown = false,
        },
        [14316] = {
            name = "Explosive Trap",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FireTraps.mp3",
            onCooldown = false,
        },                                                                  -- 'Fire Traps Ready'
        [14302] = {
            name = "Immolation Trap",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\",
            onCooldown = false,
        },
        [53209] = {
            name = "Chimera Shot",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ChimeraShot.mp3",
            onCooldown = false,
        },
        [34490] = {
            name = "Silencing Shot",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\SilencingShot.mp3",
            onCooldown = false,
        },
        [19263] = {
            name = "Deterrence",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Deterrence.mp3",
            onCooldown = false,
        },
        [34026] = {
            name = "Kill Command",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\KillCommand.mp3",
            onCooldown = false,
        },
        [34477] = {
            name = "Misdirection",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Misdirection.mp3",
            onCooldown = false,
        },
        [53271] = {
            name = "Master's Call",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\MastersCall.mp3",
            onCooldown = false,
        },
        [60192] = {
            name = "Freezing Arrow",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FreezingArrow.mp3",
            onCooldown = false,
        },
        
    }





elseif class == "MAGE" then
    spellCooldowns = {



        -- MAGE SPELLS --



        [12051] = {
            name = "Evocation",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Evocation.mp3",
            onCooldown = false,
        },
        [12472] = {
            name = "Icy Veins",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\IcyVeins.mp3",
            onCooldown = false,
        },
        [45438] = {
            name = "Ice Block",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\IceBlock.mp3",
            onCooldown = false,
        },
        [31687] = {
            name = "Summon Water Elemental",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\WaterEle.mp3",
            onCooldown = false,
        },
        [6131] = {
            name = "Frost Nova",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FrostNova.mp3",
            onCooldown = false,
        },
        [13031] = {
            name = "Ice Barrier",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\IceBarrier.mp3",
            onCooldown = false,
        },
        [1953] = {
            name = "Blink",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Blink.mp3",
            onCooldown = false,
        },
        [10160] = {
            name = "Cone of Cold",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ConeOfCold.mp3",
            onCooldown = false,
        },
        [10197] = {
            name = "Fire Blast",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FireBlast.mp3",
            onCooldown = false,
        },
        [11958] = {
            name = "Cold Snap",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ColdSnap.mp3",
            onCooldown = false,
        },
        [543] = {
            name = "Fire Ward",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FireWard.mp3",
            onCooldown = false,
        },
        [6143] = {
            name = "Frost Ward",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FrostWard.mp3",
            onCooldown = false,
        },
        [2139] = {
            name = "Counterspell",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Counterspell.mp3",
            onCooldown = false,
        },
        [66] = {
            name = "Invisibility",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Invisibility.mp3",
            onCooldown = false,
        },
        [55342] = {
            name = "Mirror Image",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\MirrorImage.mp3",
            onCooldown = false,
        },
        

    }
elseif class == "PRIEST" then
    spellCooldowns = {


        -- PRIEST SPELLS --


        [10060] = {
            name = "Power Infusion",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\PowerInfusion.mp3",
            onCooldown = false,
        },
        [135936] = {
            name = "Pain Suppression",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\PainSuppression.mp3",
            onCooldown = false,
        },
        [34433] = {
            name = "Shadowfiend",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Shadowfiend.mp3",
            onCooldown = false,
        },
        [64901] = {
            name = "Hymn of Hope",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HymnOfHope.mp3",
            onCooldown = false,
        },
        [64844] = {
            name = "Divine Hymn",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivineHymn.mp3",  
            onCooldown = false,
        },
        [586] = {
            name = "Fade",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Fade.mp3",  
            onCooldown = false,
        },
        [8122] = {
            name = "Psychic Scream",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Fear.mp3",  
            onCooldown = false,
        },
        [6346] = {
            name = "Fear Ward",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FearWard.mp3",  
            onCooldown = false,
        },

        
    }
elseif class == "PALADIN" then
    spellCooldowns = {


        -- PALADIN SPELLS --


        [31821] = {
            name = "Aura Mastery",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\AuraMastery.mp3",
            onCooldown = false,
        },
        [1022] = {
            name = "Hand of Protection",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HoP.mp3",
            onCooldown = false,
        },
        [1044] = {
            name = "Hand of Freedom",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HoF.mp3",
            onCooldown = false,
        },
        [64205] = {
            name = "Divine Sacrifice",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivineSacrifice.mp3",
            onCooldown = false,
        },
        [54428] = {
            name = "Divine Plea",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivinePlea.mp3",
            onCooldown = false,
        },
        [642] = {
            name = "Divine Shield",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivineShield.mp3",
            onCooldown = false,
        },
        [20216] = {
            name = "Divine Favor",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivineFavor.mp3",
            onCooldown = false,
        },
        [31842] = {
            name = "Divine Illumination",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivineIllumination.mp3",
            onCooldown = false,
        },
        [10310] = {
            name = "Lay on Hands",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\LoH.mp3",
            onCooldown = false,
        },
        [1038] = {
            name = "Hand of Salvation",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HoS.mp3",
            onCooldown = false,
        },
        [135963] = {
            name = "Hammer of Justice",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HoJ.mp3",
            onCooldown = false,
        },
        [19752] = {
            name = "Divine Intervention",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivineIntervention.mp3",
            onCooldown = false,
        },
        [498] = {
            name = "Divine Protection",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DivineProtection.mp3",
            onCooldown = false,
        },

        [6940] = {
            name = "Hand of Sacrifice",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HandofSacrifice.mp3",
            onCooldown = false,
        },

        [31884] = {
            name = "Avenging Wrath",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\AvengingWrath.mp3",
            onCooldown = false,
        },


        
    }
elseif class == "ROGUE" then
    spellCooldowns = {


        -- ROGUE SPELLS --


        [5277] = {
            name = "Evasion",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Evasion.mp3",
            onCooldown = false,
        },
        [2983] = {
            name = "Sprint",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Sprint.mp3",
            onCooldown = false,
        },
        [1766] = {
            name = "Kick",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Kick.mp3",
            onCooldown = false,
        },
        [1966] = {
            name = "Feint",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Feint.mp3",
            onCooldown = false,
        },
        [51722] = {
            name = "Dismantle",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Dismantle.mp3",
            onCooldown = false,
        },
        [1856] = {
            name = "Vanish",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Vanish.mp3",
            onCooldown = false,
        },
        [408] = {
            name = "Kidney Shot",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\KidneyShot.mp3",
            onCooldown = false,
        },
        [2094] = {
            name = "Blind",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Blind.mp3",
            onCooldown = false,
        },
        [31224] = {
            name = "Cloak of Shadows",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\CoS.mp3",
            onCooldown = false,
        },
        [1776] = {
            name = "Gouge",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Gouge.mp3",
            onCooldown = false,
        },
        
    }
elseif class == "DRUID" then
    spellCooldowns = {


        -- DRUID SPELLS --


        [16689] = {
            name = "Nature's Grasp",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\NaturesGrasp.mp3",
            onCooldown = false,
        },
        [5229] = {
            name = "Enrage",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Enrage.mp3",
            onCooldown = false,
        },
        [5221] = {
            name = "Bash",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Bash.mp3",
            onCooldown = false,
        },
        [20484] = {
            name = "Rebirth",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Rebirth.mp3",
            onCooldown = false,
        },
        [16979] = {
            name = "Feral Charge - Bear",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FC.mp3",
            onCooldown = false,
        },
        [49376] = {
            name = "Feral Charge - Cat",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FC.mp3",
            onCooldown = false,
        },
        [5217] = {
            name = "Tiger's Fury",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\TigersFury.mp3",
            onCooldown = false,
        },
        [1850] = {
            name = "Dash",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Dash.mp3",
            onCooldown = false,
        },
        [5209] = {
            name = "Challenging Roar",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ChallengingRoar.mp3",
            onCooldown = false,
        },
        [22842] = {
            name = "Frenzied Regeneration",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FR.mp3",
            onCooldown = false,
        },
        [29166] = {
            name = "Innervate",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Innervate.mp3",
            onCooldown = false,
        },
        [22812] = {
            name = "Barkskin",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Barkskin.mp3",
            onCooldown = false,
        },
        
    }
elseif class == "SHAMAN" then
    spellCooldowns = {


        -- SHAMAN SPELLS --


        [8042] = {
            name = "Earth Shock",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\EarthShock.mp3",
            onCooldown = false,
        },
        [8050] = {
            name = "Flame Shock",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FlameShock.mp3",
            onCooldown = false,
        },
        [57994] = {
            name = "Wind Shear",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\WindShear.mp3",
            onCooldown = false,
        },
        [8056] = {
            name = "Frost Shock",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FrostShock.mp3",
            onCooldown = false,
        },
        [2062] = {
            name = "Earth Elemental Totem",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\EET.mp3",
            onCooldown = false,
        },
        [2894] = {
            name = "Fire Elemental Totem",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\FET.mp3",
            onCooldown = false,
        },
        [32182] = {
            name = "Heroism",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Heroism.mp3",
            onCooldown = false,
        },
        [2825] = {
            name = "Bloodlust",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Bloodlust.mp3",
            onCooldown = false,
        },
        [51505] = {
            name = "Lava Burst",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\LavaBurst.mp3",
            onCooldown = false,
        },
        [51514] = {
            name = "Hex",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Hex.mp3",
            onCooldown = false,
        },
       
    }
elseif class == "WARRIOR" then
    spellCooldowns = {


        -- WARRIOR SPELLS --


        [100] = {
            name = "Charge",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Charge.mp3",
            onCooldown = false,
        },
        [6343] = {
            name = "Thunder Clap",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ThunderClap.mp3",
            onCooldown = false,
        },
        [2687] = {
            name = "Bloodrage",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Bloodrage.mp3",
            onCooldown = false,
        },
        [355] = {
            name = "Taunt",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Taunt.mp3",
            onCooldown = false,
        },
        [72] = {
            name = "Shield Bash",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ShieldBash.mp3",
            onCooldown = false,
        },
        [694] = {
            name = "Mocking Blow",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\MockingBlow.mp3",
            onCooldown = false,
        },
        [2565] = {
            name = "Shield Block",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ShieldBlock.mp3",
            onCooldown = false,
        },
        [676] = {
            name = "Disarm",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Disarm.mp3",
            onCooldown = false,
        },
        [20230] = {
            name = "Retaliation",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Retaliation.mp3",
            onCooldown = false,
        },
        [5246] = {
            name = "Intimidating Shout",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\IntimidatingShout.mp3",
            onCooldown = false,
        },
        [1161] = {
            name = "Challenging Shout",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ChallengingShout.mp3",
            onCooldown = false,
        },
        [871] = {
            name = "Shield Wall",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ShieldWall.mp3",
            onCooldown = false,
        },
        [20252] = {
            name = "Intercept",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Intercept.mp3",
            onCooldown = false,
        },
        [18499] = {
            name = "Berserker Rage",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\BerserkerRage.mp3",
            onCooldown = false,
        },
        [6552] = {
            name = "Pummel",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Pummel.mp3",
            onCooldown = false,
        },
        [23920] = {
            name = "Spell Reflection",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\SpellReflection.mp3",
            onCooldown = false,
        },
        [3411] = {
            name = "Intervene",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Intervene.mp3",
            onCooldown = false,
        },
        [64382] = {
            name = "Shattering Throw",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ShatteringThrow.mp3",
            onCooldown = false,
        },
        [55694] = {
            name = "Enraged Regeneration",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\EnragedRegeneration.mp3",
            onCooldown = false,
        },
        [57755] = {
            name = "Heroic Throw",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HeroicThrow.mp3",
            onCooldown = false,
        },
       
    }
elseif class == "WARLOCK" then
    spellCooldowns = {


        -- WARLOCK SPELLS --


        [6229] = {
            name = "Shadow Ward",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ShadowWard.mp3",
            onCooldown = false,
        },
        [5484] = {
            name = "Howl of Terror",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\HowlofTerror.mp3",
            onCooldown = false,
        },
        [6789] = {
            name = "Death Coil",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DeathCoil.mp3",
            onCooldown = false,
        },
        [1122] = {
            name = "Inferno",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Inferno.mp3",
            onCooldown = false,
        },
        [603] = {
            name = "Curse of Doom",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\CurseofDoom.mp3",
            onCooldown = false,
        },
        [54785] = {
            name = "Demon Charge",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DemonCharge.mp3",
            onCooldown = false,
        },
        [50589] = {
            name = "Immolation Aura",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\ImmolationAura.mp3",
            onCooldown = false,
        },
        [29858] = {
            name = "Soulshatter",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Soulshatter.mp3",
            onCooldown = false,
        },
        [29893] = {
            name = "Ritual of Souls",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\RitualofSouls.mp3",
            onCooldown = false,
        },
        [47897] = {
            name = "Shadowflame",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Shadowflame.mp3",
            onCooldown = false,
        },
        [48020] = {
            name = "Demonic Circle: Teleport",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DCT.mp3",
            onCooldown = false,
        },
       
    }
elseif class == "DEATH KNIGHT" then
    spellCooldowns = {


        -- DK SPELLS --


        [49576] = {
            name = "Death Grip",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DeathGrip.mp3",
            onCooldown = false,
        },
        [46584] = {
            name = "Raise Dead",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\RaiseDead.mp3",
            onCooldown = false,
        },
        [47476] = {
            name = "Strangulate",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\Strangulate.mp3",
            onCooldown = false,
        },
        [43265] = {
            name = "Death and Decay",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DeathAndDecay.mp3",
            onCooldown = false,
        },
        [48792] = {
            name = "Icebound Fortitude",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\IceboundFortitude.mp3",
            onCooldown = false,
        },
        [45529] = {
            name = "Blood Tap",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\BloodTap.mp3",
            onCooldown = false,
        },
        [48743] = {
            name = "Death Pact",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\DeathPact.mp3",
            onCooldown = false,
        },
        [48707] = {
            name = "Anti-Magic Shell",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\AMS.mp3",
            onCooldown = false,
        },
        [61999] = {
            name = "Raise Ally",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\RaiseAlly.mp3",
            onCooldown = false,
        },
        [42650] = {
            name = "Army of the Dead",
            mp3 = "Interface\\AddOns\\CDVA\\Sounds\\AOTD.mp3",
            onCooldown = false,
        },
       
    }



end


-- CORE

local isMP3Playing = false

-- Function to check individual spell cooldowns and play sound
local function CheckSpellCooldown(spellID)
    local info = spellCooldowns[spellID]
    local start, duration, enabled = GetSpellCooldown(info.name)

    -- Check if start and duration are not nil and ignore cooldowns shorter than 2 seconds
    if start and duration and start > 0 and duration > 0 and duration >= 2 then
        -- Spell is on cooldown
        info.onCooldown = true
    elseif info.onCooldown and not isMP3Playing then
        -- Spell is off cooldown, play the MP3 and set the flag to prevent multiple plays
        PlaySoundFile(info.mp3)
        info.onCooldown = false
        isMP3Playing = true

        -- Set a timer to reset the isMP3Playing flag after a delay (e.g., 1 second)
        C_Timer.After(1, function()
            isMP3Playing = false
        end)
    end
end

-- Play login announcement sound
local function PlayLoginSound()
    local mp3File = "Interface\\AddOns\\CDVA\\Sounds\\CDVAannouncement.mp3"  -- Replace with the path to your login announcement MP3 file
    PlaySoundFile(mp3File)
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")

frame:SetScript("OnEvent", function()
    for spellID, info in pairs(spellCooldowns) do
        local spellName = GetSpellInfo(spellID)
        if spellName then
            local spellName, _, _, _, _, _, _, _, _, _, _ = GetSpellInfo(spellID)
            spellCooldowns[spellID].name = spellName
        end
    end

    -- Play the login announcement sound when the player logs in
    PlayLoginSound()

    -- Delay for 5 seconds
    C_Timer.After(5, function()
        -- Get the player's class
        local class = select(2, UnitClass("player"))

        -- Print messages in chat with color codes
        local whiteColor = "|cffffffff"
        local greenColor = "|cff00ff00"
        local redColor = "|cffff0000"
        local mintColor = '|cff00ffcc'
        DEFAULT_CHAT_FRAME:AddMessage(mintColor .. "CDVA (Cooldown Vocal Announcement): " .. whiteColor .. "Enabled")
        DEFAULT_CHAT_FRAME:AddMessage(mintColor .. "Class Detected: " .. whiteColor .. class)
        DEFAULT_CHAT_FRAME:AddMessage(redColor .. "Discord.gg/JkfQvBWbQJ")
    end)

    local function CheckAllSpellCooldowns()
        for spellID, info in pairs(spellCooldowns) do
            CheckSpellCooldown(spellID)
        end
    end

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

    eventFrame:SetScript("OnEvent", function(_, _, _, event, _, sourceName, _, _, _, destName, _, _, _, _, spellID)
        if event == "SPELL_CAST_SUCCESS" and sourceName == UnitName("player") then
            if spellCooldowns[spellID] and spellCooldowns[spellID].enabled then
                CheckSpellCooldown(spellID)
            end
        end
    end)

    local timer = C_Timer.NewTicker(1, CheckAllSpellCooldowns)
end)
