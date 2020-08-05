require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
set :bind, '0.0.0.0'

get '/' do
  erb :index
end