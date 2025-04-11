nums = [0,0,1,1,1,2,2,3,3,4]
# nums = []
# Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]

def remove_duplicates(nums)
    n = nums.length
    return n if n == 0 || n == 1

    k = 1
    for j in 1...nums.length
        if nums[j] != nums[j-1]
            nums[k] = nums[j]
            k += 1
        end

        j += 1
    end

    k
end
pp remove_duplicates(nums)
