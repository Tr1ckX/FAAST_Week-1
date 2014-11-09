require './lib/oyster'

describe Card do

    let(:card) {Card.new credit:10}

    it 'should allow to set the default credit' do
      expect(card.credit). to eq(10)
    end

    it 'should increase the credit by 10' do
      card.topup(10)
      expect(card.credit).to eq(20)
    end

end
