def bubble_sort(list)
  return list if list.size <= 1 # already sorted

  loop do
    swapped = false
    0.upto(list.size-2) do |i|
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i] # swap values
        swapped = true
      end
    end
    break unless swapped
  end

  list
end

p bubble_sort([4,2,5,1])