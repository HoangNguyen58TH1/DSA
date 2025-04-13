nums = [1,2,3,1]
# nums = [1,2,3,6]
# way 1 (Brute Force)
# def contains_duplicate(nums)
#     nums.each_with_index do |num, index1|
#         for index2 in (index1 + 1)...nums.length
#             return true if num == nums[index2]
#         end
#     end

#     return false
# end

# way 2 (Sorting)
nums = [1,2,3,1]
def contains_duplicate(nums)
    nums.sort!.each_with_index do |num, index|
        return true if num == nums[index + 1]
    end

    return false
end

# way 3 (HashMap 2 loop)
# def contains_duplicate(nums)
#     indices = {}
#     nums.each_with_index do |num, index|
#         indices[num] = index
#     end
#     nums.each_with_index do |num, index|
#         return true if indices[num] != nil && indices[num] != index
#     end

#     return false
# end

# way 4 (HashMap 1 loop)
# def contains_duplicate(nums)
#     indices = {}
#     nums.each_with_index do |num, index|
#         return true if (indices[num] != nil) && (indices[num] != index)

#         indices[num] = index
#     end
# end

# way 5 (HashSet length)
# require 'set'
# def contains_duplicate(nums)
#     return true if Set.new(nums).size < nums.length

#     false
# end

pp contains_duplicate(nums)

count = [0,0,0,0]
count.all? {|e| e == 0}