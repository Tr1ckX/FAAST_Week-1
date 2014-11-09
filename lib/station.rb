class Station

  attr_accessor :passengers

  def initialize
    @passengers = []
  end

  def enter(passenger)
    raise "Not enough money!" if passenger.allow_to_enter_station? == false
    self.passengers << passenger if passenger.allow_to_enter_station?
  end

  def exit(passenger)
    passenger.card.credit -= 3
    self.passengers.delete(passenger)
  end

  

end
