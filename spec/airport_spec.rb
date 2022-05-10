require 'airport'
require 'pry'

describe Airport do
  describe '#land_plane' do
    it 'allows the airport to receive a plane' do
      plane = Plane.new
      airport = Airport.new(plane)
      expect { airport.land_plane }.to change { airport.plane_count }.by(1)
    end

    xit 'prevents landing when the airport is full' do
      plane = Plane.new
      airport = Airport.new(plane)
      4.times{ airport.land_plane }
      error_message = 'Can not land as the airport is full!'
      expect { airport.land_plane }.to raise_error error_message
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off and confirm departure' do
      plane = Plane.new
      airport = Airport.new(plane)
      airport.land_plane
      expect { airport.take_off }.to change { airport.plane_count }.by(-1)
    end
  end
end
