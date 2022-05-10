class Weather
  def initialize
    @weather = ['sunny', 'stormy', 'cloudy']
  end

  def random_weather
    @weather.sample
  end
end
