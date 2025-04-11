# my_set = Set.new([1,2,3])
# my_set.add(4)
# my_set.add(3)

# my_set = Set.new([1, 2, 3, 4])
# my_set.add(5)
# my_set.add(3)

# s = 'bacaa'
# count = Array.new(26, 0)
# for i in 0...s.length
#   count[s[i].ord - 'a'.ord]++;
# end

# [1,0,0].any?{ |e| e == 0 }
# [0,0,0].all?{ |e| e == 0 }

# Array.new(3, 0)

# head
# <ListNode:0x00007fe4f68945f8
#   @val=1
#   @next=#<ListNode:0x00007fe4f68945a8
#     @next=#<ListNode:0x00007fe4f6894580 @next=nil, @val=2>,
#     @val=1
#   >,
# >

# --> đều get element ở sau
stack = queue = array
# add
stack.push(element) # --> add element end of arr
queue.push(element) # --> add element head of arr
# take
stack.pop # --> get and remove top element
queue.shift # --> get and remove frist element

# stack.first || stack.last
# queue.first || queue.last

peek = last # --> KO remove (như pop())

# --- note ---
# stack: push + pop
# queue: push + shift


# for i in 0...3 - 1
#   puts i.inspect
# end
# (3 - 1).times do
#   puts 'hello'
# end

# s = "a##c"
# s = "zz#a#c" --> "zc"
i from s.length to 0
skipS = 0
skipS = 1
skipS = 2
if character != '#' && skipS > 0
  # break
else
  return false if s[i] != t[j]
end
skipS = 1
skipS = 2
skipS = 1
skipS = 0


# t = "#a#c" --> "c"
j from t.length to 0
skipT = 0

# a = [1,2,3]
# b = [4,5,6]
# a[-1]

# ---
# explain BS:
# [1,2,3,4,5]
# f
#     m
#          l
# -->
#       f
#          l
#       m
# -->
#       f
#       l
# 3 pointer: f + m + l
# m = (f + l)/2 = (1 + 5)/2 = 3
# if is_bad_version(m) --> false
#     f = m + 1
# else
#     l = m
# end
# m = (f + l)/2 = (4 + 5)/2 = 9/2 = 4.5 = 4
# if is_bad_version(4) --> true --> 
# if f = l --> return f --> this is first bad version

# -------
# Math.sqrt(14)
# => 3.7416573867739413
# [13] pry(main)> Math.sqrt(14).to_i
# => 3
# [15] pry(main)> Integer.sqrt(16)
# => 4
# [16] pry(main)> Integer.sqrt(14)
# => 3

# ----------------
# array: miss 1 bai
# hashmap: miss 2 bai

# ----------------
# a = [8,7,4,2,1,1]
# a.delete(8) => 8
# a => [7, 4, 2, 1, 1]
# a.delete_at(1) => 4
# a => [7, 2, 1, 1]

# pp "stones: #{stones}"
# [1, 1, 2, 4, 7, 8]
# [1, 1, 1, 2, 4]
# [1, 1, 1, 2]
# [1, 1, 1]
# [1]

# nums = [10, 20, 30]
# for i in 0...nums.length
#   pp nums[i]
# end

# [2,10,7,10,7].each do |rank|
#   pp "rank: #{rank}"
# end

