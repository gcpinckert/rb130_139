class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  # assert_equal for two Cars fails without this method
  def ==(other)
    other.is_a?(Car) && name == other.name
  end
end