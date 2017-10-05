class Airport

  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @default_capacity = capacity
  end

  def land(plane)
    raise "Airport is full!" if full?
    raise 'Cannot land, stormy!' if stormy?
    @planes << plane
    plane
  end

  def take_off(plane)
    raise 'Cannot take off, stormy!' if stormy?
    @planes.delete(plane)
    plane
  end

  def stormy?
    rand(0..10) > 7
  end

  # def capacity
  #   @default_capacity - @planes.count
  # end

  def full?
    @planes.count == DEFAULT_CAPACITY
  end


end
