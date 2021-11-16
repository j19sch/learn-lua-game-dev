function define_button(state, x, y, radius)
    local button = {}
    button['state'] = state
    button['x'] = x
    button['y'] = y
    button['radius'] = radius
    button['reset'] = 0.4
    button['reset-timer'] = 0

    return button
end

function draw_button(button)
    if button['state'] == true then
        love.graphics.circle("line", button['x'], button['y'], button['radius'])
        love.graphics.circle("fill", button['x'], button['y'], button['radius'] - 4)
    else
        love.graphics.circle("line", button['x'], button['y'], button['radius'])
        love.graphics.circle("line", button['x'], button['y'], button['radius'] - 4)
    end
end

function toggle_button(button)
    if button['state'] == true then
        button['state'] = false
    else
        button['state'] = true
        button_1['reset-timer'] = 0
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
