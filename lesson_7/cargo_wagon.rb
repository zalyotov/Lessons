class CargoWagon  
  include CompanyName
  attr_reader :free_volume, :busy_volume

  def initialize(volume)
    validate! volume
    @free_volume = volume.to_i
    @busy_volume = 0
  end

  def set_busy_volume(volume)
    raise "Свободного места не хватает" if @free_volume < volume
    @free_volume -= volume
    @busy_volume += volume
  end

  private

  def validate!(volume)
    raise "Введен неверный формат объема в вагоне" unless volume.is_a? Integer
    true
  end
end