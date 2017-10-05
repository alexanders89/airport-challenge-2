require './lib/airport'

describe Airport do
  subject(:airport) {described_class.new}
  let(:plane) { double :plane}

  describe 'basics' do

    it 'is initialized with an empty array of planes' do
      expect(subject.planes).to eq []
    end

    it 'landed planes show in the airport array of planes' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.planes[0]).to eq plane
    end

    it 'taken off planes are removed from array' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes.count).to eq 0
    end
  end

  describe 'landing planes' do
    it 'can land plane' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport.land(plane)).to eq plane
    end

    context 'when at capacity' do
        it 'will raise an error' do
          allow(airport).to receive(:stormy?).and_return false
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "Airport is full!"
        end
    end
  end

  describe 'taking off planes' do
    it 'can take off a plane' do
      allow(airport).to receive(:stormy?).and_return false
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
  end

  describe 'when stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end
      it 'will not allow landing' do
        expect { airport.land(plane) }.to raise_error 'Cannot land, stormy!'
      end
      it 'will not allow taking off' do
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off, stormy!'
      end

  end
end
