Lighting = Class{}

function Lighting:init(data)
  self.lights=data.lights or {}
  self.obstruct=data.obstruct or {}
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

function Lighting:drawLights()
  for k,light in pairs(self.lights) do
    light:send(shader)
    love.graphics.setShader(shader)
  end
end

function Lighting:Obs()

end
