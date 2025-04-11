s = "()[]{}"
# output: boolean
def is_valid(s)
    stack = []
    mapping = {')' => '(', ']' => '[', '}' => '{'}

    s.each_char do |char|
        if(mapping.values.include?(char))
            stack.push(char)
        else
            if stack.empty? || stack.pop != mapping[char]
                return false
            end
        end
    end

    stack.empty?
end

# def is_valid(s)
#     stack = []
#     mapping = {')' => '(', '}' => '{', ']' => '['}
    
#     s.each_char do |char|
#       if mapping.values.include?(char)  # Nếu là dấu ngoặc mở
#         stack.push(char)
#       elsif mapping.key?(char)  # Nếu là dấu ngoặc đóng
#         if stack.empty? || stack.pop != mapping[char]
#           return false
#         end
#       end
#     end
  
#     stack.empty?  # Nếu không còn dấu ngoặc mở thì là hợp lệ
#   end
pp is_valid(s)
