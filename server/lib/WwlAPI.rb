require 'rubygems'
require 'grape'
require 'json'
require 'wwl/board'
require 'wwl/error_message'
require 'wwl/game'
require 'wwl/in_memory_game_data_store'
require 'wwl/game_service'
require 'wwl/letter_generator'
require 'wwl/player'
require 'wwl/tile'
require 'wwl/tile_multiplier'
require 'wwl/wwl_logger'

class WwlAPI < Grape::API
  VERSION = '0.1.2'

  prefix 'wwl'
  format :json

  helpers do
    # get the logger (initializes it first if necessary)
    def logger
      unless defined? @log
        @log = WwlLogger.logger
        WwlAPI.logger @log
      end

      @log
    end

    # get the game service
    def game_service
      GameService.instance
    end
  end

  resource :game do
    get ':id' do
      {:id => params[:id], :details => 'potato'}.to_json
    end

    params do
      requires :players, type: Array
    end
    post ':id' do
      begin
        game_service.create_game(
            :name => params[:id],
            :players => params[:players]
        )
      rescue ErrorMessage => em
        error!(em.message, em.http_code)
      rescue => err
        logger.warn 'Unexpected error'
        logger.warn "#{err}\n\t#{err.backtrace.join "\n\t"}"
        error!('Unknown error', 500)
      end
      nil
    end
  end
end
