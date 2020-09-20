local GamestateManager = require("gamestate_manager")

function love.load()
	love.graphics.setBackgroundColor(1, 1, 1, 0.8)

	local title_screen = require("classes.title_screen")
	GamestateManager.init(title_screen)
end

function love.update(dt)
	GamestateManager.update(dt)
end

function love.draw()
	GamestateManager.draw()
end

function love.mousepressed(mx, my, mb)
	GamestateManager.mousepressed(mx, my, mb)
end

function love.keypressed(key)
	GamestateManager.keypressed(key)
end
