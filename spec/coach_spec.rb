require './lib/coach'

describe Coach do

  let(:coach)     { Coach.new         }
  let(:passenger) { double :passenger }

  it 'should be initialized with cappacity 40' do
    expect(coach.capacity).to eq(40)
  end

  it 'should accept passengers' do
    coach.accept_passenger(passenger)
    expect(coach.passengers).to eq([passenger])
  end

  it "should know when it is full" do
    coach.capacity.times {coach.accept_passenger(double :passenger)}
    expect(coach.full?).to be true
  end

  it "shouldn't accept passenger when it is full" do
    coach.capacity.times {coach.accept_passenger(double :passenger)}
    expect(lambda{coach.accept_passenger(passenger)}).to raise_error(RuntimeError)
  end

  it 'should release the passenger' do
    coach.passengers=[passenger]
    coach.alight_passenger(passenger)
    expect(coach.passengers).to eq([])
  end





end
