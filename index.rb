require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'

require_relative 'models/country'
require_relative 'models/information'
enable :sessions
set :bind, '0.0.0.0'

get '/' do 
  @countries = Country.get_all_countries()
  if params[:submit]
    current_country = params[:country_to]
    session[:selected_country] = Country.get_id(current_country)
    redirect '/info'
  else
    erb :index
  end
end

get '/info' do 
  current_country = session[:selected_country]
  @all_info = Information.get_all_info(current_country)
  erb :information
end