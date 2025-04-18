# Max Profit From Stock Prices
# Bạn được cho một mảng prices với độ dài n, trong đó prices[i] là giá cổ phiếu vào ngày thứ i.
# Bạn được phép mua ở một ngày, và bán ở một ngày sau đó (không được bán trước khi mua).
# Hãy viết hàm solution(prices) để trả về:
# Lợi nhuận tối đa có thể đạt được
# Nếu không thể đạt lợi nhuận (giá giảm hoài), trả về 0
# Input: prices: mảng số nguyên có độ dài từ 1 đến 100_000. Mỗi phần tử: 0 <= prices[i] <= 1_000_000
# ✅ Output: Một số nguyên: lợi nhuận tối đa có thể thu được

# def solution(prices)
#   min = 0
#   profit = 0
#   prices.each_with_index do |number, index|
#     min = number if index == 0
#     if (min > number)
#       min = number
#     else
#       profit = (number - min > profit) ? (number - min) : profit
#     end
#   end

#   profit
# end

# optimal:
def solution(prices)
  return 0 if prices.empty?

  min = prices[0]
  profit = 0

  prices.each do |price|
    if min > price
      min = price
    else
      profit = price - min > profit ? price - min : profit
    end
  end

  profit
end

# Yêu cầu:Time: O(n) + Space: O(1)
pp solution([7, 1, 5, 3, 6, 4]) # → 5 # Mua ở 1, bán ở 6 → lợi nhuận = 6 - 1 = 5
pp solution([7, 6, 4, 3, 1]) #→ 0 # Không có ngày nào bán có lời
pp solution([1, 2, 3, 4, 5]) # => 4  
pp solution([3]) # => 0  
pp solution([]) # => 0  
