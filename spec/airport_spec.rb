require 'airport'
require 'pry'

describe Airport do
  describe '#land_plane' do
    it 'allows the airport to receive a plane' do
      plane = Plane.new
      airport = Airport.new(plane)
      expect(airport.land_plane).to include(plane)
    end
  end
end
