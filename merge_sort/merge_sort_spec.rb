# frozen_string_literal: true
require_relative 'merge_sort'

RSpec.describe '#merge_sort' do
  it 'sorts an array' do
    expect(merge_sort([3, 2, 1])).to eq([1, 2, 3])
  end

  it 'sorts an array with duplicate values' do
    expect(merge_sort([3, 2, 1, 2])).to eq([1, 2, 2, 3])
  end

  it 'sorts an array with negative values' do
    expect(merge_sort([3, -2, 1, -1])).to eq([-2, -1, 1, 3])
  end

  it 'sorts an array with one value' do
    expect(merge_sort([1])).to eq([1])
  end

  it 'sorts an array with two values' do
    expect(merge_sort([2, 1])).to eq([1, 2])
  end

  it 'returns an empty array when given an empty array' do
    expect(merge_sort([])).to eq([])
  end

  it 'sorts a large array' do
    large_array = Array.new(1000) { rand(1..1000) }
    expect(merge_sort(large_array)).to eq(large_array.sort)
  end
end
