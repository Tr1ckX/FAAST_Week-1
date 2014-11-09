class Coach

  attr_reader :capacity
  attr_accessor :passengers

  def initialize
    @capacity = 40
    @passengers = []
  end

  def board_passenger(passenger)
    self << passenger if self.passengers.count < 40
  end

  def alight_passenger(passenger)
    self.delete(passenger)
  end



end
