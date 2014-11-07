require './lib/passenger'

describe Passenger do

  let(:passenger) {Passenger.new}
  let(:station) {double :station}
  let(:empty_passengers) {double :passengers=[]}
  let(:full_passengers) {double :passengers=[passenger]}


  # it 'can touch into a station' do
  #   expect(station).to receive(:empty_passengers)
  #   passenger.touch_in(station)
  #   expect(station.empty_passengers).not_to be empty
  # end

  it "should be able to topup it's credit" do
    passenger.topup(5)
    expect(passenger.credit).to eq (9)
  end

  it 'should touch out from a station' do
    expect(station).to receive(:full_passengers)
    passenger.touch_out(station)
    expect(station.full_passengers).to be empty
  end




end
