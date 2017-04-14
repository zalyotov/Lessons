class CargoWagon
  include CompanyName
  attr_reader :free_volume, :busy_volume

  def initialize(volume)
    validate! volume.to_f
    @free_volume = volume
    @busy_volume = 0
  end

  def take_busy_volume(volume)
    raise 'Свободного места не хватает' if @free_volume < volume
    @free_volume -= volume
    @busy_volume += volume
  end

  private

  def validate!(volume)
    raise 'Введен неверный формат объема в вагоне' unless volume.is_a? Float
  end
end
