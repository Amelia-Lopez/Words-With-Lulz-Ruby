require 'rubygems'
require 'constructor'

class Tile
  constructor :letter, :tile_multiplier, :accessors => true

  def to_s
    letter
  end
end