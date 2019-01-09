local SkillsTracker = {}

SkillsTracker.OptionEnable = Menu.AddOption({"mlambers", "Skills Tracker"}, "1. Enable.", "Enable/Disable this script.")
SkillsTracker.Size = Menu.AddOption({"mlambers", "Skills Tracker"}, "2. Size", "", 21, 48, 1)
SkillsTracker.DividerOffset = Menu.AddOption({"mlambers", "Skills Tracker"}, "3. Divider Offset", "", 1, 100, 1)
SkillsTracker.HeightOffset = Menu.AddOption({"mlambers", "Skills Tracker"}, "4. Height Offset", "", 1, 250, 1)
SkillsTracker.OffsetX = Menu.AddOption({"mlambers", "Skills Tracker"}, "5. X Offset Dire", "", 1, 200, 1)
SkillsTracker.OffsetXRadiant = Menu.AddOption({"mlambers", "Skills Tracker"}, "6. X Offset Radiant", "", 1, 200, 1)

SkillsTracker.NeedInit = true
SkillsTracker.FontCooldown = nil

local SpellList = {
	npc_dota_hero_antimage = {
		total = 1,
		index = {
			5
		}
	},
	npc_dota_hero_axe = { 
		total = 2,
		index = {
			0,
			5
		} 
	},
	npc_dota_hero_bane = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_bloodseeker = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_crystal_maiden = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_drow_ranger = { 
		total = 1,
		index = {
			1
		}
	},
	npc_dota_hero_earthshaker = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_juggernaut = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_mirana = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_morphling = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_nevermore = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_phantom_lancer = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_puck = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_pudge = { 
		total = 1,
		index = {
			5
		}
	},
	npc_dota_hero_razor = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_sand_king = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_storm_spirit = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_sven = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_tiny = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_vengefulspirit = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_windrunner = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_zuus = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_kunkka = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_lina = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_lion = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_shadow_shaman = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_slardar = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_tidehunter = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_witch_doctor = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_lich = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_riki = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_enigma = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_tinker = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_sniper = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_necrolyte = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_warlock = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_beastmaster = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_queenofpain = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_venomancer = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_faceless_void = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_skeleton_king = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_death_prophet = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_phantom_assassin = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_pugna = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_templar_assassin = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_viper = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_luna = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_dragon_knight = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_dazzle = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_rattletrap = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_leshrac = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_furion = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_life_stealer = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_dark_seer = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_clinkz = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_omniknight = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_enchantress = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_huskar = { 
		total = 1,
		index = {
			5
		}
	},
	npc_dota_hero_night_stalker = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_broodmother = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_bounty_hunter = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_weaver = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_jakiro = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_batrider = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_chen = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_spectre = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_ancient_apparition = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_doom_bringer = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_ursa = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_spirit_breaker = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_gyrocopter = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_alchemist = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_invoker = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_silencer = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_obsidian_destroyer = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_lycan = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_brewmaster = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_shadow_demon = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_lone_druid = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_chaos_knight = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_treant = { 
		total = 2,
		index = {
			2,
			5
		} 
	},
	npc_dota_hero_ogre_magi = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_undying = { 
		total = 2,
		index = {
			2,
			5
		} 
	},
	npc_dota_hero_rubick = { 
		total = 2,
		index = {
			0,
			5
		} 
	},
	npc_dota_hero_disruptor = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_nyx_assassin = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_naga_siren = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_keeper_of_the_light = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_wisp = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_visage = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_slark = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_medusa = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_troll_warlord = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_centaur = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_magnataur = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_shredder = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_bristleback = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_tusk = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_skywrath_mage = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_abaddon = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_elder_titan = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_legion_commander = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_techies = { 
		total = 1,
		index = {
			2
		}
	},
	npc_dota_hero_ember_spirit = { 
		total = 1,
		index = {
			2
		}
	},
	npc_dota_hero_earth_spirit = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_abyssal_underlord = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_terrorblade = { 
		total = 2,
		index = {
			2,
			5
		} 
	},
	npc_dota_hero_phoenix = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_oracle = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_winter_wyvern = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_arc_warden = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_monkey_king = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_dark_willow = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_pangolier = { 
		total = 1,
		index = {
			5
		} 
	},
	npc_dota_hero_grimstroke = { 
		total = 1,
		index = {
			5
		} 
	}
}

