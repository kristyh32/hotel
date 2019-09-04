require_relative 'test_helper'

describe "DateRange" do
  describe "DateRange instantiation" do
    before do
      @dates = Hotel::DateRange.new("10-22-2019", "10-24-2019")
    end
    
    it "is an instance of DateRange" do
      expect(@dates).must_be_kind_of Hotel::DateRange
    end
    
    it "has start and end time variables as instances of Date" do
      expect(@dates.check_in).must_be_kind_of Date
      expect(@dates.check_out).must_be_kind_of Date
    end
    
    it "stores the Date correctly given a string date input" do
      expect(@dates.check_in.strftime("%m-%d-%Y")).must_equal "10-22-2019"
      expect(@dates.check_out.strftime("%m-%d-%Y")).must_equal "10-24-2019"
    end
    
    it "will raise an Argument Error if the end date is before the start date" do
      expect{dates = Hotel::DateRange.new("10-24-2019", "10-22-2019")}.must_raise ArgumentError
    end
    
    it "will raise an Argument Error if an invalid date is entered" do
      expect{dates = Hotel::DateRange.new("10", "10-22-2019")}.must_raise ArgumentError
    end
    
    it "will raise an Argument error if the two dates entered are the same" do
      expect{dates = Hotel::DateRange.new("10-22-2019", "10-22-2019")}.must_raise ArgumentError
    end
    
  end
  
  describe "length" do
    before do
      @dates = Hotel::DateRange.new("10-22-2019", "10-24-2019")
    end
    
    it "will give the length of date range in days as an integer" do
      expect(@dates.length).must_be_kind_of Integer
      expect(@dates.length).must_equal 2
    end
    
  end
end