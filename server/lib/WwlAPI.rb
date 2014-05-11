require 'rubygems'
require 'grape'
require 'json'

class WwlAPI < Grape::API
  VERSION = '0.1.1'

	prefix 'wwl'
	format :json

  helpers do
    def logger
      unless defined? @log
        $stdout.sync = true
        @log = Logger.new($stdout)
        #@log.level = Logger::INFO
        @log.formatter = proc { |severity, datetime, progname, msg|
          "[#{datetime.strftime(@log.datetime_format)}] #{'%-5s' % severity} #{msg}\n"
        }
        @log.datetime_format = '%Y-%m-%d %H:%M:%S'
        WwlAPI.logger @log
      end

      @log
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
      logger.info('a') {"players: #{params[:players]}, player1: #{params[:player1]}, id: #{params[:id]}"}
      nil
    end
	end
end
