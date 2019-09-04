module Hotel
  
  class HotelBooker
    
    attr_accessor :rooms, :reservations
    
    def initialize(num_of_rooms)
      rooms = Hotel::Room.load_all(num_of_rooms)
      @rooms = rooms
      @reservations = []
      
    end
    
    def print_rooms
      list = ""
      @rooms.each do |room|
        list += "Room #{room.number}""\n"
      end
      return list
    end
    
    def new_reservation(check_in, check_out)
      
      date_range = Hotel::DateRange.new(check_in, check_out)
      room = @rooms.sample
      new_reservation = Hotel::Reservation.new(room, date_range)
      
      @reservations << new_reservation
      
    end
    
    
    
    
  end
  
  
  
end