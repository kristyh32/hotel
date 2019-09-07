require_relative 'reservation_type'
require 'securerandom'

module Hotel
  
  class Block < ReservationType
    attr_reader :reservations
    
    def initialize(date_range, reservations = [])
      super(id, date_range)
      @reservations = reservations
    end
    
    def cost
      res = @reservations.sample
      cost = res.room.cost * date_range.length
    end
    
  end
  
end