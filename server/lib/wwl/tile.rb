require 'rubygems'
require 'constructor'
require 'tile_multiplier'

class Tile
  constructor :letter, :tile_multiplier, :accessors => true do
    @letter = ' '
    @tile_multiplier = TileMultiplier.new
  end
end