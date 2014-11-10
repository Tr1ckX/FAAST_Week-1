require './lib/station'

describe Station do

  let(:station)   { Station.new       }
  let(:station_A) { Station.new       }
  let(:station_B) { Station.new       }
  let(:coach)     { double :coach     }
  let(:passenger) { double :passenger }
  let(:card)      { double :card      }
  let(:credit)    { double :credit    }

  it 'should be empty when initialized' do
    expect(station.passengers).to eq([])
    expect(station.coaches).to eq([])
  end

  it 'should enter the passenger into the station' do
    allow(passenger).to receive(:allow_to_enter_station?).and_return(true)
    station.enter(passenger)
    expect(station.passengers).to eq([passenger])
    end

  it 'should know when a passenger is in the station' do
    station.passengers = [passenger]
    expect(station.passenger_entered?(passenger)).to be true
  end

  it 'should exit the passenger' do
    station.passengers = [passenger]
    allow(station).to receive(:deduct)
    station.exit_p(passenger)
    expect(station.passengers).to eq([])
  end

  it "should deduct 3 from the passenger's card" do
    station.passengers = [passenger]
    expect(station).to receive(:deduct).with(passenger, 3)
    station.exit_p(passenger)
  end

  it "deducts the correct amount" do
    allow(passenger).to receive(:card).and_return(card)
    allow(card).to receive(:credit).and_return(3)
    allow(card).to receive(:credit=)
    expect(station.deduct(passenger, 3)).to eq 0
  end

  it 'should put a passenger into a coach' do
    station.coaches = [coach]
    expect(coach).to receive(:accept_passenger).with(passenger)
    station.board_passenger(coach, passenger)
  end

  it 'should release the passenger when puts it into a coach' do
    station.passengers = [passenger]
    station.coaches = [coach]
    allow(coach).to receive(:accept_passenger).with(passenger)
    station.board_passenger(coach, passenger)
    expect(station.passengers).to eq([])
  end

  it 'should send the coach to the other station' do
    station_B.coaches = []
    station_A.coaches = [coach]
    station_A.send_coach(coach, station_B)
    expect(station_B.coaches).to eq([coach])
  end

  it 'should release the coach when sends it to the other station' do
    station_A.coaches = [coach]
    station_A.send_coach(coach, station_B)
    expect(station_A.coaches).to eq([])
  end

  it 'should let release the passenger from the coach' do
    station.coaches = [coach]
    expect(coach).to receive(:alight_passenger)
    station.alight_passenger(coach, passenger)
  end

  it 'should put the passenger into the station' do
    station.passengers = []
    station.coaches = [coach]
    allow(coach).to receive(:alight_passenger)
    station.alight_passenger(coach, passenger)
    expect(station.passengers).to eq([passenger])
  end

  it 'should deploy a coach to the station' do
    station.coaches = []
    station.deploy(coach)
    station.coaches = [coach]
  end

end
