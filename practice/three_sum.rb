# c1: brute force
def three_sum(nums)
    results = []
    for i in 0...nums.length
        for j in (i + 1)...nums.length
            for k in (j + 1)...nums.length
                results << [nums[i], nums[j], nums[k]] if nums[i] + nums[j] + nums[k] == 0
            end
        end
    end
    results.map(&:sort).uniq
end

# c2: hashmap
def three_sum(nums)
    nums.sort!
    hashSet = Hash.new(0)
    nums.each { |num| hashSet[num] = (hashSet[num] || 0) + 1 }

    res = []
    for i in 0...nums.length
        hashSet[nums[i]] -= 1
        next if (i > 0 && nums[i] == nums[i - 1])

        for j in (i + 1)...nums.length
            hashSet[nums[j]] -= 1
            next if (j > i + 1 && nums[j] == nums[j - 1])

            target = -(nums[i] + nums[j])
            if hashSet[target] > 0
                res.push([nums[i], nums[j], target])
            end
        end

        for j in (i + 1)...nums.length
            hashSet[nums[j]] += 1
        end
    end
    res
end

# nums = [-4,-1,-1,0,1,2]
# complement = -num - nums[j] = -(-4) - (-1)
nums = [-1,0,1,2,-1,-4] # Output: [[-1,-1,2],[-1,0,1]]
# nums = [-1,0,1] # Output: [[-1,-1,2],[-1,0,1]]
# nums = [0, 0, 0, 0] # Expected output: [[0, 0, 0]]
pp three_sum(nums)

# solutions:
# 1. brute-force 3 nested loops
# 2. hashmap
