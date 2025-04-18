# Cho một mảng A gồm số nguyên (độ dài luôn là số lẻ), mọi phần tử đều xuất hiện đúng 2 lần, trừ 1 phần tử xuất hiện đúng 1 lần.
# Hãy tìm phần tử duy nhất đó.

# s1:
# def solution(a)
#   hash = {}
#   a.each do |number|
#     hash[number] = (hash[number] || 0) + 1
#   end

#   hash.each do |k, v|
#     return k if v == 1
#   end
# end

# s2:
def solution(a)
  result = 0
  a.each do |num|
    result ^= num
  end
  result
end

# Input: A là một mảng với độ dài lẻ (1, 3, 5, ..., 1,000,001). Mỗi phần tử là số nguyên trong range [1..1,000,000,000]
# 📤 Output:Trả về số xuất hiện duy nhất
pp solution([9, 3, 9, 3, 9, 7, 9]) # => 7
pp solution([1, 2, 1])             # => 2
pp solution([42])                  # => 42
