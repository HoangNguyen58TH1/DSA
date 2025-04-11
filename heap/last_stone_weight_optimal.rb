def last_stone_weight(stones)
    stones.sort!

    while stones.size > 1
        first = stones.pop
        second = stones.pop

        if first != second
            stones.push(first - second)
            stones.sort!
        end
    end

    stones.first || 0
end

# stones = [3, 7, 2] # output: 2
stones = [2,7,4,1,8,1] # output: 1
puts last_stone_weight(stones) # Output: 2