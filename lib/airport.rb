class Airport

  attr_accessor :planes, :capacity

  def initialize(capacity)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full!" if full?
    raise 'Cannot land, stormy!' if stormy?
    raise 'This plane is already landed' if plane.flying? == false
    @planes << plane
    plane
  end

  def take_off(plane)
    raise 'Cannot take off, stormy!' if stormy?
    @planes.delete(plane)
    plane
  end

  def stormy?
    rand(0..10) > 8
  end

  def change_capacity(new_capacity)
    @capacity = new_capacity
  end

  # def capacity
  #   @default_capacity - @planes.count
  # end

  def full?
    @planes.count == @capacity
  end


end
