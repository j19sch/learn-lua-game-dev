require 'lamp'
require 'tunnel'

function love.load()
    love.keyboard.setKeyRepeat(true)

    lamp_a = define_lamp(true, 200, 100, 50)
    lamp_b = define_lamp(true, 125, 200, 50)
    lamp_c = define_lamp(false, 275, 200, 50)
    lamp_d = define_lamp(false, 200, 300, 50)

    lamp_z = define_lamp(true, 400, 100, -20)

    tunnel_1 = define_tunnel(true, 550, 200, 30, 10, 75, 2)

    t_since_last_update = 0
end

function love.update(dt)
    t_since_last_update = t_since_last_update + dt
    
    if t_since_last_update >= 0.05 then
        grow_tunnel(tunnel_1)

        t_since_last_update = 0
    end

end

function love.draw()

    love.graphics.print("Black Box Puzzle 001", 0, 0)

    draw_lamp(lamp_a)
    draw_lamp(lamp_b)
    draw_lamp(lamp_c)
    draw_lamp(lamp_d)

    draw_lamp(lamp_z)

    draw_tunnel(tunnel_1)

end

function love.keypressed(key, isrepeat)
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

    if key == "escape" then
      love.event.quit()
    end

end
