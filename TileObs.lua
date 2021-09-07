TileObs = Class{}
TILE_SIZE=16
TILE_VEC= Vector(TILE_SIZE,TILE_SIZE)
math.randomseed()

function TileObs:init(x,y,c)
  self.s= Rectangle(Vector(x,y),TILE_VEC)
  if c==nil then
    self.c={ math.random(),math.random() ,math.random()}
  else
    self.c=c
end

function TileObs:Draw()
  love.graphics.setColor(self.rc)
  self.s:Draw()
end
