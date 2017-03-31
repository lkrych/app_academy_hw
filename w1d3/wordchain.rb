require 'set'

class WordChain

  def initialize(file_path)
    file = File.readlines(file_path).map(&:chomp)
    @words = Set.new file
    @ALPHABET = 'a'..'z'
  end

  def wordchain(s_word, e_word)
    return e_word if s_word == e_word
    adjacent_words(s_word).each do |poss_word|

    end
  end

  def adjacent_words(word)
    adj_words = []
    word.split("").each_index do |idx|
      @ALPHABET.each do |letter|
        search = word[0...idx] + letter + word[idx + 1..-1]
        adj_words << search if @words.include?(search) && search != word
      end
    end
    adj_words
  end

end


if __FILE__ == $PROGRAM_NAME
  word_up = WordChain.new("dictionary.txt")
  # word_up.wordchain("coo", "duck")
  p word_up.adjacent_words("coo")
end
