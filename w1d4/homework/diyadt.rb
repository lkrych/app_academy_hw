class Stack

  attr_accessor :stack

  def initialize
    @stack = []
  end

  def add(el)
    stack.push(el)
  end

  def remove
    stack.pop
  end

  def show
    puts stack.to_s
  end

end

class Queue

  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.push(el)
  end

  def dequeue
    queue.shift
  end

  def show
    puts queue.to_s
  end

end

class Map

  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key,value)
    look = lookup(key)
    if look.empty?
      map << [key,value]
    else
      map[key] = value
    end
  end

  def lookup(key)
    map.select {|pair| pair[0] == key}
  end

  def remove(key)
    map.delete_if {|pair| pair[0] == key}
  end

  def show
    puts map.to_s
  end

end

if __FILE__ == $PROGRAM_NAME
  new_stack = Stack.new
  new_queue = Queue.new
  new_map = Map.new

  puts "testing stack"
  (1..5).each {|num| new_stack.add(num)}
  new_stack.show
  5.times do
    puts new_stack.remove
  end
  new_stack.show

  puts "testing queue"
  (1..5).each {|num| new_queue.enqueue(num)}
  new_queue.show
  5.times do
    puts "dequeing"
    puts new_queue.dequeue
  end
  new_queue.show

  puts "testing map"
  new_map.show
  [[1,2],[3,4],[5,6]].each {|pair| new_map.assign(*pair)}
  new_map.show
  new_map.remove(1)
  new_map.remove(3)
  new_map.show


end
