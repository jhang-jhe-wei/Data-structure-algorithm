# frozen_string_literal: true

RSpec.describe Heap do
  let(:heap) { Heap.new }

  describe '#push' do
    it 'adds elements to the heap and maintains the heap property' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.peek).to eq(1)
    end
  end

  describe '#pop' do
    it 'removes and returns the smallest element from the heap' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.pop).to eq(1)
      expect(heap.peek).to eq(3)
    end
  end

  describe '#peek' do
    it 'returns the smallest element from the heap without removing it' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.peek).to eq(1)
      heap.push(0)
      expect(heap.peek).to eq(0)
    end
  end

  describe '#empty?' do
    it 'returns true if the heap is empty' do
      expect(heap.empty?).to be true
    end

    it 'returns false if the heap is not empty' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.empty?).to be false
    end
  end
end
