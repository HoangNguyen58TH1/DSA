# nums = [2, 7, 11, 15, 8, 1]
# target = 9
nums = [-3,4,3,90]
target = 0
# nums = [9996,9997,9998,9999,10000]
# target = 19999

# def two_sum1(nums, target)
#   nums.each_with_index do |num1, index1|
#     for index2 in (index1+1)...nums.length
#       return [index1, index2] if num1 + nums[index2] == target
#     end
#   end
# end
# pp two_sum1(nums, target)
# - Time Complexity:
# --> 2693ms, Beats 5.00%
# - Space Complexity
# --> Memory 211.86 MB, Beats 95%

# def two_sum2(nums, target)
#   new_array = []
#   nums.each_with_index do |num, index|
#     new_array << [num, index]
#   end
#   new_array.sort!{ |a, b| a[0] <=> b[0] }

#   i = 0
#   j = nums.length - 1
#   while i < j
#     cur = new_array[i][0] + new_array[j][0]
#     if cur == target
#       return [new_array[i][1], new_array[j][1]].sort
#     elsif cur < target
#       i += 1
#     else
#       j -= 1
#     end
#   end
#   return []
# end
# pp two_sum2(nums, target)

nums = [3,2,4]
target = 6
def two_sum3(nums, target)
  indices = {}
  nums.each_with_index { |num, index| indices[num] = index }
  # indices = {3=>0, 2=>1, 4=>2}
  nums.each_with_index do |num, index|
    # [3,0]
    # [2,1]
    # [4,2]
    diff = target - num
    # 6-3=3
    # 6-2=4
    # indices[diff] = 2
    if indices[diff] != nil && indices[diff] != index
      return [indices[diff], index]
    end
  end
end
pp two_sum3(nums, target)

nums = [3,2,4]
target = 6
def two_sum4(nums, target)
  indices = {}
  nums.each_with_index do |num, index|
    # [3,0]
    # [2,1]
    # [4,2]
    diff = target - num
    # 6-3=3
    # 6-2=4
    # 6-4=2
    # indices[diff] = 2
    if indices[diff] != nil
      return [indices[diff], index]
    end
    indices[num] = index
    # indices = {3=>0, 2=>1}
  end
end
pp two_sum4(nums, target)

def two_sum4(nums, target)
  indices = {}
  nums.each_with_index do |num, index|
    diff = target - num
    return [indices[diff], index] if indices[diff] != nil

    indices[num] = index
  end
end
pp two_sum4(nums, target)

# ----
# target = 13
# nums = [1,2,3,4,0,6,7,8]
# A = [[1,0], [2,1], [3,2], [4,3], [0,4], [6,5], [7,6], [8,7]]
# sort:
# A = [[0,0], [1,1], [2,2], [3,3], [4,4], [6,5], [7,6], [8,7]] # [value, index]
# i = 0
# j = nums.length - 1 = 8 - 1 = 7
# cur = 0 + 8 = 8
# cur < target = 8 < 13 --> true
# i++ --> i = 1
# cur = 1 + 8 = 9 --> 9 < 13 --> true --> i++ --> i=2
# cur = 2 + 8 = 10 --> 10 < 13 --> true --> i++ --> i=3
# cur = 3 + 8 = 11 --> 11 < 13 --> true --> i++ --> i=4
# cur = 4 + 8 = 12 --> 12 < 13 --> true --> i++ --> i=5
# cur = 6 + 8 = 14 --> 14 < 13 --> false --> j-- --> j=6
# cur = 6 + 7 = 13 --> 13 = 13 --> TRUE
# return [Math.min(A[i][1], A[j][1]), Math.max(A[i][1], A[j][1])];
# return [Math.min(A[5][1], A[6][1]), Math.max(A[5][1], A[6][1])];
# return [Math.min(5, 6), Math.max(5, 6)]; --> [5,6]