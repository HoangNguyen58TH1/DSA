# nums1.length == m + n == 3 + 3
# nums2.length == n == 3
# Output: [1,2,2,3,5,6]

# s1:
# def merge(nums1, m, nums2, n)
#     for index in 0...n
#         nums1[m+index] = nums2[index]
#     end

#     nums1.sort!
# end

# s2:
# def merge(nums1, m, nums2, n)
#     new_arr = Array.new(m + n)
#     i = 0
#     j = 0
#     index = 0

#     while i < m && j < n
#         if nums2[j] < nums1[i]
#             new_arr[index] = nums2[j]
#             j += 1
#         else
#             new_arr[index] = nums1[i]
#             i += 1
#         end
#         index += 1
#     end

#     while i < m
#         new_arr[index] = nums1[i]
#         i += 1
#         index += 1
#     end

#     while j < n
#         new_arr[index] = nums2[j]
#         j += 1
#         index += 1
#     end

#     nums1.replace(new_arr)
# end

# s3-a
# def merge(nums1, m, nums2, n)
#     i = m - 1
#     j = n - 1
#     index = m + n - 1

#     while i >= 0 && j >= 0
#         if nums2[j] > nums1[i]
#             nums1[index] = nums2[j]
#             j -= 1
#         else
#             nums1[index] = nums1[i]
#             i -= 1
#         end
#         index -= 1
#     end

#     while j >= 0
#         nums1[index] = nums2[j]
#         j -= 1
#         index -= 1
#     end
#     nums1
# end

# s3-b
def merge(nums1, m, nums2, n)
    i = m - 1
    j = n - 1
    index = m + n - 1

    while j >= 0
        if i >= 0 && nums1[i] > nums2[j]
            nums1[index] = nums1[i]
            i -= 1
        else
            nums1[index] = nums2[j]
            j -= 1
        end
        index -= 1
    end
    nums1
end

# nums1 = [1]
# m = 1
# nums2 = []
# n = 0

# nums1 = [0]
# m = 0
# nums2 = [1]
# n = 1

nums1 = [1,2,3,0,0,0]
m = 3
nums2 = [2,5,6]
n = 3
pp merge(nums1, m, nums2, n)

