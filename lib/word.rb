class Word
  @@list = []

  attr_accessor :dictionary_word, :definition_formal

  def initialize(attributes)
    @id = @@list.length + 1
    @dictionary_word = attributes.fetch(:dictionary_word)
    @definition_formal = [attributes.fetch(:definition_formal)]
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
    item_name = word_string
    @@list.each do |item|
      if item.dictionary_word == item_name
        return item_name
      end
    end
    return false
  end

  def self.find_defs(word_string)
    item_name = word_string
    @@list.each do |item|
      if item.dictionary_word == item_name
        return item_name.definition_formal
      end
    end
    return false
  end

  def self.add_def(word_string,new_def_string)
    item_name = word_string
    @@list.each do |item|
      if item.dictionary_word == item_name
        item.definition_formal.push(new_def_string)
      end
    end
    return false
  end

end
