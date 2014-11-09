require './lib/passenger'

describe Passenger do

  let(:passenger) {Passenger.new}
  let(:card) {double :card}

  it 'should not to have a card when initialized' do
    expect(@card).to be(nil)
  end

  it 'can buy a card' do
    passenger.buy_card
    expect(passenger.has_card?).to be true
  end

  it 'cannot buy card if he/she already has one' do
    passenger.buy_card
    expect(lambda {passenger.buy_card}).to raise_error(RuntimeError)
  end

  it 'can top up the card' do
    passenger.buy_card
    expect(card).to receive(:topup)
    passenger.topup_card(20)
  end

end
