require 'sinatra'
require 'sinatra/reloader' if development?

def caeser_cipher(text, shift)
  unless text.nil?
    characters = text.split('').map do |letter|
      if letter.between?('A', 'Z')
        index = letter.ord
        $character = index + shift
        $character = range(65, 90, $character)
        letter = $character.chr
      elsif letter.between?('a', 'z')
        index = letter.ord
        $character = index + shift
        $character = range(97, 122, $character)
        letter = $character.chr
      else
        letter
      end
    end
    characters.join
  end
end

def range(min, max, item)
  item -= 26 while item > max
  item += 26 while item < min
  item
end

get '/' do
  text = params['text']
  shift = params['shift'].to_i
  result = caeser_cipher(text, shift)
  erb :index, locals: { text: text, shift: shift, result: result }
end
