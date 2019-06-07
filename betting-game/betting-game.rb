require 'sinatra'
require 'sinatra/reloader' if development?

get '/betting-game/:stake/on/:number' do
  stake = params[:stake].to_i
  number = params[:number].to_i
  roll = rand(6) + 1
  if number == roll
    "It landed on #{roll}. Well done, you win #{6*stake} coins"
  else
    "It landed on #{roll}. You lose #{stake} coins"
  end
end
