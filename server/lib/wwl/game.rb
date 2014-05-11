require 'rubygems'
require 'constructor'
require 'board'

class Game
  constructor :name, :player1, :player2, :board, :letter_generator,
              :accessors => true do
      @board = Board.new
  end
end