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

get ('/worddef/:id') do
  id = params[:id]
  temp_word = Word.find_id(id)
  @output_word = temp_word.dictionary_word
  @output_def = temp_word.definition_formal
  erb(:worddef)
end

post ('/worddef/:id') do
  id = params[:id]
  temp_word = Word.all[id-1].dictionary_word
  temp_def = params.fetch("definition")
  Word.add_def(temp_word,temp_def)
  @output_word = Word.all[id-1].dictionary_word
  @output_def = Word.all[id-1].definition_formal
  erb(:worddef)
end
