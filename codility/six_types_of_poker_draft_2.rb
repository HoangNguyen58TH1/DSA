# RANK_ORDER = {
#   '3' => 3, '4' => 4, '5' => 5, '6' => 6,
#   '7' => 7, '8' => 8, '9' => 9, '10' => 10,
#   'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14, '2' => 15
# }

# def parse_cards(cards)
#   cards.map do |card|
#     rank = card[0..-2]
#     suite = card[-1]
#     {
#       card: card,
#       rank_str: rank,
#       rank: RANK_ORDER[rank],
#       suite: suite
#     }
#   end
# end

# def detect_best_hand(cards_raw)
#   cards = parse_cards(cards_raw)

#   # Full house
#   groups = cards.group_by { |c| c[:rank_str] }.values
#   triple = groups.select { |g| g.size == 3 }.max_by { |g| g[0][:rank] }
#   pair = groups.select { |g| g.size >= 2 && g[0][:rank_str] != triple&.first&.dig(:rank_str) }
#                .max_by { |g| g[0][:rank] }
#   if triple && pair
#     return {
#       'set_name' => 'Full House',
#       'selected_cards' => (triple + pair.take(2)).map { |c| c[:card] }
#     }
#   end

#   # Flush
#   flush_group = cards.group_by { |c| c[:suite] }.values.find { |g| g.size >= 5 }
#   if flush_group
#     top_flush = flush_group.sort_by { |c| -c[:rank] }.take(5)
#     return {
#       'set_name' => 'Flush',
#       'selected_cards' => top_flush.map { |c| c[:card] }
#     }
#   end

#   # Straight
#   uniq_ranks = cards.uniq { |c| c[:rank] }.sort_by { |c| c[:rank] }
#   uniq_ranks.map.with_index do |_, i|
#     window = uniq_ranks[i, 5]
#     next if window.size < 5
#     if window.each_cons(2).all? { |a, b| b[:rank] == a[:rank] + 1 }
#       return {
#         'set_name' => 'Straight',
#         'selected_cards' => window.map { |c| c[:card] }
#       }
#     end
#   end

#   # Three of a Kind
#   triple = groups.select { |g| g.size == 3 }.max_by { |g| g[0][:rank] }
#   if triple
#     return {
#       'set_name' => 'Three of a Kind',
#       'selected_cards' => triple.map { |c| c[:card] }
#     }
#   end

#   # Pair
#   pair = groups.select { |g| g.size == 2 }.max_by { |g| g[0][:rank] }
#   if pair
#     return {
#       'set_name' => 'Pair',
#       'selected_cards' => pair.map { |c| c[:card] }
#     }
#   end

#   # Highest Card
#   high = cards.max_by { |c| c[:rank] }
#   return {
#     'set_name' => 'Highest Card',
#     'selected_cards' => [high[:card]]
#   }
# end

# 1.
groups = [
  [
    {:card=>"10D", :rank=>"10", :suite=>"D", :rank_convert=>10},
    {:card=>"10H", :rank=>"10", :suite=>"H", :rank_convert=>10},
    {:card=>"10C", :rank=>"10", :suite=>"C", :rank_convert=>10}
  ],
  [
    {:card=>"2S", :rank=>"2", :suite=>"S", :rank_convert=>2},
    {:card=>"2H", :rank=>"2", :suite=>"H", :rank_convert=>2}
  ],
  [
    {:card=>"JH", :rank=>"J", :suite=>"H", :rank_convert=>11},
    {:card=>"JC", :rank=>"J", :suite=>"C", :rank_convert=>11}
  ]
]

[
  [
    {:card=>"QD", :rank=>"Q", :suite=>"D", :rank_convert=>12},
    {:card=>"QH", :rank=>"Q", :suite=>"H", :rank_convert=>12},
    {:card=>"QC", :rank=>"Q", :suite=>"C", :rank_convert=>12}
  ],
  [
    {:card=>"KD", :rank=>"K", :suite=>"D", :rank_convert=>13},
    {:card=>"KH", :rank=>"K", :suite=>"H", :rank_convert=>13},
    {:card=>"KC", :rank=>"K", :suite=>"C", :rank_convert=>13}
  ]
].max_by { |g| g[0][:rank_convert] }

triple = [
  {:card=>"KD", :rank=>"K", :suite=>"D", :rank_convert=>13},
  {:card=>"KH", :rank=>"K", :suite=>"H", :rank_convert=>13},
  {:card=>"KC", :rank=>"K", :suite=>"C", :rank_convert=>13}
]
pair = [
  {:card=>"QD", :rank=>"Q", :suite=>"D", :rank_convert=>12},
  {:card=>"QC", :rank=>"Q", :suite=>"C", :rank_convert=>12},
  {:card=>"QH", :rank=>"Q", :suite=>"H", :rank_convert=>12},
].take(2)

# suite = {
#   bích: S(spades),
#   cơ: H(hearts),
#   rô: D(diamonds),
#   chuồn: C(clubs),
# }

