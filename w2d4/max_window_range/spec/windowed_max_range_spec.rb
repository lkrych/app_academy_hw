require 'rspec'
require 'windowed_max_range'

describe '#windowed_max_spec' do
  it "finds max windowed range" do
    expect(windowed_max_range([1, 0, 2, 5, 4, 8], 2)).to eq(4)
    expect(windowed_max_range([1, 0, 2, 5, 4, 8], 3)).to eq(5)
    expect(windowed_max_range([1, 0, 2, 5, 4, 8], 4)).to eq(6)
    expect(windowed_max_range([1, 3, 2, 5, 4, 8], 5)).to eq(6)
  end

end

describe '#windowed_max_spec' do
  it "finds max windowed range" do
    expect(widowed_max_range_with_data_structure([1, 0, 2, 5, 4, 8], 2)).to eq(4)
    expect(widowed_max_range_with_data_structure([1, 0, 2, 5, 4, 8], 3)).to eq(5)
    expect(widowed_max_range_with_data_structure([1, 0, 2, 5, 4, 8], 4)).to eq(6)
    expect(widowed_max_range_with_data_structure([1, 3, 2, 5, 4, 8], 5)).to eq(6)
  end

end
