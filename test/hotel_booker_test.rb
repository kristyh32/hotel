require_relative 'test_helper'
require 'pry'

describe "Hotel Booker" do
  describe "HotelBooker instantiation" do
    before do
      # date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      # @reservation = Hotel::Reservation.new(room, date_range)
      @hotel_booker = Hotel::HotelBooker.new(20)
    end
    
    it "contains an array of all instances of Room" do
      expect(@hotel_booker.rooms).must_be_kind_of Array
      expect(@hotel_booker.rooms[2]).must_be_kind_of Hotel::Room
      expect(@hotel_booker.rooms.length).must_equal 20
    end
    
    it "makes an empty array to hold reservations" do
      expect(@hotel_booker.reservations).must_be_kind_of Array 
    end
    
  end
  
  describe "print rooms" do
    before do
      # date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      # @reservation = Hotel::Reservation.new(room, date_range)
      @hotel_booker = Hotel::HotelBooker.new(20)
    end
    
    it "will display a list of all hotel rooms" do
      list = @hotel_booker.print_rooms
      expect(list[-3]).must_equal "2"
    end
  end
  
  describe "new reservation" do
    before do
      # date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      # @reservation = Hotel::Reservation.new(room, date_range)
      @hotel_booker = Hotel::HotelBooker.new(20)
    end
    
    it "will create a new instance of reservation" do
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      expect(@hotel_booker.reservations[0]).must_be_kind_of Hotel::Reservation
      
    end
    
    it "will add the reservation to the @reservations variable" do
      before = @hotel_booker.reservations.length
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      after = @hotel_booker.reservations.length
      expect(after - before).must_equal 1
      
    end
    
    it "will not select a room that has already been reserved" do
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      room_1 = @hotel_booker.reservations[0].room
      room_2 = @hotel_booker.reservations[1].room
      expect(room_1).wont_equal room_2
      expect(room_1).must_be_kind_of Hotel::Room
      expect(room_2).must_be_kind_of Hotel::Room
    end
    
    it "will raise an ArgumentError if there are no avialable rooms" do
      20.times do
        @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      end
      expect{ @hotel_booker.new_reservation("10-22-2019", "10-23-2019") }.must_raise ArgumentError
    end
    
  end
  
  describe "find by date" do
    before do
      
      @hotel_booker = Hotel::HotelBooker.new(20)
      @hotel_booker.new_reservation("10-22-2019", "10-24-2019")
    end
    
    it "will return a list of all reservations that include the date passed in" do
      find = @hotel_booker.find_by_date("10-23-2019")
      expect(find).must_be_kind_of Array
      expect(find[0]).must_be_kind_of Hotel::Reservation
      expect(find.length).must_equal 1
    end
    
    it "will return an empty array if there are no reservations that match that date" do
      find = @hotel_booker.find_by_date("10-25-2019")
      expect(find).must_be_kind_of Array
      expect(find.length).must_equal 0
    end
    
  end
  
  
  
  
  
end