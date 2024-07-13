# frozen_string_literal: true

def merge_sort(array)
  return array if array.size <= 1

  left, right = slice(array).map { |ary| merge_sort(ary) }
  merge(left, right)
end

private

def slice(array)
  return [array] if array.size <= 1

  m = array.size / 2
  [array[0...m], array[m..]]
end

def merge(left, right)
  array = []

  array.push(left.first < right.first ? left.shift : right.shift) until left.empty? || right.empty?

  array + left + right
end
