local Shapes = {
	Rectangle = require("classes.rectangle"),
	Square = require("classes.square"),
	Circle = require("classes.circle"),
}
local Spawner = require("classes.spawner")
local Score = require("classes.score")
local score = Score(2, 4, 8)

local spawners = {}
local shapes = {}

local rectangle_spawner = Spawner(3, function()
	local rectangle = Shapes.Rectangle(64, 64)

	table.insert(shapes, rectangle)
end)

local square_spawner = Spawner(3, function()
	local square = Shapes.Square(48)

	table.insert(shapes, square)
end)

local circle_spawner = Spawner(3, function()
	local circle = Shapes.Circle(32)

	table.insert(shapes, circle)
end)

table.insert(spawners, rectangle_spawner)
table.insert(spawners, square_spawner)
table.insert(spawners, circle_spawner)

function love.load()
	love.graphics.setBackgroundColor(1, 1, 1, 0.8)
end

function love.update(dt)
	for i, spawner in ipairs(spawners) do
		spawner:update(dt)
	end

	for i, obj in ipairs(shapes) do
		if obj:isClicked() then
			score:update_clicked(obj)
		end
	end

	--checking for destroyed shapes
	for i = #shapes, 1, -1 do
		local shape = shapes[i]

		if shape:isDestroyed() then
			table.remove(shapes, i)
		end
	end
end

function love.draw()
	for i, obj in ipairs(shapes) do
		obj:draw()
	end

	score:draw()
end

function love.mousepressed(mx, my, mb)
	for i, obj in ipairs(shapes) do
		obj:mousepressed(mx, my, mb)
	end
end

function love.keypressed(key)
	if key == "r" then
		love.event.quit("restart")
	end
end
