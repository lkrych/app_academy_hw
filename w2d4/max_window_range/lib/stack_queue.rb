require 'byebug'

class Queue
  attr_reader :store
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class Stack
  attr_reader :store
  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end


class StackQueue
  def initialize
    @queue_stack = Stack.new
    @dequeue_stack = Stack.new
    @max_queue = Queue.new
    @min_queue = Queue.new
  end

  def queue(el)
    @queue_stack.push(el)
    # byebug
    @max_queue.enqueue(el) if @max_queue.peek == nil
    @min_queue.enqueue(el) if @min_queue.peek == nil
    if el >= @max_queue.peek
      @max_queue.enqueue(el)
    end
    if el <= @min_queue.peek
      @min_queue.enqueue(el)
    end
  end

  def dequeue
    fill_dequeue_stack if @dequeue_stack.empty?
    el = @dequeue_stack.pop
    if @max_queue.peek == el
      @max_queue.dequeue
    end
    if @min_queue.peek == el
      @min_queue.dequeue
    end
  end

  def max
    @max_queue.peek
  end

  def min
    @min_queue.peek
  end

  def peek
    fill_dequeue_stack if @dequeue_stack.empty?
    @dequeue_stack.peek
  end

  def size
    @queue_stack.size + @dequeue_stack.size
  end

  def empty?
    @dequeue_stack.empty? && @queue_stack.empty?
  end

  def fill_dequeue_stack
    until @queue_stack.empty?
      @dequeue_stack.push(@queue_stack.pop)
    end
  end
end
