require 'rubygems'
require 'constructor'

class Game
  constructor :name, :player1, :player2, :board, :letter_generator,
              :accessors => true
end