def last_stone_weight(stones)
  # Chuyển đổi sang max-heap, tức là sử dụng số âm
  stones = stones.map { |weight| -weight }

  # Thiết lập heap từ mảng đã chuyển đổi
  build_max_heap(stones)

  while stones.size > 1
    first = -pop_max(stones) # Lấy viên nặng nhất
    second = -pop_max(stones) # Lấy viên nặng thứ hai

    if first != second
      # Tính hiệu và đẩy viên đá còn lại vào heap
      diff = first - second
      push_max(stones, -diff) # Đẩy viên nặng đã được biến đổi thành âm
    end
  end

  stones.empty? ? 0 : -stones.first # Trả về viên đá còn lại hoặc 0
end

def build_max_heap(heap)
  n = heap.size
  (n / 2 - 1).downto(0) { |i| heapify_down(heap, i, n) }
end

def pop_max(heap)
  return heap.pop if heap.size == 1 # Nếu chỉ còn một viên thì lấy luôn
  max_value = heap[0]
  heap[0] = heap.pop # Đặt viên cuối vào vị trí đầu
  heapify_down(heap, 0, heap.size) # Duy trì max-heap
  max_value # Trả về viên nặng nhất
end

def push_max(heap, value)
  heap.push(value) # Thêm phần tử vào cuối mảng
  heapify_up(heap, heap.size - 1) # Duy trì max-heap
end

def heapify_down(heap, i, size)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  if left < size && heap[left] > heap[largest]
    largest = left
  end

  if right < size && heap[right] > heap[largest]
    largest = right
  end

  if largest != i
    heap[i], heap[largest] = heap[largest], heap[i]
    heapify_down(heap, largest, size)
  end
end

def heapify_up(heap, i)
  while i > 0
    parent = (i - 1) / 2
    break if heap[parent] >= heap[i]

    heap[i], heap[parent] = heap[parent], heap[i]
    i = parent
  end
end

# Ví dụ sử dụng
stones = [3, 7, 2]
puts last_stone_weight(stones) # Output: 2