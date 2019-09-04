require_relative 'test_helper'

describe "Reservation" do
  describe "Reservation instantiation" do
    before do
      room = Hotel::Room.new(4)
      date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      @reservation = Hotel::Reservation.new(room, date_range)
    end
    
    it "is an instance of Reservation" do
      expect(@reservation).must_be_kind_of Hotel::Reservation
    end
    
    it "contains an instance of Room" do
      expect(@reservation.room).must_be_kind_of Hotel::Room
    end
    
    it "contains an instance of DateRange" do
      expect(@reservation.date_range).must_be_kind_of Hotel::DateRange
    end
    
  end
  
  describe "cost" do
    before do
      room = Hotel::Room.new(4)
      date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      @reservation = Hotel::Reservation.new(room, date_range)
    end
    
    it "will accurately return the cost of a reservation" do
      expect(@reservation.cost).must_equal 400
    end
    
  end
end