local MyHero = nil
local MyPlayer = nil
local OppositeTeam = nil
local TempHeroesOnUpdate = nil
local ScheduleUpdateTick = 0
local CurrentTick = 0
local ScreenWidth = nil
local ScreenHeight = nil
local StackList = {}

local MathFloor = math.floor

function SkillsTracker.OnScriptLoad()
	StackList = {}
	CurrentTick = 0
	ScheduleUpdateTick = 0
	MyHero = nil
	MyPlayer = nil
	OppositeTeam = nil
	TempHeroesOnUpdate = nil
	ScreenWidth = nil
	ScreenHeight = nil
	SkillsTracker.FontCooldown = nil
	SkillsTracker.NeedInit = true
	
	Console.Print("\n=================================================\n")
	Console.Print("Script: SkillsTracker | Callback: OnScriptLoad()\n")
	Console.Print("Current Time: " .. (os.date("%Y-%m-%d %I:%M %p")))
	Console.Print("=================================================\n\n")
end

function SkillsTracker.OnGameEnd()
	StackList = {}
	CurrentTick = 0
	ScheduleUpdateTick = 0
	MyHero = nil
	MyPlayer = nil
	OppositeTeam = nil
	TempHeroesOnUpdate = nil
	ScreenWidth = nil
	ScreenHeight = nil
	SkillsTracker.FontCooldown = nil
	SkillsTracker.NeedInit = true
	collectgarbage("collect")
	
	Console.Print("\n==============================================\n")
	Console.Print("Script: SkillsTracker | Callback: OnGameEnd()\n")
	Console.Print("Current Time: " .. (os.date("%Y-%m-%d %I:%M %p")))
	Console.Print("==============================================\n\n")
end

local function roundToNthDecimal(num, n)
	local mult = 10 ^ (n or 0)
	return MathFloor(num * mult + 0.5) / mult
end

function SkillsTracker.OnMenuOptionChange(option, old, new)
	if option == SkillsTracker.Size then
		if Engine.IsInGame() == false then return end
		
		SkillsTracker.FontCooldown = Renderer.LoadFont("monospaceNumbersFont", MathFloor((Menu.GetValue(SkillsTracker.Size) * 0.45)), Enum.FontWeight.BOLD)
	end
end

