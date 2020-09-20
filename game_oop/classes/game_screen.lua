local Scene = require("classes.base.scene")
local GameScreen = Scene:extend()

function GameScreen:new(manager)
	GameScreen.super.new(self, "game_screen", manager)

	return self
end

return GameScreen
