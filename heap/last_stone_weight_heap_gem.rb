# gem install faraday_middleware
# gem install heap
# gem list | grep heap
# --> faraday_middleware (1.2.1, 1.2.0, 1.1.0, 1.0.0, 0.13.1, 0.12.2)
# gem list | grep faraday_middleware
# --> heap (1.0.2)

require 'rb_heap'
def last_stone_weight(stones)
  max_heap = Heap.new{|a, b| a.abs > b.abs}
  stones.each { |stone| max_heap.add(stone) }

  while max_heap.size > 1
    max1 = max_heap.pop
    max2 = max_heap.pop
    max_heap.add(max1 - max2) if max1 > max2
  end

  max_heap.pop || 0
end

stones = [2, 7, 4, 1, 8, 1]
# stones = [3,7,2]
# stones = [3,3]
puts "Last stone weight: #{last_stone_weight(stones)}"
