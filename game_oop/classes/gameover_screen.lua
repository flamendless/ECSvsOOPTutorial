local Scene = require("classes.base.scene")
local GameOverScreen = Scene:extend()

function GameOverScreen:new(manager)
	GameOverScreen.super.new(self, "game_screen", manager)
end

function GameOverScreen:keypressed(key)
	if key == "r" then
		self.manager:switch("game_screen")
	elseif key == "escape" then
		self.manager:switch("title_screen")
	end
end

return GameOverScreen
