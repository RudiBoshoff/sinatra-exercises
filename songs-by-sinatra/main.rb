require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end

get '/about' do
  @title = 'All about this website'
  erb :about
end

get '/contact' do
  @title = "Contact us!"
  erb :contact, :layout => :layout
end

not_found do
  erb :not_found
end
