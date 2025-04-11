# @param {Integer[]} nums
# @return {Integer}

# c1: maxHeap
require 'rb_heap'
def max_product(nums)
    # minAbsHeap = Heap.new{|a, b| a.abs < b.abs}
    # maxHeap = Heap.new { |a, b| b <=> a } # --> not work with rb_heap

    # maxHeap = Heap.new { |a, b| a.abs > b.abs }
    maxHeap = Heap.new { |a, b| a > b } # if nums has negative and positive integer
    nums.each { |num| maxHeap.add(num) }

    pp "maxHeap: #{maxHeap.to_a}"
    max1 = maxHeap.pop
    max2 = maxHeap.pop

    (max1 - 1) * (max2 - 1)
end

# c2: brute force
# def max_product(nums)
#     max1 = 0
#     max2 = 0

#     for i in 0...nums.length
#         if nums[i] > max1
#             max2 = max1
#             max1 = nums[i]
#         elsif nums[i] > max2
#             max2 = nums[i]
#         end
#     end

#     (max1 - 1) * (max2 - 1)
# end

nums = [3,4,5,2] # 12
# nums = [1,5,4,5] # 16
# nums = [3,7] # 12
nums = [3,4,-5,12, -6, -8] # 
pp max_product(nums)