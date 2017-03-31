require "pry"

class Array
  def my_each(&blk)
    0.upto(self.length - 1) do |index|
      blk.call(self[index])
    end
  end

  def my_select(&blk)
    arr = []

    my_each do |el|
      arr << el if blk.call(el)
    end

    arr
  end

  def my_reject(&blk)
    arr = []

    my_each do |el|
      arr << el unless blk.call(el)
    end

    arr
  end

  def my_any?(&blk)
    my_each do |el|
      return true if blk.call(el)
    end
    false
  end

  def my_all?(&blk)
    my_each do |el|
      return false unless blk.call(el)
    end
    true
  end

  def my_flatten
    arr = []
    my_each do |el|
      if el.is_a?(Array)
        arr << el.my_flatten
      else
        arr << el
      end
    end
    arr
  end

  def my_zip(*args)
    arr = []
    each_index do |idx|
      sub_arr = []
      sub_arr << self[idx]
      (0..args.size - 1).each do |arg_idx|
        sub_arr << args[arg_idx][idx]
      end
      arr << sub_arr
    end
    arr
  end

  def my_rotate(shift = 1)
    arr = self.dup

    if shift > 0
      shift.times do |rotate|
        arr.push(arr.shift)
      end
    else
      shift.abs.times do |rotate|
        arr.unshift(arr.pop)
      end
    end

    arr
  end

  def my_join(separator = '')
    str = ''

    each_with_index do |el, idx|
      str += el
      str += separator unless idx == self.length - 1
    end

    str
  end

  def my_reverse
    new_arr = []
    each do |el|
      new_arr.unshift(el)
    end
    new_arr
  end

  def bubble_sort!(&blk)
    if blk.nil?
      swap = true
      until swap == false
        swap = false
        (1..self.length - 1).each do |idx|
          if self[idx - 1] > self[idx]
            self[idx - 1], self[idx] = self[idx], self[idx - 1]
            swap = true
          end
        end
      end
    else
      swap = true
      until swap == false
        swap = false
        (1..self.length - 1).each do |idx|
          if blk.call(self[idx - 1], self[idx]) > 0
            self[idx - 1], self[idx] = self[idx], self[idx - 1]
            swap = true
          end
        end
      end
    end
  end

  def bubble_sort(&blk)
    self.dup.bubble_sort!
  end


end

def factors(num)
  facts = []
  i = 1
  while i <= num
    if num % i == 0
      facts.push(i)
    end
    i += 1
  end
  facts
end

def substrings(string)
  arr = []
  (0..string.length - 1).each do |idx1|
    (idx1..string.length - 1).each do |idx2|
      arr << string[idx1..idx2]
    end
  end
  arr.uniq
end

def subwords(word, dictionary)
  substrings(word).select { |el| dictionary.include?(el) }
end



if __FILE__ == $PROGRAM_NAME
  p subwords("catsanddogs", ["cat", "a", "an", "and", "at", "mouse"])

end
