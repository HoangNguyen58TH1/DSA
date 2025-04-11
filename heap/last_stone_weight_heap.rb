def last_stone_weight(stones)
  # Use a max heap to always get the two heaviest stones
  stones = stones.map { |weight| -weight } # Negate weights for max-heap simulation
  heap = stones
  # pp "heapify(heap): #{heapify(heap)}"
  heapify(heap)
  pp "heap: #{heap}"

  while heap.size > 1
    first = -heap.pop # Get heaviest stone
    second = -heap.pop # Get second heaviest stone
    pp "first: #{first}"
    pp "second: #{second}"

    if first != second
      # If they are different, push back the difference
      diff = first - second
      pp "diff: #{diff}"
      heap.push(-diff) # Negate again for max-heap simulation
      pp "heap in while loop1: #{heap}"
      heapify(heap) # Restore the heap property
      pp "heap in while loop2: #{heap}"
    end
  end

  pp "heap final: #{heap}"
  heap.empty? ? 0 : -heap.pop # Return the last stone's weight or 0
end

def heapify(heap)
  # heap = [-2, -7, -4, -1, -8, -1]
  # Simple heapify method to maintain max-heap property
  n = heap.size
  # 2.downto(0) --> 2,1,0
  (n / 2 - 1).downto(0) { |i| sift_down(heap, i, n) }
end

def sift_down(heap, i, n)
# def sift_down([-2, -7, -4, -1, -8, -1], 2, 6)
# def sift_down([-2, -7, -4, -1, -8, -1], 1, 6)
# def sift_down([-2, -7, -4, -1, -8, -1], 0, 6)
  # pp "heap: #{heap}"
  # pp "i: #{i}"
  # pp "n: #{n}"
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2
  # pp "largest: #{largest}"
  # pp "left: #{left}"
  # pp "right: #{right}"

  if left < n && heap[left] > heap[largest]
    # pp "left < n && heap[left] > heap[largest]: #{left < n && heap[left] > heap[largest]}"
    largest = left
  end

  if right < n && heap[right] > heap[largest]
    # pp "right < n && heap[right] > heap[largest]: #{right < n && heap[right] > heap[largest]}"
    largest = right
  end

  # pp "largest != i: #{largest != i}"
  if largest != i
    heap[i], heap[largest] = heap[largest], heap[i]
    sift_down(heap, largest, n)
  end
  # pp '---------------------'
end

# stones = [2, 7, 4, 1, 8, 1]
stones = [3,7,2]
puts last_stone_weight(stones) # Output: 1


# stones.map { |weight| -weight }
# heap = stones
# n = heap.size
# (n / 2 - 1).downto(0) { |i| sift_down(heap, i, n) }
# 2.downto(0) { |i| return if i == 1 }

# 2.downto(0) { |i| puts "i: #{i}" }
# heap = [-1, -2, -1, -7, -8, -4]
# first = -heap.pop = 4
# second = -heap.pop = 8

# ==> Chưa đúng hoàn toàn