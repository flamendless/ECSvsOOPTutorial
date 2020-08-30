local class = require("modules.classic")
local Spawner = class:extend()

function Spawner:new(spawn_time, spawn)
	self.spawn_time = spawn_time
	self.spawn = spawn

	self.timer = 0
end

function Spawner:update(dt)
	self.timer = self.timer + dt

	if self.timer >= self.spawn_time then
		self.timer = 0
		self:spawn()
	end
end

return Spawner
