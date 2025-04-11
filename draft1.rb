def last_stone_weight(stones)
  # Use a max heap to always get the two heaviest stones
  stones = stones.map { |weight| -weight } # Negate weights for max-heap simulation
  heap = stones
  heapify(heap)

  while heap.size > 1
    first = -heap.pop # Get heaviest stone
    second = -heap.pop # Get second heaviest stone

    if first != second
      # If they are different, push back the difference
      diff = first - second
      heap.push(-diff) # Negate again for max-heap simulation
      heapify(heap) # Restore the heap property
    end
  end

  heap.empty? ? 0 : -heap.pop # Return the last stone's weight or 0
end

def heapify(heap)
  # Simple heapify method to maintain max-heap property
  n = heap.size
  (n / 2 - 1).downto(0) { |i| sift_down(heap, i, n) }
end

def sift_down(heap, i, n)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  if left < n && heap[left] > heap[largest]
    largest = left
  end

  if right < n && heap[right] > heap[largest]
    largest = right
  end

  if largest != i
    heap[i], heap[largest] = heap[largest], heap[i]
    sift_down(heap, largest, n)
  end
end