# 2.
cards = [
  {:card=>"2S", :rank=>"2", :suite=>"S", :rank_convert=>2},
  {:card=>"3S", :rank=>"3", :suite=>"S", :rank_convert=>3},
  {:card=>"4S", :rank=>"4", :suite=>"S", :rank_convert=>4},
  {:card=>"5S", :rank=>"5", :suite=>"S", :rank_convert=>5},
  {:card=>"6S", :rank=>"6", :suite=>"S", :rank_convert=>6},
  {:card=>"10H", :rank=>"10", :suite=>"H", :rank_convert=>10}
]
values = [
  [
    {:card=>"2S", :rank=>"2", :suite=>"S", :rank_convert=>2},
    {:card=>"3S", :rank=>"3", :suite=>"S", :rank_convert=>3},
    {:card=>"4S", :rank=>"4", :suite=>"S", :rank_convert=>4},
    {:card=>"5S", :rank=>"5", :suite=>"S", :rank_convert=>5},
    {:card=>"6S", :rank=>"6", :suite=>"S", :rank_convert=>6}
  ],
  [
    {:card=>"10H", :rank=>"10", :suite=>"H", :rank_convert=>10}
  ]
]

suit_group = [
  {:card=>"2H", :rank=>"2", :rank_convert=>2, :suite=>"H", :suite_convert=>2}, 
  {:card=>"3H", :rank=>"3", :rank_convert=>3, :suite=>"H", :suite_convert=>2}, 
  {:card=>"4H", :rank=>"4", :rank_convert=>4, :suite=>"H", :suite_convert=>2}, 
  {:card=>"6H", :rank=>"6", :rank_convert=>6, :suite=>"H", :suite_convert=>2}, 
  {:card=>"5H", :rank=>"5", :rank_convert=>5, :suite=>"H", :suite_convert=>2}
]

cards = [
  {:card=>"10D", :rank=>"10", :rank_convert=>10, :suite=>"D", :suite_convert=>2},
  {:card=>"11H", :rank=>"11", :rank_convert=>nil, :suite=>"H", :suite_convert=>3},
  {:card=>"3C", :rank=>"3", :rank_convert=>3, :suite=>"C", :suite_convert=>1},
  {:card=>"2S", :rank=>"2", :rank_convert=>2, :suite=>"S", :suite_convert=>4},
  {:card=>"6H", :rank=>"6", :rank_convert=>6, :suite=>"H", :suite_convert=>3},
  {:card=>"AH", :rank=>"A", :rank_convert=>14, :suite=>"H", :suite_convert=>3},
  {:card=>"QC", :rank=>"Q", :rank_convert=>12, :suite=>"C", :suite_convert=>1}
]
cards.max_by { |c| c[:rank_convert] }

# 3.
cards = [
  {:card=>"2S", :rank=>"2", :rank_convert=>2, :suite=>"S", :suite_convert=>4},
  {:card=>"3S", :rank=>"3", :rank_convert=>3, :suite=>"S", :suite_convert=>4},
  {:card=>"4S", :rank=>"4", :rank_convert=>4, :suite=>"S", :suite_convert=>4},
  {:card=>"5S", :rank=>"5", :rank_convert=>5, :suite=>"S", :suite_convert=>4},
  {:card=>"6S", :rank=>"6", :rank_convert=>6, :suite=>"S", :suite_convert=>4},
  {:card=>"QH", :rank=>"Q", :rank_convert=>12, :suite=>"H", :suite_convert=>3},
  {:card=>"8H", :rank=>"8", :rank_convert=>8, :suite=>"H", :suite_convert=>3},
  {:card=>"6H", :rank=>"6", :rank_convert=>6, :suite=>"H", :suite_convert=>3}
]
uniq_ranks = [
  {:card=>"2S", :rank=>"2", :rank_convert=>2, :suite=>"S", :suite_convert=>4},
  {:card=>"3S", :rank=>"3", :rank_convert=>3, :suite=>"S", :suite_convert=>4},
  {:card=>"4S", :rank=>"4", :rank_convert=>4, :suite=>"S", :suite_convert=>4},
  {:card=>"5S", :rank=>"5", :rank_convert=>5, :suite=>"S", :suite_convert=>4},
  {:card=>"6S", :rank=>"6", :rank_convert=>6, :suite=>"S", :suite_convert=>4},
  {:card=>"8H", :rank=>"8", :rank_convert=>8, :suite=>"H", :suite_convert=>3},
  {:card=>"QH", :rank=>"Q", :rank_convert=>12, :suite=>"H", :suite_convert=>3}
]

def check_straight(cards)
  uniq_ranks = cards.uniq { |c| c[:rank] }.sort_by { |c| c[:rank] }
  best_window = nil

  uniq_ranks.each_with_index do |_, i|
    window = uniq_ranks[i, 5]
    next if window.size < 5

    if window.each_cons(2).all? { |a, b| b[:rank] == a[:rank] + 1 }
      if best_window.nil? || window.last[:rank] > best_window.last[:rank]
        best_window = window
      end
    end
  end

  if best_window
    {
      'set_name' => 'Straight',
      'selected_cards' => best_window.map { |c| c[:card] }
    }
  end
end
