# Problem: Longest Substring Without Repeating Characters
# - Mô tả: Viết một hàm solution(s) nhận vào một chuỗi s và trả về độ dài của chuỗi con dài nhất mà không chứa ký tự nào lặp lại.
# - Yêu cầu:
# Độ phức tạp thời gian của bạn phải là O(n), space complexity là O(n)
# Đảm bảo rằng chương trình của bạn xử lý các chuỗi dài mà không bị quá tải.
# - Các điều kiện cần lưu ý:
# Chuỗi có thể có độ dài từ 0 đến 10^4.

def length_of_longest_substring(s)
  seen = {}         # hash map để lưu vị trí cuối của mỗi ký tự
  left = 0          # con trỏ trái của window
  max_len = 0       # kết quả trả về

  s.chars.each_with_index do |char, right|
    # Nếu char đã thấy và nó nằm trong window hiện tại (>= left)
    if seen[char] && seen[char] >= left
      left = seen[char] + 1   # nhảy left qua ký tự trùng
    end

    seen[char] = right        # cập nhật vị trí mới của char
    max_len = [max_len, right - left + 1].max
  end

  max_len
end

# def solution(string)
#   return 0 if string.empty?

#   array = []
#   count = 1
#   string.each_char.with_index do |character, index|
#     if character != string[index + 1]
#       count += 1
#     else
#       array.push(count)
#       count = 1
#     end
#   end

#   # string.each_char.with_index do |character, index|
#   #   next if index.zero?

#   #   if sub_string.exclude?(character)
#   #     sub_string.push(character)
#   #   else
#   #     if current_length > max_length
#   #       max_length = sub_string.length
#   #     end

#   #     sub_string = [string[index]]
#   #     current_length = sub_string.length
#   #   end
#   # end
# end

# Bạn cần xử lý tốt các trường hợp như chuỗi rỗng hoặc chuỗi dài với ký tự lặp lại.
pp length_of_longest_substring("abcabcbb") # => 3   # "abc" là chuỗi con dài nhất không lặp lại
pp length_of_longest_substring("bbbbb") # => 1      # Chỉ có 1 ký tự duy nhất trong chuỗi
pp length_of_longest_substring("pwwkew") # => 3     # "wke" là chuỗi con dài nhất không lặp lại
