require './lib/plane'

describe Plane do
  subject(:plane) {described_class.new}
  let(:airport) { double :airport, planes: []}

  describe 'basics' do
    it 'is initiated flying' do
      expect(plane.flying?).to eq true
    end

    it 'cannot take off when flying' do
      expect{ plane.take_off(airport) }.to raise_error 'Cannot take off: already flying'
    end
  end

  describe 'landing' do

    it { is_expected.to respond_to(:land).with(1).argument}

    it 'responds to land' do
      expect(plane).to respond_to :land
    end

    it 'can land at an airport' do
      expect{ plane.land(airport) }.to_not raise_error
    end

    it 'is stored within the airport once landed' do
      plane.land(airport)
      expect(airport.planes[0]).to eq subject
    end
  end

  describe 'taking off' do
    it 'responds to take off' do
      expect(plane).to respond_to :take_off
    end

    it 'can take off from an airport' do
      allow(plane).to receive(:flying?).and_return false
      expect { plane.take_off(airport) }.to_not raise_error
    end
  end
end
