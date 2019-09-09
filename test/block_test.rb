require_relative 'test_helper'

describe "Block" do
  describe "Block instantiation" do
    before do
      room = Hotel::Room.new(4)
      date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      res = Hotel::Reservation.new(room, date_range)
      res_2 = Hotel::Reservation.new(room, date_range)
      reservations = [res, res_2]
      
      @block = Hotel::Block.new(date_range, reservations)
    end
    
    it "is an instance of Block" do
      expect(@block).must_be_kind_of Hotel::Block
    end
    
    it "contains an array of instances of Reservation" do
      expect(@block.reservations).must_be_kind_of Array
      expect(@block.reservations[0]).must_be_kind_of Hotel::Reservation
    end
    
    it "contains an instance of DateRange" do
      expect(@block.date_range).must_be_kind_of Hotel::DateRange
    end
    
    it "will raise an Argument error if there are more than five rooms" do
      room = Hotel::Room.new(4)
      date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      res = Hotel::Reservation.new(room, date_range)
      res_2 = Hotel::Reservation.new(room, date_range)
      reservations = [res, res_2, res, res_2, res, res_2]
      
      expect{Hotel::Block.new(date_range, reservations)}.must_raise ArgumentError
    end
    
    
  end
  
  describe "Block cost" do
    before do
      room = Hotel::Room.new(4, 150)
      date_range = Hotel::DateRange.new("10-22-2019", "10-24-2019")
      res = Hotel::Reservation.new(room, date_range)
      res_2 = Hotel::Reservation.new(room, date_range)
      reservations = [res, res_2]
      
      @block = Hotel::Block.new(date_range, reservations)
      
    end
    
    it "will return the discounted room cost for one room reservation from the block" do
      expect(@block.cost).must_equal 300
    end
  end
end