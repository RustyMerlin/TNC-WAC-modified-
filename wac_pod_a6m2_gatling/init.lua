
include("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")


ENT.Sounds = {
	shoot = "Warkanum/minigun_shoot.wav",
	stop = "Warkanum/minigun_wind_stop.wav",
}


function ENT:fireBullet(pos)
	if !self:takeAmmo(1) then return end
	if not self.seat then return end
	local pos2=self.aircraft:LocalToWorld(pos+Vector(self.aircraft:GetVelocity():Length()*0.0,0,0))
	local ang=self.aircraft:GetAngles()+Angle(math.Rand(-1,1),math.Rand(-1,1),0)
	local b=ents.Create("wac_hc_a6m2_hebullet")
	b:SetPos(pos2)
	b:SetAngles(ang)
	b.col=Color(255,210,133)
	b.Speed=356
	b.Size=32.5
	b.Width=1.5
	b.Damage=36
	b.Radius=90
		b:Spawn()
	b.Owner=self.seat
	local effectdata=EffectData()
	effectdata:SetOrigin(self:LocalToWorld(pos))
	effectdata:SetAngles(ang)
	effectdata:SetScale(5)
	util.Effect("MuzzleEffect", effectdata)
end


function ENT:fire()
	if !self.shooting then
		self.shooting = true
		self.sounds.stop:Stop()
		self.sounds.shoot:Play()
	end

	if self.Sequential then
		self.currentPod = self.currentPod or 1
		self:fireBullet(self.Pods[self.currentPod], self:GetAngles())
		self.currentPod = (self.currentPod == #self.Pods and 1 or self.currentPod + 1)
	else
		for _, pos in pairs(self.Pods) do
			self:fireBullet(pos, self:GetAngles())
		end
	end

	self:SetNextShot(self:GetLastShot() + 60/self.FireRate)
end


function ENT:stop()
	if self.shooting then
		self.sounds.shoot:Stop()
		self.sounds.stop:Play()
		self.shooting = false
	end				
end
