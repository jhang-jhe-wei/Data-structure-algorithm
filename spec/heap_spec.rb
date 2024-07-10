# frozen_string_literal: true

class Heap
  def initialize; end
  def push(_); end
  def pop; end
  def peek; end
  def empty?; end
end

RSpec.describe Heap do
  let(:heap) { Heap.new }

  describe '#push' do
    it 'adds an element to the heap' do
      heap.push(5)
      expect(heap.peek).to eq(5)
    end
  end

  describe '#pop' do
    it 'removes and returns the smallest element from the heap' do
      heap.push(5)
      heap.push(3)
      expect(heap.pop).to eq(3)
      expect(heap.peek).to eq(5)
    end
  end

  describe '#peek' do
    it 'returns the smallest element from the heap without removing it' do
      heap.push(5)
      heap.push(3)
      expect(heap.peek).to eq(3)
    end
  end

  describe '#empty?' do
    it 'returns true if the heap is empty' do
      expect(heap.empty?).to be true
    end

    it 'returns false if the heap is not empty' do
      heap.push(5)
      expect(heap.empty?).to be false
    end
  end
end
