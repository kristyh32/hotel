require_relative 'room'
require 'pry'

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
      
      same_date_res = @reservations.select do |reservation| 
        reservation.date_range.overlap?(check_in, check_out) == true
      end
      
      taken_rooms = same_date_res.map { |reservation| reservation.room }
      
      avail_rooms = @rooms.select { |room| taken_rooms.include?(room) == false }
      
      if avail_rooms.length == 0
        raise ArgumentError.new("There are no hotel rooms avaialbe for that time frame")
      end
      
      selected_room = avail_rooms.sample
      
      new_reservation = Hotel::Reservation.new(selected_room, date_range)
      
      @reservations << new_reservation
      
    end
    
    def find_by_date(date)
      res_by_date = @reservations.select do |reservation|
        reservation.date_range.include?(date) == true 
      end
      return res_by_date
    end
    
    
    
    
  end
  
  
  
end