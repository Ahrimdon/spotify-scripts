local mp = require 'mp'

local last_press = 0
local timeout = 0.4  -- seconds for double tap

mp.add_key_binding(nil, "smart-prev", function()
    local now = mp.get_time()

    if now - last_press < timeout then
        mp.commandv("playlist-prev")
        last_press = 0
    else
        mp.commandv("seek", "0", "absolute")
        last_press = now
    end
end)
