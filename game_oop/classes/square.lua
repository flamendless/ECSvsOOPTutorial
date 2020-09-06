local Shape = require("classes.rectangle")
local Square = Shape:extend()

function Square:new(size)
	Square.super.new(self, size, size, "square")
end

function Square:update(dt)
	Square.super.move(self, dt)
end

function Square:mousepressed(mx, my, mb)
	Square.super.mousepressed(self, mx, my, mb)
end

function Square:draw()
	Square.super.draw(self)
end

return Square
