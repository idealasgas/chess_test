require 'progress_bar'

class Map
	def initialize
    @x = 0
    @y = 0
  end

  def move_vertical
    possibility = rand(100) + 1
    if (1..30).include?(possibility)
      @y += 1
    end
    if (31..50).include?(possibility)
      @y -= 1
    end
  end

  def move_horizontal
    possibility = rand(100) + 1
    if (1..40).include?(possibility)
      @x += 1
    end
    if (41..60).include?(possibility)
      @x -= 1
    end
  end

  def move
    move_horizontal
    move_vertical
  end

  def move_5_times
    5.times do
      move
    end
  end

  def stays_the_same?
    move_5_times
    if (@x.zero? && @y.zero?)
      return true
    else
      return false
    end
  end
end


possibility = 0
loop_number = 1_000_000

bar = ProgressBar.new(loop_number)

loop_number.times do
  map = Map.new
  if map.stays_the_same?
    possibility += 1
  end
  bar.increment!
end

possibility = (possibility * 100) / loop_number

puts "#{possibility}%"


