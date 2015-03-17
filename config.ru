require 'sinatra'
require 'grape'

class API < Grape::API
  get :hello do
    { hello: "Pete" }
  end
end

class Web < Sinatra::Base
  get '/' do
    "Hello world."
  end
end

use Rack::Session::Cookie
run Rack::Cascade.new [API, Web]