# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0

# c1:
# def guessNumber(n)
#     for num in 1...(n + 1)
#         return num if guess(num) == 0
#     end
# end

n = 10
# Output: 6

def guess(num)
    pick = 6
    if num == pick
        0
    elsif num > pick
        -1
    else
        1
    end
end

# c2:
def guessNumber(n)
    l = 1; r = n

    while(l <= n)
        mid = l + (r-l)/2
        if guess(mid) == 0
            return mid
        elsif guess(mid) == -1
            r = mid - 1
        else
            l = mid + 1
        end
    end
end
pp guessNumber(n)