function SkillsTracker.OnUpdate()
	if Menu.IsEnabled(SkillsTracker.OptionEnable) == false then return end
	
	if SkillsTracker.NeedInit == true then
		StackList = {}
		
		CurrentTick = 0
		ScheduleUpdateTick = 0
		MyHero = Heroes.GetLocal()
		MyPlayer = Players.GetLocal()
		TempHeroesOnUpdate = nil
		
		OppositeTeam = 2
		
		if Entity.GetTeamNum(MyHero) == 2 then
			OppositeTeam = 3
		end
		
		ScreenWidth, ScreenHeight = Renderer.GetScreenSize()
		
		SkillsTracker.FontCooldown = Renderer.LoadFont("monospaceNumbersFont", MathFloor((Menu.GetValue(SkillsTracker.Size) * 0.45)), Enum.FontWeight.BOLD)
		
		SkillsTracker.NeedInit = false
	end
	
	if MyHero == nil then return end
	
	CurrentTick = os.clock()
	
	if ScheduleUpdateTick < CurrentTick then
		local EnumIndex = nil
		local TargetAbility = nil
	
		for i = 1, Heroes.Count() do
			TempHeroesOnUpdate = Heroes.Get(i) or nil
			
			if TempHeroesOnUpdate ~= nil 
			and Entity.IsDormant(TempHeroesOnUpdate) == false 
			and Entity.IsAlive(TempHeroesOnUpdate) 
			and Entity.IsSameTeam(MyHero, TempHeroesOnUpdate) == false 
			and NPC.IsIllusion(TempHeroesOnUpdate) == false 
			and Entity.IsPlayer(Entity.GetOwner(TempHeroesOnUpdate))
			and SpellList[NPC.GetUnitName(TempHeroesOnUpdate)] ~= nil 
			then
				if StackList[Hero.GetPlayerID(TempHeroesOnUpdate)] == nil then
					StackList[Hero.GetPlayerID(TempHeroesOnUpdate)] = {}
					
					StackList[Hero.GetPlayerID(TempHeroesOnUpdate)].Id = Hero.GetPlayerID(TempHeroesOnUpdate)
					
					StackList[Hero.GetPlayerID(TempHeroesOnUpdate)].UnitName = NPC.GetUnitName(TempHeroesOnUpdate)
					
					for i = 1, SpellList[NPC.GetUnitName(TempHeroesOnUpdate)].total do
						EnumIndex = SpellList[NPC.GetUnitName(TempHeroesOnUpdate)].index[i]
						TargetAbility = NPC.GetAbilityByIndex(TempHeroesOnUpdate, EnumIndex)
						
						--Console.Print(Ability.GetName(TargetAbility))
						
						StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]['Spell' .. i ..'Level'] = Ability.GetLevel(TargetAbility)
						
						--StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]["Spell" .. i .."TextureName"] = Ability.GetName(TargetAbility) .. "_png.png"
					
						StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]["Spell" .. i .."ImageHandle"] = Renderer.LoadImage("~/rounded/" .. Ability.GetName(TargetAbility) .. "_png.png")
					
						StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]["Cooldown" .. i] = Ability.GetCooldown(TargetAbility)
					
						StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]["Cooldown".. i .."EndAt"] = GameRules.GetGameTime() + Ability.GetCooldown(TargetAbility)
					end
				
				else
					for i = 1, SpellList[NPC.GetUnitName(TempHeroesOnUpdate)].total do
						EnumIndex = SpellList[NPC.GetUnitName(TempHeroesOnUpdate)].index[i]
						TargetAbility = NPC.GetAbilityByIndex(TempHeroesOnUpdate, EnumIndex)
						
						StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]["Spell" .. i .."Level"] = Ability.GetLevel(TargetAbility)
					
						StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]["Cooldown" .. i] = Ability.GetCooldown(TargetAbility)
					
						StackList[Hero.GetPlayerID(TempHeroesOnUpdate)]["Cooldown".. i .."EndAt"] = GameRules.GetGameTime() + Ability.GetCooldown(TargetAbility)
					end
				end
			end
		end
		
		-- Update every 2 second
		ScheduleUpdateTick = CurrentTick + 1.5
	end
end

function SkillsTracker.GetCooldownXcenter(text, xCoor)
	local TextWidth, TextHeight = Renderer.MeasureText(SkillsTracker.FontCooldown, text)
	
	return (xCoor + MathFloor((Menu.GetValue(SkillsTracker.Size) - TextWidth) * 0.5 + 0.5) )
end

function SkillsTracker.GetCooldownYcenter(text, yCoor)
	local TextWidth, TextHeight = Renderer.MeasureText(SkillsTracker.FontCooldown, text)
	
	return (yCoor + MathFloor((Menu.GetValue(SkillsTracker.Size) - TextHeight) * 0.5 + 0.5) )
end

function SkillsTracker.GetPosX(id)
	if OppositeTeam == 3 then
		return MathFloor((ScreenWidth * 0.5) + 0.5) + ((id - 5) * Menu.GetValue(SkillsTracker.DividerOffset)) + Menu.GetValue(SkillsTracker.OffsetX)
	else
		return MathFloor((ScreenWidth * 0.5) + 0.5) - ((4 - id) * Menu.GetValue(SkillsTracker.DividerOffset)) + Menu.GetValue(SkillsTracker.OffsetXRadiant)
	end
