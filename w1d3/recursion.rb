require 'byebug'

def exclusive(s_arr, e_arr)
  range(s_arr + 1, e_arr - 1)
end

def range(s_arr, e_arr)
  return [] if e_arr < s_arr
  inbetween = [s_arr]
  inbetween += range(s_arr + 1, e_arr - 1)
  inbetween << e_arr
end

def range_iter(s_arr, e_arr)
  answer = []
  count = s_arr
  until(count == e_arr + 1)
    answer << count
    count += 1
  end
  answer
end

def sum_arr(arr)
  return [] if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] + sum_arr(arr[1..-1])
end

def sum_arr_iterative(arr)
  sum = 0
  arr.each do |el|
    sum += el
  end
  sum
end

def exponent1(base, pow)
  return 1 if pow == 0
  base * exponent1(base, pow - 1)
end

def exponent2(base, pow)
  return 1 if pow == 0
  return base if pow == 1
  if pow.odd?
    to_sq = exponent2(base, (pow - 1) / 2)
    base * (to_sq * to_sq)
  else
    to_sq = exponent2(base, pow / 2)
    to_sq * to_sq
  end
end

def deep_dup(to_dup)
  return to_dup unless to_dup.is_a?(Array)
  duplicate_retval = []
  to_dup.each do |el|
    duplicate_retval << deep_dup(el)
  end
  duplicate_retval
end

def fibonacci_recur(n)
  return 1 if n == 0 || n == 1
  fibonacci_recur(n - 1) + fibonacci_recur(n - 2)
end

def fibonacci_iter(n)
  fib_number = 1
  prev_fib = 0
  n.times do |num|
    stor = fib_number
    fib_number += prev_fib
    prev_fib = stor
  end
  fib_number
end

def factorial(num)
  (1..num).inject(:*)
end

def subsets(arr)
  return [arr] if arr.empty?

  n = arr.length - 1
  prev_subsets = subsets(arr[0..-2])
  prev_subsets += subsets(arr[1..-1])
  prev_subsets << arr
  prev_subsets.uniq
end

def permutations(arr)
  # return to_dup unless to_dup.is_a?(Array)
  return [arr] if arr.length == 1 || arr.empty?

  permutations = []
  popped = arr.pop
  prev_perms = permutations(arr)
  prev_perms.each do |prev_perm|
    (0..prev_perm.length).each do |idx|
      permutations << prev_perm[0...idx] + [popped] + prev_perm[idx..-1]
    end
  end
  permutations
end

def bsearch(arr, target)
  return nil if arr.empty?
  middle_i = arr.length / 2
  mid_item = arr[middle_i]
  return middle_i if target == mid_item
  left = arr[0...middle_i]
  right = arr[middle_i + 1..-1]
  if mid_item < target
    r_search = bsearch(right, target)
    return r_search if r_search.nil?
    middle_i + 1 + r_search
  else
    bsearch(left, target)
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1

  merged = []
  middle_i = (arr.length / 2) - 1
  left = merge_sort(arr[0..middle_i])
  right = merge_sort(arr[middle_i + 1..-1])

  left_idx = 0
  right_idx = 0

  until merged.length == arr.length
    if left_idx >= left.length
      merged += right[right_idx..-1]
      next
    end

    if right_idx >= right.length
      merged += left[left_idx..-1]
      next
    end

    if left[left_idx] < right[right_idx] #compare logic
      merged << left[left_idx]
      left_idx += 1
    else
      merged << right[right_idx]
      right_idx += 1
    end
  end
  merged
end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0
  change = []
  choice = coins.select { |coin| coin <= amount }.max
  change << choice
  change += greedy_make_change(amount - choice, coins)
  change
end


def make_better_change(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0
  best_length = Float::INFINITY
  best_solution = nil
  coins.each do |coin|
    change = []
    next if coin > amount
    change << coin
    change += make_better_change(amount - coin, coins)
    if change.length < best_length
      best_length = change.length
      best_solution = change
    end
  end
  best_solution
end

if __FILE__ == $PROGRAM_NAME
  p make_better_change(14)
  p make_better_change(15)
  p make_better_change(23)
  p make_better_change(5)
  p make_better_change(14, [7, 1])
  p make_better_change(24, [10, 7, 1])
end
