

LightSource =Class{}

function LightSource:init(data)
  self.shape=Circle(Vector(data.position.x,data.position.y),data.radius)
end

function LightSource:send(shader)
  shader:send("lightpos",{self.shape.c.x,self.shape.c.y})
  shader:send("lightradius",self.r)
end

function
