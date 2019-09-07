require 'date'

module Hotel
  
  class DateRange
    
    attr_reader :check_in, :check_out
    
    def initialize(check_in, check_out)
      check_in_date = Date::strptime(check_in, "%m-%d-%Y")
      check_out_date = Date::strptime(check_out, "%m-%d-%Y")
      
      if check_in_date > check_out_date
        raise ArgumentError.new("Please choose a checkout time after #{check_in_date}")
      elsif check_in_date === check_out_date
        raise ArgumentError.new("Please enter two seperate dates")
      else
        @check_in = check_in_date
        @check_out = check_out_date
      end
      
    end
    
    def length
      return (@check_out - @check_in).to_i
    end
    
    def include?(date)
      date = Date::strptime(date, "%m-%d-%Y")
      date.between?(@check_in, (@check_out - 1)) 
    end
    
    def overlap?(check_in, check_out)
      start = Date::strptime(check_in, "%m-%d-%Y")
      end_date = Date::strptime(check_out, "%m-%d-%Y")
      res_range = (@check_in..@check_out)
      if @check_out == start
        return false
      elsif (res_range).cover?(end_date) == true || (res_range).cover?(start) == true
        return true
      else
        return false
      end
    end
    
    
  end
end