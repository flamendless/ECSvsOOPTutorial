local Scene = require("classes.base.scene")
local TitleScreen = Scene:extend()

local title = "Shape Clicker"
local font
local window_width, window_height
local text_width, text_height

function TitleScreen:new(manager)
	TitleScreen.super.new(self, "title_screen", manager)

	font = love.graphics.newFont(32)
	window_width, window_height = love.graphics.getDimensions()
	text_width = font:getWidth(title)
	text_height = font:getHeight(title)
end

function TitleScreen:draw()
	love.graphics.setColor(1, 0, 0, 1)
	love.graphics.setFont(font)
	love.graphics.print(title,
		window_width/2, window_height/2,
		0, 1, 1,
		text_width/2, text_height/2)
end

function TitleScreen:keypressed(key)
	if key == "enter" or key == "space" then
		self.manager:switch("game_screen")
	elseif key == "escape" then
		love.event.quit()
	end
end

return TitleScreen
