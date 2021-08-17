

LightSource =Class{}

function LightSource:init(data)
  self.type=data.type
  self.position=data.position
  self.radius=data.radius
end

function LightSource:send(shader)
  shader:send("lightpos",{self.position.x,self.position.y})
  shader:send("lightradius",self.radius)
end
