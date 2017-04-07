class Octopus
  attr_reader :fish
  def initialize(name)
    @name = name
    @fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  end
end


class SluggishOctopus < Octopus
  def find_longest_fish
    biggest_fish = ""
    fish.each_index do |idx|
      fish.each_index do |idx2|
        if fish[idx] > fish[idx2] && fish[idx] > biggest_fish
          biggest_fish = fish[idx]
        end
      end
    end
    biggest_fish
  end
end

class CleverOctopus < Octopus
  def find_longest_fish
    biggest_fish = ""
    (0..(fish.size - 1)).each do |idx1|
      if fish[idx1].length > biggest_fish.length
        biggest_fish = fish[idx]
      end
    end
    biggest_fish
  end
end

class DominantOctopus < Octopus
  def find_longest_fish
    sorted_fish = merge_sort(fish)
    sorted_fish.last
  end

  def merge_sort(fish_arr) #merge_sort for fish_arr
    return fish_arr if fish_arr.length <= 1
    mid = fish_arr.size/2
    left = merge_sort(fish_arr.take(mid))
    right = merge_sort(fish_arr.drop(mid))
    sorted_fish = merge(left, right)
  end

  def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
      if left.first <= right.first
        sorted << left.shift
      else
        sorted << right.shift
      end
    end
    sorted.concat(left)
    sorted.concat(right)
    sorted
  end
end

class DancingOctopus < Octopus
  attr_reader :tiles_array, :tiles_hash
  def initialize
    @tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
    @tiles_hash = {
      "up" => 0,
      "right_up" => 1,
      "right" => 2,
      "right-down" => 3,
      "down" => 4,
      "left_down" => 5,
      "left" => 6,
      "left-up" =>  7
    }
  end

  def slow_dance(tile)
    @tiles_array.each_with_index do |el, i|
      return i if el == tile
    end
    puts "tile wasnt found!"
  end

  def constant_dance(tile)
    tiles_hash[tile]
  end
end
