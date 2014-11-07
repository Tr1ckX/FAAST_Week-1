class Passenger

   attr_reader :credit

   def initialize
     @credit = 4
   end

   def touch_in(station)
     station.passengers << self
   end

   def touch_out(station)
     station.passengers.delete(self)

   def topup(amount)
     @credit = amount + @credit
   end

end
