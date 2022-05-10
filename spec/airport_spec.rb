require 'airport'
require 'pry'

describe Airport do
  describe '#landed_planes' do
    it 'allows the airport to receive a plane' do
      plane = Plane.new
      airport = Airport.new(plane)
      expect(airport.landed_planes).to include(plane)
    end
  end
end
