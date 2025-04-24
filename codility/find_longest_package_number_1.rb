def solution(clients)
  max = 0
  shelf = []
  first_client_index = 0

  for index in 1..clients.length
    if clients[first_client_index] > index
      shelf.push # shelf += 1 (if shelf is a number - not array)
      max = [max, shelf.length].max
    else
      first_client_index += 1
    end
  end

  max
end

pp solution([3, 1, 2, 4, 5]) # 2
pp solution([1, 2, 3, 4, 5]) # 0
pp solution([6, 1, 2, 3, 4, 5]) # 5
