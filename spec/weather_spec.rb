require 'weather'
require 'pry'

describe Weather do
  describe '#random_weather' do
    it 'can be sunny or stormy' do
      weather = Weather.new
      
      allow(weather).to receive(:random_weather).and_return('sunny', 'stormy', 'cloudy')
      expect(weather.random_weather).to eq 'sunny'
    end
  end
end
