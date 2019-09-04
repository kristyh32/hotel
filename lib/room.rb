
module Hotel
  
  class Room
    
    attr_reader :number
    attr_accessor :cost
    
    def initialize(number, cost = 200)
      @number = number
      @cost = cost
    end
    
    def self.load_all(num_of_rooms)
      rooms = []
      num_of_rooms.times do |num|
        rooms << Hotel::Room.new(num + 1)
      end
      return rooms
    end
  end
end