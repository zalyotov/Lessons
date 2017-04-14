require_relative 'train'

class CargoTrain < Train
  def valid_wagon?(wagon)
    wagon.class == CargoWagon
  end
end
