# 1. brute force --> O(n)
# 2. BS --> O(log n)
# 3. HashMap:
# - space: O(n)
# - time: O(1)
# 4. arr.indexOf(value)

# 1. brute force
# def search(nums, target)
#     nums.each_with_index do |v, i|
#         return i if v == target
#     end

#     -1
# end

# 2. BS
def search(nums, target)
    l = 0
    r = nums.length - 1

    while(l <= r)
        mid = l + (r-l)/2

        if nums[mid] == target
            return mid
        elsif nums[mid] < target
            l = mid + 1
        else
            r = mid - 1
        end
    end

    -1
end

# tc1:
nums = [-1,0,3,5,9,12]
target = 9
# Output: 4
# tc2:
# nums = [-1,0,3,5,9,12]
# target = 2
# Output: -1

# 3. use indexOf method
# def search(nums, target)
#     nums.index(target) || -1
# end

pp search(nums, target)