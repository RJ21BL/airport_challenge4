require 'airport'
require 'pry'

describe Airport do
  let(:weather) { Weather.new }
  let(:airport) { Airport.new(Plane.new, weather) }

  describe '#land_plane' do
    it 'allows the airport to receive a plane' do
      allow(weather).to receive(:random_weather).and_return('sunny')
      expect { airport.land_plane }.to change { airport.plane_count }.by(1)
    end

    it 'prevents landing when the airport is full' do
      error_message = 'Can not land as the airport is full!'
      allow(weather).to receive(:random_weather).and_return('sunny')
      4.times { airport.land_plane }
      expect { airport.land_plane }.to raise_error error_message
    end

    it 'prevents landing when the weather is stormy' do
      weather_update = 'Can not land as the weather is stormy!'
      allow(weather).to receive(:random_weather).and_return('stormy')
      airport.land_plane
      expect { airport.land_plane }.to raise_error weather_update
    end
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      allow(weather).to receive(:random_weather).and_return('sunny')
      airport.land_plane
      expect { airport.take_off }.to change { airport.plane_count }.by(-1)
    end

    it 'confirms departure once plane has taken off' do
      allow(weather).to receive(:random_weather).and_return('sunny')
      departure_message = 'A plane has departed the airport!'
      expect(airport.take_off).to eq departure_message
    end

    it 'does not allow the plane to take off if the weather is stormy' do
      allow(weather).to receive(:random_weather).and_return('stormy')
      airport.take_off
      weather_update = 'Can not take off as the weather is stormy!'
      expect { airport.take_off }.to raise_error weather_update
    end
  end
end
