 def solution(a)
  posities = a.select(&:positive?)
  hash = {}

  posities.each do |number|
    hash[number] = true
  end

  (1..((posities.max || 1) + 1)).each do |i|
    return i if hash[i].nil?
  end
end

# Cho một mảng A gồm các số nguyên (có thể âm hoặc dương, không theo thứ tự).
# Tìm số nguyên dương nhỏ nhất chưa xuất hiện trong mảng.
# Time: O(n), Space: O(n)
# Brute-force O(n^2) sẽ timeout nếu mảng có hàng trăm ngàn phần tử.
pp solution([1, 3, 6, 4, 1, 2]) # output: 5
pp solution([-1, -3])         # => 1
pp solution([1, 2, 3])        # => 4
pp solution([1000, 2000])     # => 1
pp solution((1..1000000).to_a) # => 1000001