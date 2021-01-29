
def longest_run(num)
  current_run = 0
  longest_run = 0

  bitmask = 1
  while num != 0
    if (num & bitmask).zero?
      longest_run = [current_run, longest_run].max
      current_run = 0
    else
      current_run += 1
    end
    num = num >> 1
  end

  [current_run, longest_run].max
end

p longest_run(242)