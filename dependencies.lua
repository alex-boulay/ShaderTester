Class = require 'class'
local curr_dir=love.filesystem.getRealDirectory("")
package.path = package.path .. ";"..curr_dir .."../MathStructs/?.lua"
require "MathStructs"
require 'LightSource'
require 'TileObs'
require 'Lighting'
