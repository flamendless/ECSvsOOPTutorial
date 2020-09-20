local Scene = require("classes.base.scene")
local PauseScreen = Scene:extend()

function PauseScreen:new(manager)
	PauseScreen.super.new(self, "pause_screen", manager)

	return self
end

function PauseScreen:keypressed(key)
	local game_screen = self.manager:get("game_screen")

	if key == "return" or key == "space" then
		self:set_active(false)
		game_screen:set_active(true)
	elseif key == "escape" then
		self:set_active(false)
		self.manager:switch("title_screen")
	end
end

return PauseScreen
