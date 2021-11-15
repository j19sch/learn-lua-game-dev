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
        love.graphics.circle("line", light['x'], light['y'], light['radius'])
        love.graphics.circle("fill", light['x'] + 1, light['y'] + 1, light['radius'] - 6)
    else
        love.graphics.circle("line", light['x'], light['y'], light['radius'])
        love.graphics.circle("line", light['x'] + 1, light['y'] + 1, light['radius'] - 6)
    end
end


function toggle_light(light)
    if light['state'] == true then
        light['state'] = false
    else
        light['state'] = true
    end
end
