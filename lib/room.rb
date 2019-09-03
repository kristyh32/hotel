
module Hotel
  
  
  class Room
    
    attr_reader :number
    attr_accessor :cost
    
    def initialize(number, cost = 200)
      @number = number
      @cost = cost
    end
    
    def self.load_all
      rooms = []
      (1..20).each do |num|
        rooms << Hotel::Room.new(num)
      end
      return rooms
      
    end
  end
end