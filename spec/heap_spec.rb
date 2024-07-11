# frozen_string_literal: true

RSpec.describe Heap do
  let(:heap) { Heap.new }

  describe '#push' do
    it 'adds elements to the heap and maintains the heap property' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.peek).to eq(1)
    end

    it 'adds duplicate elements to the heap' do
      [5, 3, 3, 1, 1, 1].each { |num| heap.push(num) }
      expect(heap.peek).to eq(1)
    end

    it 'adds negative elements to the heap' do
      [5, 3, -7, 1, -6, 9].each { |num| heap.push(num) }
      expect(heap.peek).to eq(-7)
    end
  end

  describe '#pop' do
    it 'removes and returns the smallest element from the heap' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.pop).to eq(1)
      expect(heap.peek).to eq(3)
    end

    it 'returns nil when trying to pop from an empty heap' do
      expect(heap.pop).to be_nil
    end
  end

  describe '#peek' do
    it 'returns the smallest element from the heap without removing it' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.peek).to eq(1)
      heap.push(0)
      expect(heap.peek).to eq(0)
    end

    it 'returns nil when trying to peek at an empty heap' do
      expect(heap.peek).to be_nil
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
