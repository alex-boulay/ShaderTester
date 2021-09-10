require 'dependencies'

function love.load()
  shader = love.graphics.newShader("Light.glsl" )
  mainlight=LightSource{
    type="circular",
    position={x=300,y=300},
    radius=250}
  lighting=Lighting{
    lights={mainlight},
    obstruct={tile = TileObs(150,150)}
  }
end

local timer1=0
local count=0
function love.update(dt)
  mainlight:update(love.mouse.getPosition())
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

  for k,val in pairs(lighting.obstruct) do
    val:Draw()
    love.graphics.setColor(1,1,0)
    for i,j in pairs(val:findVertices()) do
      Segment(j,mainlight.shape.c):Draw()
    end
  end
  lighting:drawLights()
end
