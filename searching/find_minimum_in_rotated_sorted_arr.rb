# @param {Integer[]} nums
# @return {Integer}
# nums = [4,5,6,7,0,1,2]
nums = [3,4,5,1,2]
def find_min(nums)
    l = 0
    r = nums.length - 1

    while(l < r)
        mid = l + (r-l)/2

        if(nums[mid] > nums[r])
            l = mid + 1
        else
            r = mid
        end
    end

    nums[l]
end

pp find_min(nums)