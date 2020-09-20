local Class = require("modules.classic")
local Scene = Class:extend()

function Scene:new(id, manager)
	self.id = id
	self.manager = manager
	self.is_active = false
end

function Scene:set_active(bool)
	self.is_active = bool
end

function Scene:get_active() return self.is_active end

return Scene
