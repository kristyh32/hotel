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
  
  describe "include?" do
    before do
      @dates = Hotel::DateRange.new("10-22-2019", "10-24-2019")
    end
    
    it "will return true if the date entered is between the two dates" do
      expect(@dates.include?("10-23-2019")).must_equal true
    end
    
    it "will return false if the date falls on the last day of the reservation" do
      expect(@dates.include?("10-24-2019")).must_equal false
    end
    
    it "will return true if the date falls on the first day of the reservation" do
      expect(@dates.include?("10-22-2019")).must_equal true
    end
  end
  
  describe "overlap?" do
    before do
      @dates = Hotel::DateRange.new("10-19-2019", "10-30-2019")
    end
    
    it "will return true if one date range overlaps with another" do
      expect(@dates.overlap?("10-21-2019", "10-23-2019")).must_equal true
      expect(@dates.overlap?("10-21-2019", "10-31-2019")).must_equal true
    end
    
    it "will return false if a date range only overlaps with the end date of another range" do
      expect(@dates.overlap?("10-30-2019", "11-02-2019")).must_equal false
    end
    
    it "will return true for the same entered dates" do
      expect(@dates.overlap?("10-19-2019", "10-30-2019")).must_equal true
    end
    
    it "will return false if the dates don't match at all" do
      expect(@dates.overlap?("4-19-2019", "4-30-2019")).must_equal false
    end
    
  end
end