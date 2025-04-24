class Results
  attr_accessor :set_name, :selected_cards
end

# convert to compare. because J,Q,K,A can not compare
CONVERT_RANKS = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
  '8' => 8, '9' => 9, '10' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14
}
CONVERT_SUITES = { 'S' => 4, 'H' => 3, 'D' => 2, 'C' => 1 }

def analyze_cards(card)
  card.map do |card|
    {
      card: card,
      rank: card[0..-2],
      rank_convert: CONVERT_RANKS[card[0..-2]],
      suite: card[-1],
      suite_convert: CONVERT_SUITES[card[-1]]
    }
  end
end

def solution(cards)
  result = Results.new
  set_names = ['single card', 'pair', 'triple', 'five in a row', 'suit', 'a triple and a pair']
  cards = analyze_cards(cards)

  # 6. a triple and a pair
  groups = cards.group_by { |card| card[:rank_convert] }.values
  triple = groups.select { |g| g.size >= 3 }.max_by { |g| g[0][:rank_convert] }
  pair = groups.select { |g| g.size >= 2 && g[0][:rank_convert] != triple&.first&.dig(:rank_convert) }
               .max_by { |g| g[0][:rank_convert] }
  if triple && pair
    result.set_name = set_names[5]
    result.selected_cards = (triple.take(3) + pair.take(2)).map { |c| c[:card] }
    return result
  end

  # 5. suit
  suit_group = cards.group_by { |card| card[:suite] }.values
                    .select { |g| g.size >= 5 }.max_by { |g| g[0][:suite_convert] }
  if suit_group
    result.set_name = set_names[4]
    result.selected_cards = suit_group.take(5).map { |c| c[:card] }
    return result
  end

  # 4. five in a row
  uniq_ranks = cards.uniq { |c| c[:rank_convert] }.sort_by { |c| c[:rank_convert] }
  best_window = nil
  uniq_ranks.map.with_index do |_, i|
    window = uniq_ranks[i, 5]
    next if window.size < 5

    serial = window.each_cons(2).all? { |a, b| b[:rank_convert] == a[:rank_convert] + 1 }
    can_update_best_window = best_window.nil? || (window.last[:rank_convert] > best_window.last[:rank_convert])
    if serial && can_update_best_window
      best_window = window
    end
  end
  if best_window
    result.set_name = set_names[3]
    result.selected_cards = best_window.map { |c| c[:card] }
    return result
  end

  # 3. triple
  triple = groups.select { |g| g.size >= 3 }.max_by { |g| g[0][:rank_convert] }
  if triple
    result.set_name = set_names[2]
    result.selected_cards = triple.take(3).map { |card| card[:card] }
    return result
  end

  # 2. pair
  pair = groups.select { |g| g.size == 2 }.max_by { |g| g[0][:rank_convert] }
  if pair
    result.set_name = set_names[1]
    result.selected_cards = pair.map { |card| card[:card] }
    return result
  end

  # 1. single card
  max = cards.max_by { |c| c[:rank_convert] }
  result.set_name = set_names[0]
  result.selected_cards = [max[:card]]
  result
end

pp '---------------------------'
pp 'a triple and a pair'
pp solution(['10D', '10H', '10C', '2S', '2H', 'JH', 'JC']) # '10D', '10H', '10C', 'JH', 'JC'
pp solution(['10D', '10H', '10C', '10S', '2H', 'JH', 'JC', 'QH', 'QC']) # '10D', '10H', '10C', 'QH', 'QC'
pp '---------------------------'
pp 'suit'
pp solution(['2S', '3S', '4S', '5S', '6S', '10H']) # '2S', '3S', '4S', '5S', '6S'
pp solution(['2H', '3H', '4H', '6H', '5H', '9S', '10S', 'JS', 'KS', 'AS']) # '9S', '10S', 'JS', 'KS', 'AS'
pp '---------------------------'
pp 'five in a row'
# cái lốc = 5 card liên tiếp có thứ hạng cao nhất, start với card cao nhất
pp solution(['2S', '3D', '4D', '5C', '6S', 'QH', '8H', '9H']) # '2S', '3D', '4D', '5C', '6S'
pp solution(['2S', '3D', '4D', '5S', '6S', 'QH', '8H', '6H']) # '2S', '3D', '4D', '5S', '6S'
pp solution(['2S', '3D', '4D', '5S', '6S', '7H', '8H', '9H']) # '5S', '6S', '7H', '8H', '9H'
pp solution(['2C', '3D', '4D', '5S', '6S', '7H', '8H', '9C', '10C', 'JD']) # '7H', '8H', '9C', '10C', 'JD'
pp solution(['2S', '3D', '4D', '5S', '6S', '5H', '6D', '7D', '8H', '9H']) # '5S', '6S', '7D', '8H', '9H'
pp solution(['10C', 'JC', 'QD', 'KD','3D', '4S', '5S', '6S', '7H', 'AC']) # '10C', 'JC', 'QD', 'KD', 'AC'
pp '---------------------------'
pp 'triple'
pp solution(['10D', '10H', '10C', '2S', '3H', 'JH', 'KC']) # ['10D', '10H', '10C']
pp solution(['AD', 'AH', 'AC', '2S', '3H', 'JH', 'KC']) # ['AD', 'AH', 'AC']
pp solution(['2S', '3H', 'KD', 'KH', 'KC', 'KS', 'QC']) # ['KD', 'KH', 'KC']
pp '---------------------------'
pp 'pair'
pp solution(['10C', '2S', '4S', '4H', 'AD', 'AH', 'JC']) # 'AD', 'AH'
pp solution(['10C', '3S', 'KS', 'KH', '2D', '2H', 'JC', 'JS']) # 'KS', 'KH'
pp '---------------------------'
pp 'highest single'
pp solution(['10D', 'JH', '3C', '2S', '6H', 'AH', 'QC']) # AH
pp solution(['10D', 'JH', '3C', '2S', '6H', '5H', 'QC']) # QC
pp solution(['KD', 'JH', '3C', '2S', '6H', '8H', 'QC']) # KD
pp '---------------------------'

# N cards
# suite = {
#   bích: S(spades),
#   cơ: H(hearts),
#   rô: D(diamonds),
#   chuồn: C(clubs),
# }
# --> 2,3,4,5,6,7,8,9,10,J,Q,K,A
# N = rank,suite = hạng,bộ (example '10S')
# N elements (max 10 elements)

# 'single card': 1 la bai co rank cao nhat, suite no matter
# 'pair': 2 la bai cung rank cao nhat, suite no matter
# 'triple': 3 la bai cung rank, suite no matter
# 'five in a row': 1 cái lốc = 5 card liên tiếp có thứ hạng cao nhất, start với card cao nhất
# 'suit': 5 cards cung suite, rank no matter, chọn suite cao nhất bích --> cơ --> rô --> chuồn
# 'a triple and a pair': 5 cards includes 3 cards cùng rank, 2 cards cùng rank. Chọn thứ hạng cao nhất của bộ 3, rồi thứ hạng cao nhất của bộ 2
