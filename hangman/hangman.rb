require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  initialize_variables
  read_file
  generate_word
  display_hidden_letters
  erb :home
end

post '/' do
  @user_guess = params[:letter].downcase
  erb :home
end

def initialize_variables
  @wrong_letters = []
  @guess_no = 0
  @user_guess = ""
  @hidden_word = ""
  @win = false
  @hidden_letters = []
  @user_letters = ""
end

def read_file
  @word_list = File.readlines "word_list.txt"
end

def generate_word
  while !@hidden_word.length.to_i.between?(5,12)
    @hidden_word = @word_list[rand(1..@word_list.length)].chomp("\n").downcase
  end
  @answer = @hidden_word.split(//)
end

def display_hidden_letters
  length = @answer.length
  (length).times do
    @hidden_letters << "_ "
  end
end

def anaylise_guess
  locations = @answer.each_index.select do |i|
    @answer[i] == @user_guess.downcase
  end

  if locations.empty?
    @wrong_letters.push(@user_guess)
    @guess_no += 1
  else
    reveal_letters
  end
end

def reveal_letters
  locations.each do |value|
    @hidden_letters[value] = @user_guess + " "
  end
end
