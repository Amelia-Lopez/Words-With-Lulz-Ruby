require 'rubygems'
require 'constructor'

class Player
  TRAY_SIZE = 7

  constructor :name, :letter_tray, :score, :letter_generator,
              :accessors => true

  # returns the letters the player currently has
  def letters
    while @letter_tray.size < TRAY_SIZE and @letter_generator.has_letters? do
      @letter_tray.push @letter_generator.letter
    end

    @letter_tray
  end
end