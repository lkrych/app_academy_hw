class LRUCache

  attr_reader :cache

  def initialize(size)
    @cache = Array.new(size)
  end

  def count
    cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
  end

  def show
    # shows the items in the cache, with the LRU item first
  end

  private
  # helper methods go here!

end
