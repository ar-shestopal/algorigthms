require 'pry'

def find_time(tasks, cooldown)
  last_pos = {}
  time = 0
  current = 0
  next_run = 0

  tasks.each do |task|
    if last_pos.key?(task)
      if current - last_pos[task] <= cooldown
        current = last_pos[task] + cooldown + 1
      else
        current = current + 1
      end
    else
      current = current + 1
    end
    binding.pry
    last_pos[task] = current

  end
  current
end

print(find_time([1, 1, 2, 1], 2))
# 7