function setup_puzzle_22()
    button_1 = define_button(false, 100, 110, 25)
    light_1 = define_light(false, 250, 110, 25)
end

function draw_puzzle_22()
    love.graphics.print("Black Box Puzzle 22", 0, 0)
    draw_button(button_1)
    draw_light(light_1)
end

function update_puzzle_22()
    if t_since_last_update >= 0.5 and button_1['state'] == true then -- this does not work with 1 instead 0f 0.5
        toggle_button(button_1)
        t_since_last_update = 0
    end
end

function keypressed_puzzle_22(key)
    if key == "up" then
        toggle_light(light_1)
        toggle_button(button_1)
    end
end

function define_button(state, x, y, radius)
    local button = {}
    button['state'] = state
    button['x'] = x
    button['y'] = y
    button['radius'] = radius

    return button
end

function draw_button(button)
    if button['state'] == true then
        love.graphics.circle("fill", button['x'], button['y'], button['radius'])
    else
        love.graphics.circle("line", button['x'], button['y'], button['radius'])
    end
end

function toggle_button(button)
    if button['state'] == true then
        button['state'] = false
    else
        button['state'] = true
    end
end


function define_light(state, x, y, radius)
    local light = {}
    light['state'] = state
    light['x'] = x
    light['y'] = y
    light['radius'] = radius

    return light
end

function draw_light(light)
    if light['state'] == true then
        love.graphics.circle("fill", light['x'], light['y'], light['radius'])
    else
        love.graphics.circle("line", light['x'], light['y'], light['radius'])
    end
end


function toggle_light(light)
    if light['state'] == true then
        light['state'] = false
    else
        light['state'] = true
    end
end
