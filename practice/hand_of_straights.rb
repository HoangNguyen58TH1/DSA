# def is_n_straight_hand(hand, group_size)
#   return false if hand.length % group_size != 0

#   count = Hash.new(0)
#   hand.each { |card| count[card] += 1 }

#   hand.sort!
#   hand.each do |card|
#     next if count[card] == 0

#     (card...(card + group_size)).each do |num|
#       return false if count[num] == 0
#       count[num] -= 1
#     end
#   end

#   true
# end

require 'set'
def is_n_straight_hand(hand, group_size)
  return false if hand.length % group_size != 0

  count = Hash.new(0)
  hand.each { |card| count[card] += 1 }

  min_heap = SortedSet.new(count.keys) # Min-Heap bằng SortedSet

  while !min_heap.empty?
    first = min_heap.first # Lấy số nhỏ nhất
    (first...(first + group_size)).each do |num|
      return false if count[num] == 0 # Không đủ số để tạo nhóm
      count[num] -= 1
      min_heap.delete(num) if count[num] == 0 # Xóa nếu hết số này
    end
  end

  true
end

hand = [1,2,3,6,2,3,4,7,8]; groupSize = 3 # Output: true
# hand = [1,2,3,4,5]; groupSize = 4 # Output: false
pp is_n_straight_hand(hand, groupSize)