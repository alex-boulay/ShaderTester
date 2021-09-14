Class = require 'class'
local curr_dir=love.filesystem.getRealDirectory("")
package.path = package.path .. ";"..curr_dir .."../MathStructs/?.lua"
package.path = package.path .. ";"..curr_dir .."../Lighting/?.lua"

require 'MathStructs'
require 'LightSource'
require 'Lighting'
require 'TileObs'
