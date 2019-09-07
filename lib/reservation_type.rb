require 'securerandom'

module Hotel
  
  class ReservationType
    
    attr_reader :id, :date_range
    
    def initialize(id = SecureRandom.hex(8), date_range)
      @id = id
      @date_range = date_range
      
    end
    
    def cost
      raise NotImplementedError
    end
    
  end
end