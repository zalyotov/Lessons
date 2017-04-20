require_relative 'train'
require_relative 'validation'

class CargoTrain < Train
  include Validation
  
  validate :number, :presence
  validate :number, :type, String
  validate :number, :format, NUMBER_FORMAT
  
  def valid_wagon?(wagon)
    wagon.class == CargoWagon
  end
end
