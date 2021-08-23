

LightSource =Class{}

function LightSource:init(data)
  self.shape=Circle(Vector(data.position.x,data.position.y),data.radius)
  self.color=data.color or {1,1,1}
end

function LightSource:send(shader)
  shader:send("lightpos",{self.shape.c.x,self.shape.c.y})
  shader:send("lightradius",self.shape.r)
  shader:send("lightcolor",self.color)
end

function LightSource:update(x,y)
  self.shape.c.x=x
  self.shape.c.y=y
end
