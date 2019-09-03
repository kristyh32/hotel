require 'date'
require_relative 'date_range'

module Hotel
  
  
  class Calendar 
    
    attr_accessor :rooms, :reservations
    
    def initialize(rooms = [], reservations = [])
      @rooms = rooms
      @reservations = reservations
    end
    
    
    
    
    
    # today           = Date.today
    # tomorrow        = today + 1
    # one_month_later = today >> 1
    
    # tomorrow.between?(today, one_month_later)
    
  end
end