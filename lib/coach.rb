class Coach

  attr_reader :capacity
  attr_accessor :passengers

  def initialize
    @capacity = 40
    @passengers = []
  end

  def accept_passenger(passenger)
    raise "Coach is full!" if full?
    self.passengers << passenger if self.full? == false && accepted_passenger?(passenger) == false
  end

  def full?
    self.passengers.count == @capacity
  end

  def accepted_passenger?(passenger)
    self.passengers.include?(passenger)
  end

  def alight_passenger(passenger)
    self.passengers.delete(passenger)
  end




end
