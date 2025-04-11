def heapify(arr, n, i)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  largest = left if left < n && arr[left] > arr[largest]
  largest = right if right < n && arr[right] > arr[largest]

  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify(arr, n, largest)
  end
end

def build_max_heap(arr)
  n = arr.length
  (n / 2 - 1).downto(0) { |i| heapify(arr, n, i) }
end

def pop_max(arr)
  return nil if arr.empty?
  max_value = arr[0]
  arr[0] = arr.pop
  heapify(arr, arr.length, 0) unless arr.empty?
  max_value
end

def last_stone_weight(stones)
  build_max_heap(stones)
  while stones.length > 1
    max1 = pop_max(stones)
    max2 = pop_max(stones)
    stones << (max1 - max2) if max1 > max2
    build_max_heap(stones) unless stones.empty?
  end
  stones.empty? ? 0 : stones[0]
end

# Example usage
# stones = [2, 7, 4, 1, 8, 1]
# stones = [3,7,2]
stones = [3,1]
puts "Last stone weight: #{last_stone_weight(stones)}"
