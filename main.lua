require 'dependencies'

function love.load()
  shader = love.graphics.newShader("Light.glsl" )
  light= LightSource{
    type="circular",
    position={x=300,y=300},
    radius=250}
  tile = TileObs(150,150)

end


function love.update(dt)
  light:update(love.mouse.getPosition())
end

function love.focus(t)
  if t and love.window.isMaximized() then
    love.window.restore()
    love.window.maximize()
  end
end

function love.draw()

  love.graphics.setColor(0.2,0.2,0)
  love.graphics.rectangle("fill", 0,0,ACTUALW,ACTUALH)

  tile:Draw()
  light:send(shader)
  love.graphics.setShader(shader)

  love.graphics.setColor(1,1,0)
  for i,j in pairs(tile:findVertices()) do
    Segment(j,light.shape.c):Draw()
  end
end
