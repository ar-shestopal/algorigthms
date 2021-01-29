def get_bonuses(performances)
  count = performances.size

  bonus = [1] * count
  (1).upto(count-1) do |i|
    bonus[i] += 1 if performances[i] > performances[i-1]
  end
  (count-2).downto(1) do |j|
    bonus[j] += 1 if performances[j] > performances[j+1]
  end
  bonus
end

print get_bonuses([1, 2, 3, 2, 3, 5, 1]).inspect
# [1, 2, 3, 1, 2, 3, 1]
