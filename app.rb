require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require ('rspec')
require ('pry')

get ('/') do
  erb(:input)
end

post ('/user_input') do
  new_word = Hash.new()
  new_word.store(:dictionary_word, params.fetch("word"))
  new_word.store(:definition_formal, params.fetch("definition"))

  new_word = Word.new(new_word)
  new_word.save
  erb(:input)
end

post ('/user_clear') do
  Word.clear
  erb(:input)
end

# post ('/word:id') do
#   id = params[:id]
#   out_word = Word.find_id(id)
#   @output_word = out_word.dictionary_word
#   @output_def = out_word.definition_formal
#   erb(:input)
# end

get ('/word:id') do
  erb(:output)
end
