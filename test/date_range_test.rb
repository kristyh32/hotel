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
      expect(@dates.start_date).must_be_kind_of Date
      expect(@dates.end_date).must_be_kind_of Date
    end
    
  end
  
  describe "length" do
    before do
      @dates = Hotel::DateRange.new("10-22-2019", "10-24-2019")
    end
    
    it "will give the length of date range in days as an integer" do
      
    end
    
  end
end