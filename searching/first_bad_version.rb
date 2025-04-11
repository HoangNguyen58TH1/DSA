def is_bad_version(version)
    bad = 4
    return true if version >= bad

    false
end
# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}

n = 5
# --> n = [1,2,3,4,5]
# --> output: 4

# c1: brute force
# def first_bad_version(n)
#     for index in 1...(n + 1) do
#         pp index
#         return index if is_bad_version(index)
#     end
# end
# --> time complexity O(n)
# --> space complexity O(1)

# c2: binary search
def first_bad_version(n)
    l = 1
    r = n

    while(l < r)
        mid = l + (r - l)/2 #(l + r)/2
        if is_bad_version(mid)
            r = mid
        else
            l = mid + 1
        end
    end

    l
end
# --> time complexity O(log n)
# --> space complexity O(1)

pp first_bad_version(n)

