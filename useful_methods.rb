1. Array
- find_index
- each_with_index
- Array.new(26, 0)
- Lưu ý: a = [], b = []
+ a = b --> chỉ là a trỏ đến object b thôi (value a[] vẫn giữ nguyên)
+ a.replace(b) --> replace luôn a[] thành a[b]
+ Consider should be go to ASC or DESC direction
- 2 indices: 1 cái loop, 1 cái để update value cần update
- arr.slice --> slice là lấy ra element ở index đó (can use slice!)

2. String
- each_char
- string.each_char.with_index > string.split('').each_with_index
- s.split('').sort.join
- index
- character.ord

3. Hash
- indices = {}
  s.each_char do |value|
      indices[value] = (indices[value] || 0) + 1
  end
- 

4. Stack (FILO):
- push + pop + last
- maybe use mapping dấu đóng mở brackets to check

5. Queue (FIFO):
- push + shift + first

6. Linked List:
- head.next.val
- head.next or head.next.next
- curN = curN.next
- dummy = ListNode.new(-1)
- preN = dummy, curN = head, nextN = nil
- 2 pointer & 3 pointers
- Mấy bài tìm middle (length/2, increase 1 if %2. fast&slow increase 1 increase 2)
- 