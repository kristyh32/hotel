module Hotel
  
  class HotelBooker
    
    attr_accessor :rooms, :reservations
    
    def initialize
      rooms = Hotel::Room.load_all
      @rooms = rooms
      @reservations = []
      
    end
    
    def print_rooms
      puts @rooms
    end
    
    
    
  end
  
  
  
end