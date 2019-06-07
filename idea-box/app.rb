require './idea'
require 'bundler'
Bundler.require

class IdeaBoxApp < Sinatra::Base
  set :method_override, true

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end

  post '/' do
    # params.inspect

    # create an idea based on the form parameters
    idea = Idea.new(params["idea_title"], params["idea_description"])

    # # store it
    idea.save

    # # send us back to the index page to see all ideas
    redirect '/'
  end

  delete '/:id' do |id|
    Idea.delete(id.to_i)
    redirect '/'
  end

  get '/:id/edit' do |id|
    erb :edit, locals: {id: id}
  end
end
