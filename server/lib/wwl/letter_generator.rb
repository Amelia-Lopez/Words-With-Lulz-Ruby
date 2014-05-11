
class LetterGenerator

  def initialize
    @bag_of_letters = Array.new
  end

  # returns a letter from the bag randomly
  def letter
    'T'
  end

  # returns whether or not there are still letters in the bag
  def has_letters?
    true
  end
end