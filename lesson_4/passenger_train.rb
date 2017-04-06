require_relative 'train'

class PassengerTrain < Train
  def valid_wagon?(wagon)
    wagon.is_a? PassengerWagon
  end
end