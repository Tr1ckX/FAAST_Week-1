require_relative 'coach'


class Station

  attr_accessor :passengers
  attr_accessor :coaches

  def initialize
    @passengers = []
    @coaches = []
  end

  def passenger_entered
    self.passengers.include?(passenger)
  end

  def enter(passenger)
    raise "Not enough money!" if passenger.allow_to_enter_station? == false
    self.passengers << passenger if passenger.allow_to_enter_station? &&  passenger_entered == false
  end

  def exit(passenger)
    passenger.card.credit -= 3
    self.passengers.delete(passenger)
  end

  def board_passenger(coach, passenger)
    coach.accept_passenger(passenger) if self.coaches.include?(coach)
    self.passengers.delete(passenger)
  end

  def send_coach(coach, station)
    station.coaches << coach if self.coaches.include?(coach)
    self.coaches.delete(coach)
  end

  def alight_passenger(coach, passenger)
    self.passengers << passenger if self.coaches.include?(coach)
    coach.alight_passenger(passenger)
  end

  def deploy(coach)
    self.coaches << coach if self.coaches.include?(coach) == false
  end


end
