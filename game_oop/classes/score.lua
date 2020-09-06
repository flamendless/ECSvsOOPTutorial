local Class = require("modules.classic")
local Score = Class:extend()

local function compare_color(a, b)
	return a[1] == b[1] and
		a[2] == b[2] and
		a[3] == b[3]
end

function Score:new(color_score, shape_score, both_score)
	self.color_score = color_score
	self.shape_score = shape_score
	self.both_score = both_score
	self.score = 0
end

function Score:update_clicked(obj)
	if self.clicked1 and self.clicked1 ~= obj then
		self.clicked2 = obj
		self:check_score()
	else
		self.clicked1 = obj
	end
end

function Score:check_score()
	if self.clicked1 and self.clicked2 then
		local shape1 = self.clicked1:getShapeType()
		local shape2 = self.clicked2:getShapeType()
		local color1 = self.clicked1:getColor()
		local color2 = self.clicked2:getColor()

		local same_color = false
		local same_shape = false

		if compare_color(color1, color2) then
			self.score = self.score + self.color_score
			same_color = true
		end

		if shape1 == shape2 then
			self.score = self.score + self.shape_score
			same_shape = true
		end

		if same_color and same_shape then
			self.score = self.score + self.both_score
		end

		self.clicked1:destroy()
		self.clicked2:destroy()

		self.clicked1 = nil
		self.clicked2 = nil
	end
end

function Score:draw()
	love.graphics.setColor(1, 0, 0, 1)
	love.graphics.print("Score: " .. self.score, 8, 8)
end

return Score
