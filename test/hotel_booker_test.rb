require_relative 'test_helper'

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
      reserve = @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      expect(reserve[0]).must_be_kind_of Hotel::Reservation
      
    end
    
    it "will add the reservation to the @reservations variable" do
      before = @hotel_booker.reservations.length
      @hotel_booker.new_reservation("10-22-2019", "10-23-2019")
      after = @hotel_booker.reservations.length
      expect(after - before).must_equal 1
      
    end
    
  end
  
  
  
  
  
end