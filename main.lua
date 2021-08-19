require 'dependencies'

function love.load()
  shader = love.graphics.newShader("Light.glsl" )
  light= LightSource{
    type="circular",
    position={x=300,y=300},
    radius=250}

  boxes = Rectangle(Vector(ACTUALW/2,ACTUALH/2),Vector(450,250))





end

function love.update(dt)
  light:update(love.mouse.getPosition())
end

function love.draw()
  love.graphics.setColor(0.2,0.2,0)
  love.graphics.rectangle("fill", 0,0,ACTUALW,ACTUALH)

  love.graphics.setColor(0,0.8,0)
  love.graphics.rectangle("fill",box.c.x,box.c.y,box.s.x,box.s.y)
  light:send(shader)
  love.graphics.setShader(shader)
end
