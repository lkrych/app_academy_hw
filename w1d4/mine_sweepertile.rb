class Tile
  attr_reader :safe, :hidden
  def initialize(safe = true)
    @safe = safe
    @hidden = true
  end

  def reveal
    @hidden = false
  end

  def display
    if @hidden == true
      print "[_]"
    elsif @safe
      print "[ ]"
    else
      print " @%"
    end
  end

end


if __FILE__ == $PROGRAM_NAME

end
