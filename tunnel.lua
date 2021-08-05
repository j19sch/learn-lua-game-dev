function define_tunnel(state, x, y, radius, min_rad, max_rad, growth)
    local tunnel = {}
    tunnel['x'] = x
    tunnel['y'] = y
    tunnel['radius'] = radius
    tunnel['min_rad'] = min_rad
    tunnel['max_rad'] = max_rad
    tunnel['growth'] = growth

    return tunnel
end


function draw_tunnel(tunnel)
    love.graphics.circle("fill", tunnel['x'], tunnel['y'], tunnel['radius'])
end


function grow_tunnel(tunnel)
    tunnel['radius'] = tunnel['radius'] + tunnel['growth']

    if tunnel['radius'] >= tunnel['max_rad'] then
        tunnel['radius'] = tunnel['max_rad']
    elseif tunnel['radius'] <= tunnel['min_rad']
        then tunnel['radius'] = tunnel['min_rad']
    end
end
