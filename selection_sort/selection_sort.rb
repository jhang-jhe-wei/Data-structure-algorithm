def selection_sort(array)
  0.upto(array.length - 1) do |index|
    small = array[index]
    exchange_index = index
    index.upto(array.length - 1) do |j|
      if array[j] <= small
        small = array[j]
        exchange_index = j
      end
    end
    array[index], array[exchange_index] = array[exchange_index], array[index]
  end
  array
end
