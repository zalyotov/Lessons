require_relative 'validation'

class CargoWagon
  include CompanyName
  include Validation

  attr_reader :free_volume, :busy_volume

  validate :free_volume, :presence
  validate :free_volume, :type, Float

  def initialize(volume)
    @free_volume = volume
    validate!
    @busy_volume = 0
  end

  def take_busy_volume(volume)
    raise 'Свободного места не хватает' if @free_volume < volume
    @free_volume -= volume
    @busy_volume += volume
  end
end
