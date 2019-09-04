require_relative 'test_helper'

describe "Hotel Booker" do
  describe "HotelBooker instantiation" do
    before do
      # date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      # @reservation = Hotel::Reservation.new(room, date_range)
      @hotel_booker = Hotel::HotelBooker.new
      
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
  
  
end