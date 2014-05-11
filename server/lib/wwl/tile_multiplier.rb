require 'rubygems'
require 'constructor'

class TileMultiplier
  constructor :letter, :word, :accessors => true do
    @letter = 1
    @word = 1
  end
end