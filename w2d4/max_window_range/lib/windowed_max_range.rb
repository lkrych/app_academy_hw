require 'stack_queue'

def windowed_max_range(arr, w)
  current_max_range = nil
  arr.each_index do |i|
    break if i == arr.size - w + 1
    test_array = arr[i, w]
    test_max = test_array.max
    test_min = test_array.min
    current_max_range ||= test_max - test_min
    if (test_max - test_min) > current_max_range
      current_max_range = test_max - test_min
    end
  end
  current_max_range
end

def widowed_max_range_with_data_structure(arr, w)
  current_max_range = 0
  window = StackQueue.new
  arr.each_with_index do |el, i|
    break if i == arr.size - w + 1
    window.queue(el)
    if window.size == w
      current_max_range = window.max - window.min
    end
    window.dequeue
  end
  current_max_range
end
