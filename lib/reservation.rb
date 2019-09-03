require_relative 'room'

module Hotel
  
  class Reservation
    
    attr_reader :id, :room, :date_range
    
    def initialize(id, room, date_range)
      @id = id
      @room = room
      @date_range = date_range  
    end
    
    def cost
      # cost = @room.cost * (@date_range - 1)
      # return cost
    end
    
  end
  
end