require 'game'

class InMemoryGameDataStore
  @games = Hash.new

  # add a game to the data store, returns true if successful, false otherwise
  def add(game)
    verify_arg_type! game
    return false if @games.has_key? game.name

    @games[game.name] = game
    true
  end

  # get a game from the data store using its name
  def get(name)
    @games[name]
  end

  # remove the game with the specified name
  def remove(game)
    verify_arg_type! game
    @games.delete game.name
  end

  private

  # verify the specified argument is a Game object
  def verify_arg_type!(game)
    raise "Game object required: #{game}" unless game.is_a? Game
  end
end