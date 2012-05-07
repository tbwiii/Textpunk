class Engine

  def initialize(map,start)

    @map = map

    @start = start
    
  end

  def play()

    next_room = @start

    while true
      puts "\n--------"
      room = @map.method(next_room)
      next_room = room.call()
    end
  end
end

