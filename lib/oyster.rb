class Card

  DEFAULT_CREDIT = 0

  attr_accessor :credit

  def initialize(options = {})
    self.credit = options.fetch(:credit, credit)
  end

  def credit
    @credit ||= DEFAULT_CREDIT
  end

  def topup(value)
    @credit = @credit + value
  end

end
