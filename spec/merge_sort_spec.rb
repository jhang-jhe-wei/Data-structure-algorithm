# frozen_string_literal: true

module MergeSort
  class << self
    def sort(ary)
      return ary if ary.size <= 1

      left, right = slice(ary).map { |a| sort(a) }
      merge(left, right)
    end

    private

    def slice(ary)
      return [ary] if ary.size <= 1

      half = ary.size / 2
      [ary[0...half], ary[half..]]
    end

    def merge(left, right)
      result = []
      result << (left.first <= right.first ? left.shift : right.shift) until left.empty? || right.empty?
      result + left + right
    end
  end
end

RSpec.describe MergeSort do
  it 'sorts an array' do
    expect(MergeSort.sort([3, 2, 1])).to eq([1, 2, 3])
  end
end
