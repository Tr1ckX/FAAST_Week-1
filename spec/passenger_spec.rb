require './lib/passenger'

describe Passenger do

  let(:passenger) { Passenger.new }
  let(:card)      { double :card  }

  before do
    allow(Card).to receive(:new).and_return(card)
  end

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
    passenger.topup_card(23)
  end

  it 'allowed to get into the station if he has not less than 2 credit' do
    passenger.buy_card
    allow(card).to receive(:credit).and_return 3
    expect(passenger.allow_to_enter_station?).to be true
  end

end
