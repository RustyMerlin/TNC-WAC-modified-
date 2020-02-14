if not wac then return end
if SERVER then AddCSLuaFile('shared.lua') end
ENT.Base 				= "wac_pl_base"
ENT.Type 				= "anim"
ENT.Category			= "TNC Wac"
ENT.PrintName			= "Mitsubishi A6M2 Zero"
ENT.Author				= "Nemesis"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

ENT.Model	    = "models/sentry/a6m2.mdl"
ENT.RotorPhModel	= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel	= "models/sentry/a6m2_prop.mdl"

ENT.rotorPos	= Vector(101,0,74)
ENT.TopRotorDir	= 1

ENT.EngineForce	= 550
ENT.Weight	    = 3350
ENT.SeatSwitcherPos	= Vector(0,0,0)
ENT.AngBrakeMul	= 0.015
ENT.SmokePos	= Vector(101,0,74)
ENT.FirePos	    = Vector(101,0,74)

if CLIENT then
	ENT.thirdPerson = {
		distance = 550
	}
end

ENT.Agility = {
	Thrust = 14.5
}

ENT.Wheels={
	{
		mdl="models/sentry/a6m2_bw.mdl",
		pos=Vector(-205.5,0,59.75),
		friction=10,
		mass=600,
	},
	{
		mdl="models/sentry/a6m2_fw.mdl",
		pos=Vector(42,68,12),
		friction=10,
		mass=550,
	},
	{
		mdl="models/sentry/a6m2_fw.mdl",
		pos=Vector(42,-68,12),
		friction=10,
		mass=550,
	},
}

ENT.Seats = {
	{
		pos=Vector(2.5,0,70.23),
		exit=Vector(10,59,85),
		weapons={"Type 97 and Type 99-1"}
	},
}

ENT.Weapons = {
	["Type 97 and Type 99-1"] = {
		class = "wac_pod_a6m2_gatling",
		info = {
			Pods = {
				Vector(95,8.9,110),
				Vector(95,-8.9,110),
				Vector(95,-86.5,72),
				Vector(95,86.5,72)
			},
			FireRate = 500,
			Sequential = true,
			Sounds = {
				shoot = "a6m2/gun2.wav",
				stop = "a6m2/gun2_stop.wav"
			}
		}
	},
}

ENT.Sounds={
	Start="a6m2/Start.wav",
	Blades="a6m2/external.wav",
	Engine="a6m2/internal.wav",
	MissileAlert="",
	MissileShoot="",
	MinorAlarm="",
	LowHealth="",
	CrashAlarm=""
}


function ENT:DrawPilotHud() end
function ENT:DrawWeaponSelection() end
