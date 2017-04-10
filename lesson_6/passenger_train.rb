require_relative 'train'

class PassengerTrain < Train
  def valid_wagon?(wagon)
    wagon.class == PassengerWagon
  end
end