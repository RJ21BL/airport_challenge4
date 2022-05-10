require_relative './plane'
class Airport
  def initialize(plane)
    @planes = []
    @plane = plane
  end
  
  def landed_planes
    @planes << @plane
  end
end
