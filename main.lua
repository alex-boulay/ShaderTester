require 'dependencies'

function love.load()
  shader = love.graphics.newShader("Light.glsl" )
  objlist = generateObj()
  light= LightSource{
    type="circular",
    position={x=300,y=300},
    radius=250}





end

function love.update(dt)
end

function love.draw()
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("fill", 0,0,ACTUALW,ACTUALH)
  light:send(shader)
  love.graphics.setShader(shader)
end

function generateObj()
  tab={
  }
  table.insert(tab,S)
