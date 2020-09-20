local GamestateManager = {}

local states = {}
local current_state
local previous_state

function GamestateManager.init(state)
	current_state = state:new(GamestateManager)
	current_state:set_active(true)
	table.insert(states, current_state)
end

function GamestateManager.switch(next_state)
	previous_state = current_state
	table.remove(states, 1)
	current_state = next_state:new(GamestateManager)
	current_state:set_active(true)
	table.insert(states, current_state)

	print("Switched from " .. previous_state:get_id() .. " to " .. current_state:get_id())
end

function GamestateManager.update(dt)
	for _, state in ipairs(states) do
		if state:get_active() then
			state:update(dt)
		end
	end
end

function GamestateManager.draw()
	for _, state in ipairs(states) do
		if state:get_active() then
			state:draw()
		end
	end
end

function GamestateManager.mousepressed(mx, my, mb)
	for _, state in ipairs(states) do
		if state:get_active() then
			state:mousepressed(mx, my, mb)
		end
	end
end

function GamestateManager.keypressed(key)
	for _, state in ipairs(states) do
		if state:get_active() then
			state:keypressed(key)
		end
	end
end

return GamestateManager
