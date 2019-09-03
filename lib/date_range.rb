require 'date'

module Hotel
  
  
  class DateRange
    
    attr_reader :start_date, :end_date
    
    def initialize(start_date, end_date)
      @start_date = Date::strptime(start_date, "%m-%d-%Y")
      @end_date = Date::strptime(end_date, "%m-%d-%Y")
    end
    
    def length
      return @end_date - @start_date
    end
    
    def include?(date)
      date = Date::strptime(date, "%m-%d-%Y")
      date.between?(@start_date, @end_date) 
    end
    
    
  end
end