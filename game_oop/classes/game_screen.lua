local Scene = require("classes.base.scene")
local GameScreen = Scene:extend()

function GameScreen:new(manager)
	GameScreen.super.new(self, "game_screen", manager)
end

function GameScreen:keypressed(key)
	local pause_screen = self.manager:get("pause_screen")

	if key == "escape" then
		pause_screen:set_active(not pause_screen:get_active())
	end
end

return GameScreen
