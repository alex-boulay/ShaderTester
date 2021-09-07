Lighting = Class{}

function Lighting:init(data)
  self.lights data.lights or {}
  self.buffers={}
  self.itemtree={}
end

function Lighting:addLight(l)
  table.insert(self.lights,l)
end

function Lighting:addItems()
end

-- must be called after updating all position
function Lighting:update()
  

end

function Lighting:lightCanvas()

end
