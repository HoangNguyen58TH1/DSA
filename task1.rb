# require 'debug'
# array_1 = [20, 50, 80, 100, 40]
array_1 = [2, 5, 8, 10, 4]
array_2 = [1, 6, 4, 8, 3]

# way 1
# result = []
# array_1.map do |a1|
#   array_2.map do |a2|
#     result << a1 if a1 == a2
#   end
# end
# pp "result: #{result}"

# way 2
result = []
pp array_1 = array_1.sort # [2, 4, 5, 8, 10]
pp array_2 = array_2.sort # [1, 3, 4, 6, 8]
return result if array_1.first > array_2.last
array_1.map do |a1|
  abc
  next if a1 < array_2.first || a1 > array_2.last

  # [1, 3, 4, 6, 8]
  array_2.map do |a2|
    # 2 < 1
    # 2 < 3
    break if a1 < a2
    result << a1 if a1 == a2
  end
end
pp "result: #{result}"