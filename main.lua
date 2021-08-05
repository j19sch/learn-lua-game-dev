-- x = 500
-- y = 200

-- love.keyboard.setKeyRepeat(true)

-- lamp_a_state = true

lamp_a = {}
lamp_a['state'] = true
lamp_a['x'] = 100
lamp_a['y'] = 100
lamp_a['radius'] = 50

lamp_b = {}
lamp_b['state'] = true
lamp_b['x'] = 200
lamp_b['y'] = 200
lamp_b['radius'] = 50

function love.draw()
    -- love.graphics.print("Hello World", x, y)

    if lamp_a['state'] == true then
        love.graphics.circle("fill", lamp_a['x'], lamp_a['y'], lamp_a['radius'])
    else
        love.graphics.circle("line", lamp_a['x'], lamp_a['y'], lamp_a['radius'])
    end

    if lamp_b['state'] == true then
        love.graphics.circle("fill", lamp_b['x'], lamp_b['y'], lamp_b['radius'])
    else
        love.graphics.circle("line", lamp_b['x'], lamp_b['y'], lamp_b['radius'])
    end
end

function love.keypressed(key, isrepeat)
    if key == "up" then
        lamp_a['state'] = true
    elseif key == "down" then
        lamp_a['state'] = false
    end

    if key == "left" then
        lamp_b['state'] = true
    elseif key == "right" then
        lamp_b['state'] = false
    end

    -- if key == "right" then
    --     x = x + 5
    -- elseif key == "left" then
    --     x = x - 5
    -- end

    -- if key == "up" then
    --     y = y - 5
    -- end

    -- if key == "down" then
    --     y = y + 5
    -- end

    if key == "escape" then
      love.event.quit()
    end

end
