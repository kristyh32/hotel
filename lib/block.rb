require_relative 'reservation_type'
require 'securerandom'

module Hotel
  
  class Block < ReservationType
    attr_reader :reservations
    
    def initialize(date_range, reservations = [])
      super(id, date_range)
      
      if reservations.length > 5
        raise ArgumentError.new("A block may only have up to 5 rooms")
      else
        @reservations = reservations
      end
      
    end
    
    def cost
      res = @reservations.sample
      cost = res.room.cost * date_range.length
    end
    
    def avail_rooms
      rooms = []
      @reservations.each do |reservation|
        rooms << reservation.room
      end
      return rooms
    end
    
  end
end