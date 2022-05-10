require_relative './plane'
class Airport
  def initialize(plane)
    @planes = []
    @plane = plane
  end
  
  def land_plane
    puts 'A plane has landed at the airport!'
    @planes << @plane
  end

  def take_off
    puts 'A plane has departed the airport!'
    @planes.pop
  end

  def plane_count
    @planes.count
  end
end
