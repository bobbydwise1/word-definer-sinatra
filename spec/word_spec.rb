require ('rspec')
require('word')
require ('pry')

describe('favorite.methods') do
  it('Create a new object of the Word class') do
    new_word = Word.new({:dictionary_word=>"dog",:definition_formal=>"formal def of dog"})
    new_word.save
    # expect(Word.all).to(eq([\#<Word:0x2deeb60 @id=1, @dictionary_word="dog", @definition_formal="formal def of dog">]))
    expect(Word.all).to(eq([\#<Word:0x2deeb60 @id=1, @dictionary_word="dog", @definition_formal="formal def of dog">]))
  end


end
