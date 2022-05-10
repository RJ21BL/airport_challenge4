require_relative './plane'
require 'pry'
class Airport
  attr_writer :capacity
  AIRPORT_CAPACITY = 3
  def initialize(plane, capacity = AIRPORT_CAPACITY)
    @planes = []
    @plane = plane
    @capacity = capacity
  end

  def land_plane
    @planes << @plane
    puts 'A plane has landed at the airport!'
    error_message = 'Can not land as the airport is full!'
    fail error_message if full?
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
end
