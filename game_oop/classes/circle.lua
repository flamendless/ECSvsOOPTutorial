local Shape = require("classes.base.shape")
local Circle = Shape:extend()

function Circle:new(radius)
	Circle.super.new(self, "circle")
	self.radius = radius
end

function Circle:update(dt)
	Circle.super.move(self, dt)

	--check out of bounds
	local oob_left = self.x + self.radius < 0 --left edge
	local oob_right = self.x > love.graphics.getWidth() --right edge
	local oob_top = self.y + self.radius < 0 --top edge
	local oob_bottom = self.y > love.graphics.getHeight() --bottom edge
end

function Circle:mousepressed(mx, my, mb)
	if not (mb == 1) then return end

	local dx = mx - self.x
	local dy = my - self.y
	local d = math.sqrt((dx * dx) + (dy * dy))
	local is_clicked = d <= self.radius

	if is_clicked then
		self.is_clicked = not self.is_clicked
	end

	return self.is_clicked
end

function Circle:draw()
	if self.is_clicked then
		love.graphics.setColor(self.outline_color)
		love.graphics.circle("fill", self.x, self.y, self.radius + self.offset, self.radius)
	end

	love.graphics.setColor(self.color)
	love.graphics.circle("fill", self.x, self.y, self.radius, self.radius)
end

return Circle
