require 'lamp'
require 'tunnel'
require 'workroomprds'

function love.load()
    love.window.setMode(400, 240)  -- PlayDate size
    love.window.setTitle("Playdate black box puzzles")

    love.graphics.setColor(0, 0, 0)
    local grey = 222/255
    love.graphics.setBackgroundColor(grey, grey, grey)

    large_font = love.graphics.newFont("JetBrainsMono-Medium.ttf", 20)
    main_font = love.graphics.newFont("JetBrainsMono-Medium.ttf", 14)
    
    love.keyboard.setKeyRepeat(true)

    -- Playdate puzzle 001

    lamp_a = define_lamp(true, 95, 50, 25)
    lamp_b = define_lamp(true, 35, 110, 25)
    lamp_c = define_lamp(false, 95, 110, 25)
    lamp_d = define_lamp(false, 155, 110, 25)

    lamp_z = define_lamp(true, 95, 200, -20)

    tunnel_1 = define_tunnel(true, 300, 110, 0, 10, 75, 2)

    -- Workroomprds Black Box Piuzzle 22
    setup_puzzle_22()
    t_since_last_update = 0  -- ToDo: remove?

    game_state = "title_screen"
end

function love.update(dt)
    t_since_last_update = t_since_last_update + dt
    
    
    if game_state == "puzzle_001" then
        if t_since_last_update >= 0.05 then
            grow_tunnel(tunnel_1)

            t_since_last_update = 0
        end
    elseif game_state == "bb_puzzle22" then
        update_puzzle_22()
    end

end

function love.draw()
    if game_state == "title_screen" then
        love.graphics.print("Playdate Black Box Puzzles", large_font, 40, 120, -0.25)
        love.graphics.print("inspired by blackboxpuzzles.workroomprds.com", main_font, 30, 150, -0.25)
    elseif game_state == "puzzle_001" then
        love.graphics.print("Playdate Black Box Puzzle 001", 0, 0)
        draw_lamp(lamp_a)
        draw_lamp(lamp_b)
        draw_lamp(lamp_c)
        draw_lamp(lamp_d)

        draw_lamp(lamp_z)

        draw_tunnel(tunnel_1)
    elseif game_state == "bb_puzzle22" then
        draw_puzzle_22()

    end

end

function love.keypressed(key, isrepeat)
    if game_state == "title_screen" then
        if key == "space" then
            -- game_state = "puzzle_001"
            game_state = "bb_puzzle22"
            t_since_last_update = 0
        end

    elseif game_state == "puzzle_001" then
            if key == "up" then
                toggle_lamp(lamp_a)
            end
            if key == "down" then
                toggle_lamp(lamp_d)
            end
            if key == "left" then
                toggle_lamp(lamp_b)
            end
            if key == "right" then
                toggle_lamp(lamp_c)
            end

            if key == "a" and tunnel_1['growth'] < 0 then
                tunnel_1['growth'] = -tunnel_1['growth']
            end
            if key == "s" and tunnel_1['growth'] > 0 then
                tunnel_1['growth'] = -tunnel_1['growth']
            end

    elseif game_state == "bb_puzzle22" then
        keypressed_puzzle_22(key)
    end


    if key == "escape" then
          love.event.quit()
    end

end
