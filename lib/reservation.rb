require_relative 'reservation_type'

module Hotel
  
  class Reservation < ReservationType
    
    attr_reader :room
    
    def initialize(room, date_range)
      super(id, date_range)
      @room = room
    end
    
    
    def cost
      @room.cost * @date_range.length
    end
    
    
  end
  
end