require 'rspec'
require 'two_sum'

describe "#brute_two_sum?" do

  let(:arr1) { [0,1,5,7] }
  let(:arr2) { [0,2,-2] }


  it "returns true if target exists" do
    expect(brute_two_sum?(arr1, 6)).to eq(true)
    expect(brute_two_sum?(arr1, 8)).to eq(true)
    expect(brute_two_sum?(arr2, 0)).to eq(true)
  end

  it "returns false if target doesn't exist" do
    expect(brute_two_sum?(arr1, 9)).to eq(false)
    expect(brute_two_sum?(arr1, 3)).to eq(false)
    expect(brute_two_sum?(arr2, 5)).to eq(false)
  end
end


describe "#okay_two_sum?" do

  let(:arr1) { [0,1,5,7] }
  let(:arr2) { [0,2,-2] }


  it "returns true if target exists" do
    expect(okay_two_sum?(arr1, 6)).to eq(true)
    expect(okay_two_sum?(arr1, 8)).to eq(true)
    expect(okay_two_sum?(arr2, 0)).to eq(true)
  end

  it "returns false if target doesn't exist" do
    expect(okay_two_sum?(arr1, 9)).to eq(false)
    expect(okay_two_sum?(arr1, 3)).to eq(false)
    expect(okay_two_sum?(arr2, 5)).to eq(false)
  end
end

describe "#super_awesome_two_sum?" do

  let(:arr1) { [0,1,5,7] }
  let(:arr2) { [0,2,-2] }


  it "returns true if target exists" do
    expect(super_awesome_two_sum?(arr1, 6)).to eq(true)
    expect(super_awesome_two_sum?(arr1, 8)).to eq(true)
    expect(super_awesome_two_sum?(arr2, 0)).to eq(true)
  end

  it "returns false if target doesn't exist" do
    expect(super_awesome_two_sum?(arr1, 9)).to eq(false)
    expect(super_awesome_two_sum?(arr1, 3)).to eq(false)
    expect(super_awesome_two_sum?(arr2, 5)).to eq(false)
  end
end

describe "#maybe_bad_four_sum?" do

  let(:arr1) { [1,2,3,4,5,7] }
  let(:arr2) { [0,2,2,1,4] }


  it "returns true if target exists" do
    expect(maybe_bad_four_sum?(arr1, 10)).to eq(true)
    expect(maybe_bad_four_sum?(arr1, 19)).to eq(true)
    expect(maybe_bad_four_sum?(arr2, 9)).to eq(true)
  end

  it "returns false if target doesn't exist" do
    expect(maybe_bad_four_sum?(arr1, -5)).to eq(false)
    expect(maybe_bad_four_sum?(arr1, 25)).to eq(false)
    expect(maybe_bad_four_sum?(arr2, 15)).to eq(false)
  end
end

describe "#maybe_better_four_sum?" do

  let(:arr1) { [1,2,3,4,5,7] }
  let(:arr2) { [0,2,2,1,4] }


  it "returns true if target exists" do
    expect(maybe_better_four_sum?(arr1, 10)).to eq(true)
    expect(maybe_better_four_sum?(arr1, 19)).to eq(true)
    expect(maybe_better_four_sum?(arr2, 9)).to eq(true)
  end

  it "returns false if target doesn't exist" do
    expect(maybe_better_four_sum?(arr1, -5)).to eq(false)
    expect(maybe_better_four_sum?(arr1, 25)).to eq(false)
    expect(maybe_better_four_sum?(arr2, 15)).to eq(false)
  end
end