end

local function GetColor(level)
	if level < 1 then
		return Renderer.SetDrawColor(128, 128, 128, 255)
	else
		return Renderer.SetDrawColor(255, 255, 255, 255)
	end
end

function SkillsTracker.OnDraw()
	if Menu.IsEnabled(SkillsTracker.OptionEnable) == false then return end
	if Engine.IsInGame() == false then return end
	if GameRules.GetGameState() < 4 then return end
	if GameRules.GetGameState() > 5 then return end
	if SkillsTracker.NeedInit == true then return end
	if MyHero == nil then return end
	
	-- Need to stop drawing when update data happens.
	if ScheduleUpdateTick < CurrentTick then return end
	
	local HeightAdjust = nil
	local CoorXTarget = nil
	local CoorYTarget = nil
	
	for _, value in pairs(StackList) do
		if value ~= nil then
			
			for i = 1, SpellList[value.UnitName].total do
				HeightAdjust = 0
				
				if i > 1 then
					HeightAdjust = (Menu.GetValue(SkillsTracker.Size) * (i - 1)) + (5 * (i - 1))
				end
				
				if value["Cooldown" .. i] == 0.0 then
					GetColor(value["Spell" .. i .. "Level"])
					--Renderer.DrawImage("~/rounded/" .. value['Spell' .. i .. 'TextureName'], SkillsTracker.GetPosX(value.Id), Menu.GetValue(SkillsTracker.HeightOffset) + HeightAdjust, Menu.GetValue(SkillsTracker.Size), Menu.GetValue(SkillsTracker.Size))
					
					Renderer.DrawImage(value['Spell' .. i .. 'ImageHandle'], SkillsTracker.GetPosX(value.Id), Menu.GetValue(SkillsTracker.HeightOffset) + HeightAdjust, Menu.GetValue(SkillsTracker.Size), Menu.GetValue(SkillsTracker.Size))
				else
					if value['Cooldown' .. i .. 'EndAt'] < GameRules.GetGameTime() then
						value['Cooldown' .. i] = 0.0
					end
					
					Renderer.SetDrawColor(255, 150, 150, 255)
					--Renderer.DrawImage("~/rounded/" .. value['Spell' .. i .. 'TextureName'], SkillsTracker.GetPosX(value.Id), Menu.GetValue(SkillsTracker.HeightOffset) + HeightAdjust, Menu.GetValue(SkillsTracker.Size), Menu.GetValue(SkillsTracker.Size))
					Renderer.DrawImage(value['Spell' .. i .. 'ImageHandle'], SkillsTracker.GetPosX(value.Id), Menu.GetValue(SkillsTracker.HeightOffset) + HeightAdjust, Menu.GetValue(SkillsTracker.Size), Menu.GetValue(SkillsTracker.Size))
					
					
					CoorXTarget = SkillsTracker.GetCooldownXcenter(roundToNthDecimal((value['Cooldown' .. i .. 'EndAt'] - GameRules.GetGameTime()), 1), SkillsTracker.GetPosX(value.Id))
					CoorYTarget = SkillsTracker.GetCooldownYcenter(roundToNthDecimal((value['Cooldown' .. i .. 'EndAt'] - GameRules.GetGameTime()), 1), Menu.GetValue(SkillsTracker.HeightOffset) + HeightAdjust)
					
					Renderer.SetDrawColor(255, 255, 255, 255)
					Renderer.DrawText(SkillsTracker.FontCooldown, CoorXTarget, CoorYTarget, roundToNthDecimal((value['Cooldown' .. i .. 'EndAt'] - GameRules.GetGameTime()), 1), shadow)
			
				end
			end
		end
	end
end

return SkillsTracker