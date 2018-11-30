class Word
  @@list = []

  attr_accessor :dictionary_word, :definition_formal

  def initialize(attributes)
    @id = @@list.length + 1
    @dictionary_word = attributes.fetch(:dictionary_word)
    @definition_formal = attributes.fetch(:definition_formal)
  end

  def self.all
    @@list
  end

  def save
    @@list.push(self)
  end

  def self.clear
    @@list = []
  end

  def self.find_id(id)
    @@list[id.to_i-1]
  end

  def self.find_word(word_string)
    word_string = dictionary_word
    @@list.each do |word|
      if word.dictionary_word == word_string
        return word_string
      end
    end
    return false
  end

  def self.find_defs(word_string)
    word_string = dictionary_word
    @@list.each do |word|
      if word.dictionary_word == word_string
        return word.definition_formal
      end
    end
    return false
  end

end
