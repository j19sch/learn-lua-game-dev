require 'ui-elements'

function setup_puzzle_22()
    button_1 = define_button(false, 100, 110, 25)
    light_1 = define_light(false, 250, 110, 25)
end

function draw_puzzle_22()
    love.graphics.print("Black Box Puzzle 22", 0, 0)
    draw_button(button_1)
    draw_light(light_1)
end

function update_puzzle_22(dt)
    button_1['reset-timer'] = button_1['reset-timer'] + dt

    if button_1['state'] == true and button_1['reset-timer'] >= button_1['reset'] then
        toggle_button(button_1)
    end
end

function keypressed_puzzle_22(key)
    if key == "up" then
        if button_1['state'] == false then
            toggle_button(button_1)
            toggle_light(light_1)
        end
    end
end
