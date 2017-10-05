require './lib/airport'

describe Airport do
  let(:plane) { double :plane}

  context 'basics' do

    it 'is initialized with an empty array of planes' do
      expect(subject.planes).to eq []
    end

    it 'landed planes show in the airport array of planes' do
      subject.land(plane)
      expect(subject.planes[0]).to eq plane
    end

    it 'taken off planes are removed from array' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes.count).to eq 0
    end
  end

  context 'landing planes' do
    it 'can land plane' do
      expect(subject.land(plane)).to eq plane
    end

    it 'will not allow landing when at capacity' do
      20.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error "Airport is full!"
    end

    it 'will not allow landing when the weather is stormy' do

    end
  end

  context 'taking off planes' do
    it 'can take off a plane' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

end
