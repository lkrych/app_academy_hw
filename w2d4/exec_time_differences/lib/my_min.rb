def my_min(list)
  list.each do |el|
    list.each do |el2|
      next if el == el2
      next if el < el2
      return el2
    end
  end
end


def my_min_but_better(list)
  min = list[0]
  list.each do |el|
    min = el if el < min
  end
  min
end

def largest_contiguous_subsum(list)
  subs = subsets(list)
  subs.map { |s| s.reduce(&:+) }.reject(&:nil?).max
end

def subsets(arr)
  return [[]] if arr.empty?
  subs = subsets(arr[0...-1])
  subs.concat(subs.map { |subset| subset + [arr[-1]] })
end

def largest_contiguous_subsum_better(arr)
  return arr.max if arr.all? { |el| el <= 0 }
  tally = 0
  largest = 0
  arr.each do |el|
    tally += el
    if tally > largest
      largest = tally
    elsif tally < 0
      tally = 0
    end
  end
  largest
end
