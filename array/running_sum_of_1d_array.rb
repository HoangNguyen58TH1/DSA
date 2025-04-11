nums = [1,2,3,4]
# nums = [1, 2, 3]
# output = [1, 3, 6, 10]

# 1. Brute-Force
# def running_sum(nums)
#     result = []
#     nums.each_with_index do |_, i|
#         sum = 0
#         for j in 0...i+1
#             sum += nums[j]
#         end

#         result << sum
#     end

#     result
# end
# time O(n^2) + space O(n)

# 2. 
# def running_sum(nums)
#     result = []
#     nums.each_with_index do |value, i|
#         sum = value + result.last.to_i
#         result << sum
#     end

#     result
# end
# time O(n) + space O(n)

# 3. 
def running_sum(nums)
    nums.each_with_index do |value, i|
        next if i == 0

        nums[i] = value + nums[i-1]
    end
end
# time O(n) + space O(1)

pp running_sum(nums)
