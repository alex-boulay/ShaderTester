require 'dependencies'

function love.load()
  shader = lve.graphics.newShader("Light.glsl" )
  Lighting={
    lights={LightSource{
      type="circular",
      position={x=300,y=300},
      radius=250}},
    {tile = TileObs(150,150)}
  }
end

local timer1=0
local count=0
function love.update(dt)
  light:update(love.mouse.getPosition())
  if timer1<3 then
    timer1=timer1+dt
    count=count+1
  else
    print("Average time per frame : ",timer1/count*1000," MS \n")
    timer1=0
    count=0
  end
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


  love.graphics.setColor(1,1,0)
  for i,j in pairs(tile:findVertices()) do
    Segment(j,light.shape.c):Draw()
  end
end
