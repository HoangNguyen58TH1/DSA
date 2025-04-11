# stones = [2,7,4,1,8,1]
# [8,7,4,2,1,1]
# 8-7=1
# [1,4,2,1,1]
# 1 >= 4 --> false --> sort
# [4,2,1,1,1]
# 4-2=2
# [2,1,1,1]
# 2>=1 --> true --> do not need sort
# 2-1=1
# [1,1,1]
# 1>=1 --> true --> not sort
# [1]
# stones.length == 1 --> return stones.first
# stones.length == 0 --> return 0

# [8,7,4,2,1,1].sort
# [8,7,4,2,1,1].sort{ |a,b| a <=> b }

# [8,7,4,2,1,1].sort.reverse
# [8,7,4,2,1,1].sort{ |a,b| b <=> a }

# @param {Integer[]} stones
# @return {Integer}
# stones = [2,7,4,1,8,1] # output: 1
stones = [2,2] # output: 0
def last_stone_weight(stones)
    stones.sort!
    index = stones.length - 1

    while(stones.length > 1)
        diff = stones[index] - stones[index-1]

        if diff == 0
            stones.delete_at(index)
            stones.delete_at(index-1)
            index -= 2
        else
            # diff > 0
            stones.delete_at(index)
            stones[index-1] = diff
            index -= 1
        end

        stones.sort! if stones.length > 1 && stones[index] < stones[index-1]
    end

    stones.first || 0
end
pp last_stone_weight(stones)
