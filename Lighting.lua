Lighting = Class{}

function Lighting:init(data)
  self.lights data.lights or {}
  self.buffers={}
end

function Lighting:addLight(l)
  table.insert(self.lights,l)
end
