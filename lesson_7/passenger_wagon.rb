class PassengerWagon
  include CompanyName
  attr_reader :free_places, :busy_places

  def initialize(places)
    validate! places
    @free_places = places.to_i
    @busy_places = 0
  end

  def busy_place
    raise "Свободных мест больше нет" if @free_places == 0
    @free_places -= 1
    @busy_places += 1
  end

  private

  def validate!(places)
    raise "Введен неверный формат количества мест в вагоне" unless places.is_a? Integer
    true
  end
end