require 'stack_queue'
require 'rspec'

describe Queue do
  subject(:queue) {Queue.new}

  it " should #initialize with an array" do
    expect(queue.store).to be_a(Array)
  end

  before(:each) do
    queue.enqueue(2)
    queue.enqueue(3)
  end

  describe "#enqueue" do
    it "adds a an element to the end of the queue" do
      expect{queue.enqueue(2)}.to change{queue.store.length}.by(1)
    end
  end

  describe "#pop" do
    it "takes an element off the front of the queue" do
      expect{queue.dequeue}.to change{queue.store.length}.by(-1)
    end
  end

  describe "#peek" do
    it "shows us the first element in the queue" do
      expect(queue.peek).to eq(2)
    end
  end

  describe "#size" do
    it "tells use the size of the queue" do
      expect(queue.size).to eq(2)
    end
  end

  describe "#empty?" do
    it "returns true if queue is empty" do
      queue.dequeue
      queue.dequeue
      expect(queue.empty?).to be true
    end
  end

end

describe Stack do
  subject(:stack) {Stack.new}

  it " should #initialize with an array" do
    expect(stack.store).to be_a(Array)
  end

  before(:each) do
    stack.push(2)
    stack.push(3)
  end

  describe "#enqueue" do
    it "adds a an element to the end of the queue" do
      expect{stack.push(2)}.to change{stack.store.length}.by(1)
    end
  end

  describe "#dequeue" do
    it "takes an element off the front of the queue" do
      expect{stack.pop}.to change{stack.store.length}.by(-1)
    end
  end

  describe "#peek" do
    it "shows us the first element in the queue" do
      expect(stack.peek).to eq(2)
    end
  end

  describe "#size" do
    it "tells use the size of the stack" do
      expect(stack.size).to eq(2)
    end
  end

  describe "#empty?" do
    it "returns true if stack is empty" do
      stack.pop
      stack.pop
      expect(stack.empty?).to be true
    end
  end

end

######

describe StackQueue do
  subject(:queue) {StackQueue.new}

  before(:each) do
    queue.enqueue(2)
    queue.enqueue(3)
  end

  describe "#enqueue" do
    it "adds a an element to the end of the queue" do
      expect{queue.enqueue(2)}.to change{queue.store.length}.by(1)
    end
  end

  describe "#pop" do
    it "takes an element off the front of the queue" do
      expect{queue.dequeue}.to change{queue.store.length}.by(-1)
    end
  end

  describe "#peek" do
    it "shows us the first element in the queue" do
      expect(queue.peek).to eq(2)
    end
  end

  describe "#size" do
    it "tells use the size of the queue" do
      expect(queue.size).to eq(2)
    end
  end

  describe "#empty?" do
    it "returns true if queue is empty" do
      queue.dequeue
      queue.dequeue
      expect(queue.empty?).to be true
    end
  end

end
