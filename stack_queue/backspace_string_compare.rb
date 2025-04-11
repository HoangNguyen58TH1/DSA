# s = "ab#c"
s = "a##c"
t = "#a#c"

# c1: brute force
def backspace_compare(s, t)
    i = 0
    j = 0

    while(i <= s.length)
        if i == 0 && s[i] == '#'
            s.slice!(i)
            i -= 1
        elsif i != 0 && s[i] == '#'
            s.slice!(i)
            s.slice!(i-1)
            i -= 2
        end
        i += 1
    end

    while(j <= t.length)
        if j == 0 && t[j] == '#'
            t.slice!(j)
            j -= 1
        elsif j != 0 && t[j] == '#'
            t.slice!(j)
            t.slice!(j-1)
            j -= 2
        end
        j += 1
    end

    s == t
end

# s = "ab#c"
# t = "ad#c"
# c2: use 2 stacks
# def backspace_compare(s, t)
#     process(s) == process(t)
# end

# def process(string)
#     stack = []
#     string.each_char do |char|
#         if char != '#'
#             stack.push(char)
#         else
#             stack.pop unless stack.empty?
#         end
#     end

#     stack
# end

pp backspace_compare(s, t)
