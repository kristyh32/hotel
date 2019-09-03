require_relative 'test_helper'

describe "Room" do
  describe "Room instantiation" do
    before do
      @room = Hotel::Room.new(5)
    end
    
    it "is an instance of Room" do
      expect(@room).must_be_kind_of Hotel::Room
    end
    
    it "can accurately return room number and cost" do
      expect(@room.number).must_equal 5
      expect(@room.cost).must_equal 200
    end
    
  end
  
  describe "self.load all" do
    before do
      @rooms = Hotel::Room.load_all
    end
    
    it "will contain instances of Room" do
      expect(@rooms[4]).must_be_kind_of Hotel::Room
    end
    
    it "will return an array with the correct numberof Room" do
      expect(@rooms.length).must_equal 20
    end
    
  end
end