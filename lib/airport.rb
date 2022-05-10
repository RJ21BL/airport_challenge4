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
    fail error_message if full?
    weather_update = 'Can not land as weather is stormy!'
    fail weather_update if stormy?
    puts 'A plane has landed at the airport!'
  end

  def take_off
    puts 'A plane has departed the airport!'
    @planes.pop
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
