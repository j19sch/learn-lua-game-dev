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
