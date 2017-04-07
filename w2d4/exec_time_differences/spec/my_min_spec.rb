require 'rspec'
require 'my_min'

describe '#my_min' do
  it 'returns smallest number in list' do
    list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    expect(my_min(list)).to eq(-5)
  end
end

describe '#my_min_but_better' do
  it 'returns smallest number in list' do
    list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    expect(my_min_but_better(list)).to eq(-5)
  end
end


describe "#largest_contiguous_subsum" do
  it 'returns subsets of an array' do
    list = [5, 3, -7]
    expect(largest_contiguous_subsum(list)).to eq(8)
  end
end


describe "#largest_contiguous_subsum_better" do
  it 'returns subsets of an array' do
    expect(largest_contiguous_subsum_better([5, 3, -7])).to eq(8)
    expect(largest_contiguous_subsum_better([-5, -1, -3])).to eq(-1)
    expect(largest_contiguous_subsum_better([2, 3, -6, 7, -6, 7])).to eq(8)
  end
end
