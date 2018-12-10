require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('rspec')
require('pry')

get ('/') do
  erb(:index)
end

post ('/user_index') do
  new_word = Hash.new()
  new_word.store(:dictionary_word, params.fetch("word"))
  new_word.store(:definition_formal, params.fetch("definition"))

  new_word = Word.new(new_word)
  new_word.save
  erb(:index)
end

post ('/user_clear') do
  Word.clear
  erb(:index)
end

get ('/worddef/:id') do
  id = params[:id]
  temp_word = Word.find_id(id)
  @temp_id = id
  @output_word = temp_word.dictionary_word
  @output_def = temp_word.definition_formal
  erb(:worddef)
end

post ('/worddef/:id') do
  id = params[:id]
  temp_word = Word.find_id(id)
  button_select = params.fetch('select')
  temp_def = params.fetch("definition")
  if button_select == "newdef"
    Word.add_def(temp_word.dictionary_word,temp_def)
    @output_word = temp_word.dictionary_word
    @output_def = temp_word.definition_formal
    @temp_id = id
    erb(:worddef)
  elsif button_select == "back"
    @output_word = temp_word.dictionary_word
    @output_def = temp_word.definition_formal
    @temp_id = id
    erb(:index)
  else
    return false
  end
end
