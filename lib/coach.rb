class Coach

  attr_reader :capacity
  attr_accessor :passengers

  def initialize
    @capacity = 40
    @passengers = []
  end

  def board_passenger(passenger)
    raise "Coach is full!" if self.passengers.count == @capacity
    self.passengers << passenger if self.passengers.count < @capacity && self.passengers.include?(passenger) == false
  end

  def alight_passenger(passenger)
    self.passengers.delete(passenger)
  end



end
