local class = require("modules.classic")
local Shape = class:extend()

local colors = {
	{1, 0, 0}, --red
	{0, 1, 0}, --green
	{0, 0, 1}, --blue
}

local function generate_random_color()
	local r = love.math.random(1, #colors)
	local color = colors[r]

	return {unpack(color)}
end

function Shape:new()
	local w, h = love.graphics.getDimensions()

	self.x = love.math.random(96, w - 96)
	self.y = love.math.random(96, h - 96)

 	--thanks @slime!
	self.direction = love.math.random() > 0.5 and 1 or -1

	self.speed = love.math.random(64, 320)
	self.color = generate_random_color()
	self.outline_color = {0, 0, 0, 1}
	self.offset = 4
	self.is_clicked = false
end

function Shape:move(dt)
	--moving
	local dx = self.x + self.speed * self.direction * dt
	local dy = self.y + self.speed * self.direction * dt

	self.x = dx
	self.y = dy
end

return Shape
