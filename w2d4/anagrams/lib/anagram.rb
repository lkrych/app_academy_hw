def first_anagram?(first, second)
  first_perms = first.chars.permutation.map(&:join)
  first_perms.include?(second)
end

def second_anagram?(first, second)
  first_dup = first.chars
  second_dup = second.chars
  first.chars.each do |first_char|
    second.chars.each do |second_char|
      if first_char == second_char
        first_dup.delete_at(first_dup.index(first_char))
        second_dup.delete_at(second_dup.index(first_char))
      end
    end
  end
  first_dup.concat(second_dup).empty?
end

def third_anagram?(first, second)
  first.chars.sort == second.chars.sort
end

def fourth_anagram?(first, second)
  first_h = fill_hash(first.chars)
  second_h = fill_hash(second.chars)
  first_h.each do |k,v|
    return false unless second_h[k] == v
  end

  second_h.each do |k,v|
    return false unless first_h[k] == v
  end
  true
end

def fifth_anagram?(first, second)
  freq_hash = Hash.new(0)
  first.chars.each do |el|
    freq_hash[el] += 1
  end
  second.chars.each do |el2|
    freq_hash[el2] -= 1
  end

  freq_hash.values.all? { |value| value == 0 }
end

def fill_hash(arr)
  h = Hash.new(0)
  arr.each do |el|
    h[el] += 1
  end
  h
end
