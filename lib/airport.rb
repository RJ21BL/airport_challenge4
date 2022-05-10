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
end