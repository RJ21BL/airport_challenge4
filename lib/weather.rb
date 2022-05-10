class Weather
  def initialize
    @sunny = ['sunny', 'stormy', 'cloudy']
  end

  def random_weather
    @sunny.sample
  end
end
