

LightSource =Class{}

function LightSource:init(data)
  self.shape=Circle(Vector(data.position.x,data.position.y),data.radius)
  self.color=data.color or {1,1,1}
  self.hasmoved=false --trying to optimise calculus for static lights
end

function LightSource:send(shader)
  shader:send("lightpos",{self.shape.c.x,self.shape.c.y})
  shader:send("lightradius",self.shape.r)
  shader:send("lightcolor",self.color)
end

function LightSource:update(x,y)
  if x~=self.shape.x or y~=self.shape.y then
    self.shape.c.x=x
    self.shape.c.y=y
    self.hasmoved=true
  else
    self.hasmoved=false
  end

  --[[ to implement

  trace their shadow polygons
  draw lighting
  ]]
end

function LightSource:Obsctructions(Olist)
  local inrange= self:inRange(Olist)
  local seglist={} --list of obstructing segments
  love.graphics.setColor(1,0,0)
  for k,obs in pairs(Olist) do
    for k1,seg in pairs(Olist:OpEgesP(self.shape.c))do
      table.insert(seglist,seg)
      print("Obsctructions :",seg)
      seg:Draw()
    end
  end
end

function LightSource:inRange(Olist)
  local inrange={}
  for k,obs in pairs(Olist) do
    print(self.shape:type(),obs:type())
    if MScollide(self.shape,obs)then
      table.insert(inrange,obs)
    end
  end
  return inrange
end
