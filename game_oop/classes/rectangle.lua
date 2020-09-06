local Shape = require("classes.base.shape")
local Rectangle = Shape:extend()

function Rectangle:new(width, height, shape_type)
	Rectangle.super.new(self, shape_type or "rectangle")
	self.width = width
	self.height = height
end

function Rectangle:update(dt)
	Rectangle.super.move(self, dt)

	--check out of bounds
	local oob_left = self.x + self.width < 0 --left edge
	local oob_right = self.x > love.graphics.getWidth() --right edge
	local oob_top = self.y + self.height < 0 --top edge
	local oob_bottom = self.y > love.graphics.getHeight() --bottom edge
end

function Rectangle:mousepressed(mx, my, mb)
	if not (mb == 1) then return end

	local is_clicked = mx >= self.x and mx <= self.x + self.width and
		my >= self.y and my <= self.y + self.height

	if is_clicked then
		self.is_clicked = not self.is_clicked
	end

	return self.is_clicked
end

function Rectangle:draw()
	if self.is_clicked then
		love.graphics.setColor(self.outline_color)
		love.graphics.rectangle("fill", self.x - self.offset, self.y - self.offset, self.width + self.offset * 2, self.height + self.offset * 2)
	end

	love.graphics.setColor(self.color)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Rectangle
