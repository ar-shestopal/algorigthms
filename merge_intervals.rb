class Interval
  attr_accessor :st, :en

  def initialize(istart, iend)
    @st = istart
    @en = iend
  end

  def to_s
    "[#{st}..#{en}]"
  end
end

def merge(intervals)
  merged = []
  intervals.sort_by! { |int| int.st }

  istart = intervals.first.st
  iend = intervals.first.en

  intervals.each do |interval|
    if interval.st <= iend
      iend = [iend, interval.en].max
    else
      merged << Interval.new(istart, iend)
      istart = interval.st
      iend = interval.en
    end
  end
  merged << Interval.new(istart, iend)
  merged
end

merge([Interval.new(1, 4), Interval.new(2, 5), Interval.new(7, 9)]).each do |int|
  print("#{int} ")
end
p ''
merge([Interval.new(6, 7), Interval.new(2, 4), Interval.new(5, 9)]).each do |int|
  print("#{int} ")
end

def insert(intervals, new_interval)
  intervals = intervals.map { |int| Interval.new(*int) }
  new_interval = Interval.new(*new_interval)
  merged = []

  i = 0
  st = 0
  en = 1

  while i < intervals.size && intervals[i].en < new_interval.st
    merged << intervals[i]
    i += 1
  end

  while i < intervals.size && intervals[i].st < new_interval.en
    new_interval.st = [intervals[i].st, new_interval.st].min
    new_interval.en = [intervals[i].en, new_interval.en].max
    i += 1
  end

  merged << new_interval

  while i < intervals.size
    merged << intervals[i]
    i += 1
  end

 merged
end


p insert([[1, 3], [5, 7], [8, 12]], [4, 6]).map(&:to_s)
p insert([[1, 3], [5, 7], [8, 12]], [4, 10]).map(&:to_s)
p insert([[2, 3], [5, 7]], [1, 4]).map(&:to_s)

def min_meeting_rooms(intervals)
  intervals = intervals.sort_by!(&:st)
  heap = []
  min_rooms = 0
  intervals.each do |int|
    heap.sort_by!(&:en)

    heap.shift while heap.any? && heap[0].en <= int.st

    heap << int
    heap.sort_by!(&:en)
    min_rooms = [heap.size, min_rooms].max
  end

  min_rooms
end

p min_meeting_rooms([Interval.new(4, 5), Interval.new(2, 3), Interval.new(2, 4), Interval.new(3, 5)])
p min_meeting_rooms([Interval.new(1, 4), Interval.new(2, 5), Interval.new(7, 9)])
p min_meeting_rooms([Interval.new(6, 7), Interval.new(2, 4), Interval.new(8, 12)])
p min_meeting_rooms([Interval.new(1, 4), Interval.new(2, 3), Interval.new(3, 6)])
p min_meeting_rooms([Interval.new(4, 5), Interval.new(2, 3), Interval.new(2, 4), Interval.new(3, 5)])