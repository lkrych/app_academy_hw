require 'rspec'
require 'anagram'

describe '#first_anagram' do
  it 'should return false for words that are not anagrams' do
    expect(first_anagram?("gizmo", "sally")).to be false
  end

  it 'should return true for words that are anagrams' do
    expect(first_anagram?("elvis", "lives")).to be true
  end
end

describe '#second_anagram?' do
  it 'should return false for words that are not anagrams' do
    expect(second_anagram?("gizmo", "sally")).to be false
  end

  it 'should return true for words that are anagrams' do
    expect(second_anagram?("elvis", "lives")).to be true
  end
end

describe '#third_anagram?' do
  it 'should return false for words that are not anagrams' do
    expect(third_anagram?("gizmo", "sally")).to be false
  end

  it 'should return true for words that are anagrams' do
    expect(third_anagram?("elvis", "lives")).to be true
  end
end

describe '#fourth_anagram?' do
  it 'should return false for words that are not anagrams' do
    expect(fourth_anagram?("gizmo", "sally")).to be false
    expect(fourth_anagram?("elvis", "livesh")).to be false
  end

  it 'should return true for words that are anagrams' do
    expect(fourth_anagram?("elvis", "lives")).to be true
  end


end

describe '#fifth_anagram?' do
  it 'should return false for words that are not anagrams' do
    expect(fifth_anagram?("gizmo", "sally")).to be false
    expect(fifth_anagram?("elvis", "livesh")).to be false
  end

  it 'should return true for words that are anagrams' do
    expect(fifth_anagram?("elvis", "lives")).to be true
  end


end
