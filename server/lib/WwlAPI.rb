require 'rubygems'
require 'grape'
require 'json'

class WwlAPI < Grape::API
  VERSION = '0.0.1'

	prefix 'wwl'
	format :json

	resource :game do
		get ':id' do
			{:id => params[:id], :details => 'potato'}.to_json
		end
	end

end
