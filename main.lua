require 'dependencies'
screenbox = Rectangle(NullVec,Vector(love.window.getMode()))
function love.load()
  mainlight=LightSource{
    type="circular",
    position={x=300,y=300},
    radius=250}
  lighting=Lighting{
    lights={mainlight},
    obstruct={} ,--tile = TileObs(150,100)}
    screen=screenbox
  }
  for i=0,300,50 do
    table.insert(lighting.obstruct,TileObs(i,i,4))
  end

  screenproj=love.graphics.newCanvas()
end

local timer1=0
local count=0
function love.update(dt)
  mainlight:update(love.mouse.getPosition())
  if timer1<3 then
    timer1=timer1+dt
    count=count+1
  else
    timer1=0
    count=0
  end
end

function love.onresize(w,h)
  screenbox=Rectangle(NullVec,Vector(w,h))
end

function love.focus(t)
  if t and love.window.isMaximized() then
    love.window.restore()
    love.window.maximize()
  end
end

function love.draw()
  lighting:prep()
  love.graphics.setColor(1,0,1)
  love.graphics.rectangle("fill", 0,0,ACTUALW,ACTUALH)
  for k,val in pairs(lighting.obstruct) do
    val:Draw()
  end
  lighting:drawLights()


end
