require 'sinatra'
require 'sinatra/reloader'

number = rand(99).freeze + 1

get '/' do
  guess = params['guess'].to_i
  cheat = params['cheat']
  erb :index, :locals => {:number => number, :guess => guess, :cheat => cheat}
end
