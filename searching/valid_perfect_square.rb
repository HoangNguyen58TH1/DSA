# @param {Integer} num
# @return {Boolean}

# c1: Brute force
# def is_perfect_square(num)
#     i = 1
#     while(i*i <= num)
#         return true if i*i == num
#         i += 1
#     end

#     false
# end

# c2: BS
# def is_perfect_square(num)
#     l = 1
#     r = num

#     while(l <= r)
#         m = l + (r-l)/2
#         square = m*m

#         if square == num
#             return true
#         elsif square < num
#             l = m + 1
#         else
#             r = m - 1
#         end
#     end
    
#     false
# end

# num = 16 # true
# num = 15 # false
num = 1 # true

# c3: 
def is_perfect_square(num)
    index = (num**0.5).to_i
    index*index == num
end
pp is_perfect_square(num)