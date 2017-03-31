def sum_to(num)
  return nil if num <= 0
  return 1 if num == 1
  num + sum_to(num - 1)
end

def add_numbers(arr)
  return [] if arr.empty?
  return arr[0] if arr.length == 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(num)
  return nil if num <= 0
  return 1 if num == 1
  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(flavors, favorite)
  if flavors.empty?
    return false
  elsif flavors.last == favorite
    return true
  else
    ice_cream_shop(flavors[0..-2], favorite)
  end


end

def reverse(string)
  return string if string.length <= 1
  reverse(string[1..-1]) + string[0]
end

if __FILE__ == $PROGRAM_NAME
  p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
  p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
  p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
  p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
  p ice_cream_shop([], 'honey lavender')  # => returns false

end
