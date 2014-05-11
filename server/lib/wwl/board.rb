require 'rubygems'
require 'constructor'
require 'matrix'

class Board
  TILE_COUNT = 15

  constructor :tiles, :accessors => true do
    @tiles = Matrix.build(TILE_COUNT, TILE_COUNT) {|_,_| Tile.new}
  end
end