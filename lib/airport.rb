require_relative './plane'
require_relative './weather'
require 'pry'
class Airport
  attr_writer :capacity

  AIRPORT_CAPACITY = 3
  def initialize(plane, weather, capacity = AIRPORT_CAPACITY)
    @planes = []
    @plane = plane
    @capacity = capacity
    @weather = weather
  end

  def land_plane
    @planes << @plane
    error_message = 'Can not land as the airport is full!'
    raise error_message if full?

    weather_update = 'Can not land as the weather is stormy!'
    raise weather_update if stormy?

    arrival_message = 'A plane has landed at the airport!'
    arrival_message
  end

  def take_off
    @planes.pop
    weather_update = 'Can not take off as the weather is stormy!'
    raise weather_update if stormy?

    departure_message = 'A plane has departed the airport!'
    departure_message
  end

  def plane_count
    @planes.count
  end

  private

  def full?
    @planes.count > @capacity
  end

  def stormy?
    @weather.random_weather == 'stormy'
  end
end
