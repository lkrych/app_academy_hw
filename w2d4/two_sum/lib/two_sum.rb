def brute_two_sum?(arr, target)
  arr.each_with_index do |el1, i1|
    arr.each_with_index do |el2, i2|
      next if i1 == i2
      return true if el1 + el2 == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  arr.each do |el|
    search_target = target - el
    search_idx = binary_search(arr, search_target)
    return true if search_idx
  end
  false
end


def binary_search(arr, target)
  return nil if arr.empty?
  mid = arr.size/2
  left = arr.take(mid)
  right = arr.drop(mid + 1)
  case target <=> arr[mid]
  when -1
    binary_search(left, target)
  when 0
    return mid
  when 1
    right_search = binary_search(right, target)
    right_search.nil? ? nil : right_search + mid + 1
  end
end

def super_awesome_two_sum?(arr, target)
  h = Hash.new
  arr.each do |el|
    h[el] = true
  end

  arr.each do |el|
    search_target = target - el
    return true if h[search_target]
  end

  false
end

def maybe_bad_four_sum?(arr, target)
  arr.each_with_index do |el1, i|
    (i+1..arr.length-1).each do |j|
      search_target = target - el1 - arr[j]
      remaining_array = arr[0...i] + arr[i+1...j] + arr[j+1..-1]
      return true if super_awesome_two_sum?(remaining_array, search_target)
    end
  end
  false
end

def maybe_better_four_sum?(arr, target)
  sum_hash = Hash.new
  arr.each_with_index do |el1, i|
    (i + 1..arr.length - 1).each do |j|
      sum_hash[[i, j]] = el1 + arr[j]
    end
  end

  sums_sort = sum_hash.values.sort

  val = nil
  sums_sort.each do |sum|
    val ||= binary_search(sums_sort, target - sum)
  end

  val ? true : false
end
