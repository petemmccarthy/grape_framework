require 'sinatra'
require 'grape'

class API < Grape::API
  get :hello do
    { hello: "Hello World, from Grape" }
  end
end

class Web < Sinatra::Base
  get '/' do
    "Hello world, from Sinatra."
  end
end

use Rack::Session::Cookie
run Rack::Cascade.new [API, Web]