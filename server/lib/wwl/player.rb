require 'rubygems'
require 'constructor'
require 'letter_generator'

class Player
  TRAY_SIZE = 7

  constructor :name, :letter_tray, :score, :letter_generator,
              :accessors => true do
    @score = 0
    @letter_tray = Array.new
  end

  # returns the letters the player currently has
  def letters
    while @letter_tray.size < TRAY_SIZE and @letter_generator.has_letters? do
      @letter_tray.push @letter_generator.letter
    end

    @letter_tray
  end
end