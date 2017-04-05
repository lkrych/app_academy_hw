require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Pedro") }
  subject(:my_dessert) { Dessert.new("brownie", 50, chef) }


  describe "#initialize" do
    it "sets a type" do
      expect(my_dessert.type).to_not be_empty
    end
    it "sets a quantity" do
      expect(my_dessert.quantity).to eq(50)
    end
    it "starts ingredients as an empty array" do
      expect(my_dessert.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "so much", "Pedro")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      my_dessert.add_ingredient("popsicle")
      expect(my_dessert.ingredients).to_not be_empty
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      my_dessert.add_ingredient("sugar")
      my_dessert.add_ingredient("baked potato")
      my_dessert.add_ingredient("spatula! woops!")
      my_dessert.add_ingredient("crepe butter")
      my_dessert.add_ingredient("Wanda butter")
      my_first = my_dessert.ingredients.first
      my_dessert.mix!
      expect(my_first).to_not eq(my_dessert.ingredients.first)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect{my_dessert.eat(2)}.to change{my_dessert.quantity}.by(-2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {my_dessert.eat(100000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Pedro the Great Baker")
      expect(my_dessert.serve).to eq("Chef Pedro the Great Baker has made 50 brownies!")
    end
  end

  describe "#make_more" 
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(my_dessert)
      my_dessert.make_more
    end
  end
end
