require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('rspec')
require('word')
require ('pry')

describe('Word.methods') do

  it('Create a list of Word objects and save them in the Word class') do
    Word.clear
    new_word1 = Word.new({:dictionary_word=>"dog",:definition_formal=>"formal def of dog"})
    new_word1.save
    new_word2 = Word.new({:dictionary_word=>"cat",:definition_formal=>"formal def of cat"})
    new_word2.save
    new_word3 = Word.new({:dictionary_word=>"parrot",:definition_formal=>"formal def of parrot"})
    new_word3.save
    expect(Word.all_pretty).to(eq([["dog", ["formal def of dog"]], ["cat", ["formal def of cat"]], ["parrot", ["formal def of parrot"]]]))
  end

  it('Add more definitions to a word picked by the user') do
    Word.clear
    new_word1 = Word.new({:dictionary_word=>"dog",:definition_formal=>"formal def of dog"})
    new_word1.save
    new_word2 = Word.new({:dictionary_word=>"cat",:definition_formal=>"formal def of cat"})
    new_word2.save
    new_word3 = Word.new({:dictionary_word=>"parrot",:definition_formal=>"formal def of parrot"})
    new_word3.save
    Word.add_def("cat","2nd def of cat")
    Word.add_def("parrot","2nd def of parrot")
    Word.add_def("parrot","3rd def of parrot")
    expect(Word.all_pretty).to(eq([["dog", ["formal def of dog"]], ["cat", ["formal def of cat", "2nd def of cat"]], ["parrot", ["formal def of parrot", "2nd def of parrot", "3rd def of parrot"]]]))
  end

end
