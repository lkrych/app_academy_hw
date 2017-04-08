require 'lrucache'
require 'rspec'

describe LRUCache do
  subject(:cache) {LRUCache.new(4)}

  describe "#initialize should create an array in cache instance variable" do
    it "should create an array" do
      expect(cache.cache).to be_a(Array)
      expect(cache.cache.length).to be(4)
    end
  end

  describe "#count" do
    
  end

  describe "#add" do
    it "should add objects in the correct order"
  end

  describe "#show" do
    it "should show the items in LRU order"
  end

end
