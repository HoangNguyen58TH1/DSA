def solution(a, k)
  return a if a.empty?

  k = k % a.length
  return a if k == 0

  a[-k..-1] + a[0...-k]

  # index_start = a.length - k
  # new_arr = []

  # (index_start...a.length).each do |number|
  #   new_arr.push(a[number])
  # end

  # (0...index_start).each do |number|
  #   new_arr.push(a[number])
  # end

  # new_arr
end

# Cho một mảng A và một số nguyên K, bạn cần xoay mảng A theo chiều kim đồng hồ K lần.
# Input: Mảng A với N phần tử (1 ≤ N ≤ 100,000), Số nguyên K (0 ≤ K ≤ 1,000,000,000)
# Output: Trả về mảng sau khi xoay K lần.
# Số lần xoay K có thể rất lớn (lên đến 1 tỷ), vì vậy tính toán hiệu suất là rất quan trọng.
# Nếu K lớn hơn độ dài mảng N, bạn có thể giảm K bằng cách dùng K % N (vì mỗi chu kỳ xoay N lần thì mảng trở về như ban đầu).
# Nếu K > N, bạn có thể làm như sau: k = k % a.length

pp solution([3, 8, 9, 7, 6], 3) # => [9, 7, 6, 3, 8]
pp solution([0, 0, 0], 1)       # => [0, 0, 0]
pp solution([1, 2, 3, 4], 4)     # => [1, 2, 3, 4]
pp solution([1, 2, 3, 4], 5)     # => [4, 1, 2, 3]
pp solution([], 1) # => []
