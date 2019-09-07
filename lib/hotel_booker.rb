require 'pry'
require_relative 'room'


module Hotel
  
  class HotelBooker
    
    attr_accessor :rooms, :reservations, :blocks
    
    def initialize(num_of_rooms)
      rooms = Hotel::Room.load_all(num_of_rooms)
      @rooms = rooms
      @reservations = []
      @blocks = []
      
    end
    
    def print_rooms
      list = ""
      @rooms.each do |room|
        list += "Room #{room.number}""\n"
      end
      return list
    end
    
    # def add_reservation(reservation)
    #   @reservations << reservation
    # end
    def new_date_range(check_in, check_out)
      date_range = Hotel::DateRange.new(check_in, check_out)
    end
    
    def new_reservation(check_in, check_out)
      
      date_range = self.new_date_range(check_in, check_out)
      avail_rooms = self.available_rooms(check_in, check_out)
      
      selected_room = avail_rooms.sample
      new_reservation = Hotel::Reservation.new(selected_room, date_range)
      
      @reservations << new_reservation
      
    end
    
    
    def available_rooms(check_in, check_out)
      
      same_date_res = @reservations.select do |reservation| 
        reservation.date_range.overlap?(check_in, check_out) == true
      end
      
      same_date_res << @blocks.map do |block|
        block.reservations.select do |reservation|
          reservation.date_range.overlap?(check_in, check_out) == true
        end
      end
      
      taken_rooms = same_date_res.flatten.map { |reservation| reservation.room }
      
      avail_rooms = @rooms.select { |room| taken_rooms.include?(room) == false }
      
      if avail_rooms.length == 0
        raise ArgumentError.new("There are no hotel rooms avaialbe for that time frame")
      end
      
      return avail_rooms
      
    end
    
    def find_by_date(date)
      res_by_date = @reservations.select do |reservation|
        reservation.date_range.include?(date) == true 
      end
      return res_by_date
    end
    
    def new_block(check_in, check_out, num_of_rooms, room_rate)
      date_range = self.new_date_range(check_in, check_out)
      block_res = []
      num_of_rooms.times do
        self.new_reservation(check_in, check_out)
        hold = @reservations.pop
        hold.room.cost = room_rate
        block_res << hold
      end
      
      new_block = Hotel::Block.new(date_range, block_res)
      
      @blocks << new_block
      
    end
    
    
    
    
    
    
  end
  
  
  
end