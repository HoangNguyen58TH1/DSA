s = "leetcode"
# s = "loveleetcode"
# s = "abba"

# 1. Brute-Force
def first_uniq_char(s)
    s.each_char do |value|
        return s.index(value) if s.count(value) == 1
    end

    -1
end
# --> Time: O(n^2) and Space: O(1)

# 2. HashMap
# def first_uniq_char(s)
#     indices = {}
#     s.each_char do |value|
#         indices[value] = (indices[value] || 0) + 1
#     end

#     indices.each do |key, value|
#         return s.index(key) if value == 1
#     end

#     return -1
# end
# --> Time: O(2n) and Space: O(1) (because maximum 26 characters)

# 3. 26 characters
# def first_uniq_char(s)
#     freq = Array.new(26, 0)

#     s.each_char do |char|
#         freq[char.ord - 'a'.ord] += 1
#     end

#     s.each_char.with_index do |char, index|
#     # s.split('').each_with_index do |char, index|
#         index_in_arr = char.ord - 'a'.ord

#         return index if freq[index_in_arr] == 1
#     end

#     return -1
# end
# --> Time: O(2n) --> O(1) and Space: O(1) (because maximum 26 characters)


# ---
pp first_uniq_char(s)


# s.each_char.with_index do |char, i|
# s.split('').each_with_index do |char, i|