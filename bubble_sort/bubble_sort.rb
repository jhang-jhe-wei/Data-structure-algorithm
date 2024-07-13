def bubble_sort(array)
  return array if array.length <= 1

  max_index = array.length - 1
  max_index.times do |base_index|
    0.upto(max_index - base_index - 1) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
  end
  array
end
