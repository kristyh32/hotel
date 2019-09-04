require_relative 'room'
require 'securerandom'
require_relative 'date_range'


module Hotel
  
  class Reservation
    
    attr_reader :id, :room, :date_range
    
    def initialize(room, date_range)
      @id = SecureRandom.hex(8)
      @room = room
      @date_range = date_range  
    end
    
    
    def cost
      cost = @room.cost * (@date_range.length)
      return cost
    end
    
    
  end
  
end