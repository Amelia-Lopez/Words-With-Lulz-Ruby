
# Exception with a message that we can display to the user
class ErrorMessage < StandardError
  attr_reader :http_code

  # capture the http code, defaults to unknown internal server error
  def initialize(http_code = 500)
    @http_code = http_code
  end
end