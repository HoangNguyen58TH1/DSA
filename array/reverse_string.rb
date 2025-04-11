s = ["h","e","l","l","o"]
# Output: ["o","l","l","e","h"]
# s = ["h","e"]
# Output: ["e","h"]

# 1. Loop 1/2 length
# def reverse_string(s)
#   for index in 0...(s.length/2)
#     temp = s[index]
#     s[index] = s[(s.length - 1) - index]
#     s[(s.length - 1) - index] = temp
#   end

#   s
# end

# 2. Stack (instance variable)
def reverse_string(s)
  stack = []
  for index in 0...(s.length)
    stack << s[index]
  end

  for index in 0...(stack.length)
    s[index] = stack.pop
  end

  s
end

pp reverse_string(s)
