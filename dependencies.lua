Class = require 'class'
require 'LightSource'
local curr_dir=love.filesystem.getRealDirectory("")
print(curr_dir)
package.path = package.path .. ";"..curr_dir .."../MathStructs/?.lua"
require "MathStructs"
