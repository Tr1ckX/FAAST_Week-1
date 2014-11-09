require_relative 'oyster'


class Passenger

  attr_reader :card

  def initialize
    @card = nil
  end

  def buy_card
    raise "You already have a card!" if has_card?
    @card = Card.new
  end

  def has_card?
    @card.instance_of? Card
  end

  def topup_card(amount)
    raise "You don't have a card!" if has_card? == false
    @card.topup(amount)
  end

  def allow_to_enter_station?
    @card.credit >= 2
  end

end
