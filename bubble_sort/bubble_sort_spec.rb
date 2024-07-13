require 'rspec'

describe '#bubble_sort' do
  it 'returns an empty array when given an empty array' do
    expect(bubble_sort([])).to eq([])
  end

  it 'returns the same array when given an array with one element' do
    expect(bubble_sort([1])).to eq([1])
  end

  it 'sorts an array of integers in ascending order' do
    expect(bubble_sort([5, 3, 8, 2, 1])).to eq([1, 2, 3, 5, 8])
  end

  it 'sorts an array with duplicate elements' do
    expect(bubble_sort([5, 3, 8, 2, 1, 2])).to eq([1, 2, 2, 3, 5, 8])
  end

  it 'sorts an array with negative numbers' do
    expect(bubble_sort([5, -3, 8, 2, -1, 2])).to eq([-3, -1, 2, 2, 5, 8])
  end

  it 'does not modify the original array' do
    array = [5, 3, 8, 2, 1]
    bubble_sort(array)
    expect(array).to eq([5, 3, 8, 2, 1])
  end
end
