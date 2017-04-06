require 'rspec'
require 'tdd_exercises'

context "When monkey patching array" do
  describe "#my_uniq" do
    it "returns the unique elements of an array" do
      expect([1,1,2,3].my_uniq).to eq([1,2,3])
    end

    it "returns the unique elements of an array in the order that they appeared" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end

    it "returns an empty array if given an array" do
      expect([].my_uniq).to eq([])
    end
  end

  describe "#two_sum" do
    it "should return an empty array if there are no pairs" do
      expect([].two_sum).to eq([])
    end

    it "should not return unsorted pairs" do
      expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[2,3], [0,4]])
    end

    it "should return sorted pairs" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end

describe "#my_transpose" do

  it "should swap rows and columns in a square matrix" do
    expect(my_transpose([
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]])).to eq([[0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8]])
  end

  it "should swap rows and columns in a rectangular matrix" do
    expect(my_transpose([
      [0,1,2,3],
      [4,5,6,7]
      ])).to eq([[0,4],
                [1,5],
                [2,6],
                [3,7]])
  end
end

describe "stock_picker" do
  it "should return the most profitable pair of days to buy and sell" do
    expect(stock_picker([0,1,2,3,4,5,6,7])).to eq([1, 8])
  end

  it "should return the most profitable pair of days to buy and sell" do
    expect(stock_picker([10,4,5,1,20])).to eq([4, 5])
  end

  it "should not allow you to sell a stock before you can buy it" do
    expect(stock_picker([100,4,5,1,20])).to eq([4, 5])
  end
end

describe TowersOfHanoi do
  subject(:game) {TowersOfHanoi.new}
  describe "#initialize" do
    it "towers variable should init with an array length of three" do
      expect(game.towers.length).to eq(3)
    end

    it "the first array of towers, tower 0, should be [3,2,1]" do
      expect(game.towers.first).to eq([3,2,1])
    end
  end

  describe "#move" do

    it "should move a stone from one tower to another" do
      expect{game.move(0,2)}.to change{game.towers[0].length}.by(-1)
      expect{game.move(2,0)}.to change{game.towers[0].length}.by(1)
      game.move(0,2)
      expect(game.towers).to eq( [[3,2],[],[1]])
    end

    it "can only move if the receiving tower has a larger stone" do
      expect{game.move(0,2)}.to change{game.towers[0].length}.by(-1)
      expect{game.move(0,2)}.to raise_error(
        "Can't move a larger stone on top of a smaller stone.")
    end

    it "should not try to move a stone if it doesn't exist" do
      expect{game.move(2,0)}.to raise_error("That stone doesn't exist.")
    end

    it "should not move to the same tower" do
      expect{game.move(0,0)}.to raise_error("That is the same tower.")
    end
  end

  describe "#won?" do
    before(:each) do
      game.move(0,2)
      game.move(0,1)
      game.move(2,1)
      game.move(0,2)
      game.move(1,0)
      game.move(1,2)
    end

    it "should return true if [3,2,1] is found on tower 1 or 2" do
      game.move(0,2)
      expect(game.won?).to be true
    end

    it "should return false if the game is not over" do
      expect(game.won?).to be false
    end
  end
end
