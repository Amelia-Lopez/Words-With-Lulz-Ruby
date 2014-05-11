require 'matrix'

class GameService
  TILE_COUNT = 15

  def initialize
    @data_store = InMemoryGameDataStore.new
    @log = WwlLogger.logger
  end

  def self.instance
    unless defined? @@inst
      @@inst = GameService.new
    end
    @@inst
  end

  # creates a new game and adds it to the data store, returns false if game
  # with the same name already exists
  def create_game(options)
    validate_game_name! options[:name]

    players = options[:players].to_a
    raise 'Two player names required' unless players.size == 2

    letter_generator = LetterGenerator.new
    player1 = Player.new(
        :name => players[0],
        :letter_generator => letter_generator,
        :letter_tray => Array.new,
        :score => 0)
    player2 = Player.new(
        :name => players[1],
        :letter_generator => letter_generator,
        :letter_tray => Array.new,
        :score => 0)
    game = Game.new(
        :name => options[:name],
        :letter_generator => letter_generator,
        :player1 => player1,
        :player2 => player2,
        :board => Board.new(
            :tiles => Matrix.build(TILE_COUNT, TILE_COUNT) {|_,_|
              Tile.new(
                  :letter => ' ',
                  :tile_multiplier => TileMultiplier.new(
                      :letter => 1,
                      :word => 1
                  ))}))

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

  private

  # ensures the game name is valid and not already taken
  # returns true if the game name is valid, a string if it's invalid
  def validate_game_name!(name)
    raise ErrorMessage.new(400), 'Game name invalid' if name.to_s.index(/^\w{1,16}$/).nil?
    raise ErrorMessage.new(409), 'Game name already exists' unless @data_store.get(name).nil?
  end
end