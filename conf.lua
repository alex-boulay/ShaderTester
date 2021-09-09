ACTUALW=1024
ACTUALH=768

function love.conf(t)
    t.window.width = 1024
    t.window.height = 768
    t.window.resizable=true
    t.window.fullscreentype = "desktop"
    t.window.vsync = 0 --desactivated
end
