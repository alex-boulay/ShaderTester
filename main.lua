require 'dependencies'

function love.load()
  shader = love.graphics.newShader("Light.glsl" )
  light= LightSource{
    type="circular",
    position={x=300,y=300},
    radius=250}
  box =
    Rectangle(Vector(ACTUALW/2,ACTUALH/2),Vector(450,250))

end

local lastvisibility= false
function love.visible(v)
  if lastvisibility~=v then
    if v then
      print("visible\n")
    else
      print("invisible\n")
    end
    lastvisibility=v
  end
end

function love.focus(t)
  if t and love.window.isMaximized() then
    love.window.restore()
    love.window.maximize()
  end
end

local timer1= 0
function love.update(dt)
  light:update(love.mouse.getPosition())
  if love.keyboard.isDown("e") then
    love.window.maximize()
  end
  if love.keyboard.isDown("r") then
    love.window.minimize()
  end
  timer1=timer1+dt
  if timer1 > 1 then
    timer1 =0
    print(love.mouse.getPosition())
    print(love.mouse.getRelativeMode( ))
  end
end

function love.draw()

  love.graphics.setColor(0.2,0.2,0)
  love.graphics.rectangle("fill", 0,0,ACTUALW,ACTUALH)

  love.graphics.setColor(0,0.8,0)
  love.graphics.rectangle("fill",box.c.x,box.c.y,box.s.x,box.s.y)
  light:send(shader)
  love.graphics.setShader(shader)

  love.graphics.setColor(1,1,0)
  for i,j in pairs(box:findVertices()) do
    Segment(j,light.shape.c):Draw()
  end
end
