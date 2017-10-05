require './lib/airport'

class Plane

  attr_accessor :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def land(airport)
    airport.planes << self
    @flying = false
  end

  def take_off(airport)
    raise 'Cannot take off: already flying' if flying?
    airport.planes.delete(self)
    @flying = true
  end

end
