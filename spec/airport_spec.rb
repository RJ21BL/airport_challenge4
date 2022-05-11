require 'airport'
require 'pry'

describe Airport do
  describe '#land_plane' do
    it 'allows the airport to receive a plane' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new(plane, weather)

      allow(weather).to receive(:random_weather).and_return('sunny')
      expect { airport.land_plane }.to change { airport.plane_count }.by(1)
    end

    xit 'prevents landing when the airport is full' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new(plane, weather)
      error_message = 'Can not land as the airport is full!'
      
      allow(weather).to receive(:random_weather).and_return('sunny')

      4.times{ airport.land_plane }

      expect { airport.land_plane }.to raise_error error_message
    end

    xit 'prevents landing when the weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new(plane, weather)
      weather_update = 'Can not land as the weather is stormy!'
      
      allow(weather).to receive(:random_weather).and_return('stormy')

      airport.land_plane

      expect { airport.land_plane }.to raise_error weather_update
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off and confirm departure' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new(plane, weather)
      
      allow(weather).to receive(:random_weather).and_return('sunny')
      
      airport.land_plane

      expect { airport.take_off }.to change { airport.plane_count }.by(-1)
    end

    xit 'does not allow the plane to take off if the weather is stormy' do
      plane = Plane.new
      weather = Weather.new
      airport = Airport.new(plane, weather)
      weather_update = 'Can not take off as the weather is stormy!'

      allow(weather).to receive(:random_weather).and_return('stormy')

      airport.take_off

      expect { airport.take_off }.to raise_error weather_update
    end
  end
end
