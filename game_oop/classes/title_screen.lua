local Scene = require("classes.base.scene")
local TitleScreen = Scene:extend()

local title = "Shape Clicker"
local str_play = "Press enter or space to play"
local str_quit = "Press escape to quit"
local font, font2
local window_width, window_height

function TitleScreen:new(manager)
	TitleScreen.super.new(self, "title_screen", manager)

	font = love.graphics.newFont(64)
	font2 = love.graphics.newFont(18)
	window_width, window_height = love.graphics.getDimensions()

	return self
end

function TitleScreen:draw()
	love.graphics.setColor(1, 0, 0, 1)
	love.graphics.setFont(font)

	love.graphics.print(title,
		window_width/2, window_height/2 - 32,
		0, 1, 1,
		font:getWidth(title)/2,
		font:getHeight(title)/2)

	love.graphics.setFont(font2)
	love.graphics.print(str_play,
		window_width/2, window_height/2 + 64,
		0, 1, 1,
		font2:getWidth(str_play)/2,
		font2:getHeight(str_play)/2)

	love.graphics.print(str_quit,
		window_width/2, window_height/2 + 96,
		0, 1, 1,
		font2:getWidth(str_quit)/2,
		font2:getHeight(str_quit)/2)
end

function TitleScreen:keypressed(key)
	if key == "enter" or key == "space" then
		local GameScreen = require("classes.game_screen")
		self.manager.switch(GameScreen)
	elseif key == "escape" then
		love.event.quit()
	end
end

return TitleScreen
