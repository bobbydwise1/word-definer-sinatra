require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/Contact')
require('pry')

get ('/') do
  @contact = ''
  Word.clear
  erb(:input)
end

post ('/user_input') do
  new_word = Hash.new()

  new_word.store(:first_name, params.fetch("first_name"))
  new_word.store(:last_name, params.fetch("last_name"))

  new_word = Word.new(new_word)
  new_word.save
  # @display = Word.display_contacts
  erb(:input)
end

get ('/contact:id') do
  contact = Word.find(params[:id])
  @first_name = contact.first_name
  @last_name = contact.last_name

  erb(:input)
end
