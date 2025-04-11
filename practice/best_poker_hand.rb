# "Flush": Five cards of the same suit.
# "Three of a Kind": Three cards of the same rank.
# "Pair": Two cards of the same rank.
# "High Card": Any single card.

# def best_hand(ranks, suits)
#     results = ["Flush", "Three of a Kind", "Pair", "High Card"]
#     hash = Hash.new(0)
#     ranks.each { |rank| hash[rank] += 1 }

#     return results[0] if suits.uniq.length == 1

#     max_count = hash.values.max
#     return results[1] if max_count >= 3
#     return results[2] if max_count == 2

#     results[3]
# end

def best_hand(ranks, suits)
    results = ["Flush", "Three of a Kind", "Pair", "High Card"]
    return results[0] if suits.uniq.length == 1

    max_count = ranks.tally.values.max
    return results[1] if max_count >= 3
    return results[2] if max_count == 2

    results[3]
end

# --> time complexity: O(1)
# --> space complexity: O(1)

# ranks = [13,2,3,1,9]; suits = ["a","a","a","a","a"]
# Output: "Flush"
# ranks = [4,4,2,4,4]; suits = ["d","a","a","b","c"]
# Output: "Three of a Kind"
# ranks = [10,10,2,12,9]; suits = ["a","b","c","a","d"]
# Output: "Pair"
ranks = [2,10,7,10,7]; suits = ["a","b","a","d","b"]
# Output: "Pair"
pp best_hand(ranks, suits)
