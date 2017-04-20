require_relative 'validation'

class PassengerWagon
  include CompanyName
  include Validation

  attr_reader :free_places, :busy_places

  validate :free_places, :presence
  validate :free_places, :type, Integer

  def initialize(places)
    @free_places =
      if places > 0
        places
      else
        nil
      end
    @busy_places = 0
    validate!
  end

  def busy_place
    raise 'Свободных мест больше нет' if @free_places.zero?
    @free_places -= 1
    @busy_places += 1
  end
end
