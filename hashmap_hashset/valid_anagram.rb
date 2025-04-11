# s = 'b'
# t = 'b'
s = 'bacaa'
t = 'aaabc'

# 1. Sorting
def is_anagram(s, t)
    return false if s.length != t.length

    s.split('').sort.join == t.split('').sort.join
end

# 2. HashMap
def is_anagram(s, t)
    return false if s.length != t.length

    hashS = {}
    hashT = {}
    for i in 0...s.length
        hashS[s[i]] = (hashS[s[i]] || 0) + 1
        hashT[t[i]] = (hashT[t[i]] || 0) + 1
    end

    hashS.each do |k, v|
        return false unless v == hashT[k]
    end

    true
end

# 3. HashMap (optimal)
def is_anagram(s, t)
    return false if s.length != t.length

    count = Array.new(26, 0)
    for i in 0...s.length
        count[s[i].ord - 'a'.ord] += 1
        count[t[i].ord - 'a'.ord] -= 1
    end

    count.all? { |e| e == 0 }
end

# --- run ---
pp is_anagram(s, t)
