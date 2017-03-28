require_relative 'train'

class CargoTrain < Train
  def valid_wagon?(wagon)
    wagon.is_a? CargoWagon
  end
end