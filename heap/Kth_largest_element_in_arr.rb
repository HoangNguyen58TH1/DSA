# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}

# c1: sort + get
# def find_kth_largest(nums, k)
#     nums.sort!
#     nums[nums.length - k]
# end

# c2: maxHeap
# require 'rb_heap'
# def find_kth_largest(nums, k)
#     maxHeap = Heap.new { |a, b| a.abs > b.abs }
#     nums.each { |num| maxHeap.add(num) }

#     (k - 1).times { maxHeap.pop }

#     maxHeap.peak
# end


class MaxHeap
    def initialize
      @heap = []
    end
  
    def add(val)
      @heap << val
      heapify_up(@heap.size - 1)
    end
  
    def pop
      return nil if @heap.empty?
      swap(0, @heap.size - 1)
      max_value = @heap.pop
      heapify_down(0)
      max_value
    end
  
    def peak
      @heap[0]
    end
  
    private
  
    def heapify_up(index)
      parent = (index - 1) / 2
      return if index <= 0 || @heap[parent] >= @heap[index]
  
      swap(index, parent)
      heapify_up(parent)
    end
  
    def heapify_down(index)
      left = 2 * index + 1
      right = 2 * index + 2
      largest = index
  
      largest = left if left < @heap.size && @heap[left] > @heap[largest]
      largest = right if right < @heap.size && @heap[right] > @heap[largest]
  
      if largest != index
        swap(index, largest)
        heapify_down(largest)
      end
    end
  
    def swap(i, j)
      @heap[i], @heap[j] = @heap[j], @heap[i]
    end
end
  
def find_kth_largest(nums, k)
    maxHeap = MaxHeap.new
    nums.each { |num| maxHeap.add(num) }

    (k - 1).times { maxHeap.pop }
    maxHeap.peak
end

# nums = [3,2,1,5,6,4]; k = 2 # Output: 5
nums = [3,2,3,1,2,4,5,5,6]; k = 4 # Output: 4
pp find_kth_largest(nums, k)