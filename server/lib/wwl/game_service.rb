require 'in_memory_game_data_store'
require 'letter_generator'

class GameService
  @data_store = InMemoryGameDataStore.new

  # creates a new game and adds it to the data store, returns false if game
  # with the same name already exists
  def create_game(options)
    letter_generator = LetterGenerator.new
    player1 = Player.new(
        :name => options[:player1],
        :letter_generator => letter_generator)
    player2 = Player.new(
        :name => options[:player2],
        :letter_generator => letter_generator)
    game = Game.new(
        :name => options[:name],
        :letter_generator => letter_generator,
        :player1 => player1,
        :player2 => player2)

    @data_store.add game
  end

  # get information about the game with the specified game name and containing
  # the specified player name.  If a game with a matching name is found, but
  # the player name doesn't match one in the game, null is returned
  def get_game(options)
    game = @data_store.get options[:name]

    (not game.nil? and
        (game.player1.eql? options[:player_name] or
            game.player2.eql? options[:player_name])) ?
        game :
        nil
  end
end