require 'plane'

describe Plane do
  describe '#land' do
    it 'can land' do
      plane = Plane.new
      expect(plane.plane).to eq true
    end
  end
end
