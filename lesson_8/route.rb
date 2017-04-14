
class Route
  attr_accessor :stations

  def initialize(from, to)
    self.stations = [from, to]
    validate!
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def show
    stations.each do |station|
      puts station.name.to_s
    end
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  private

  def validate!
    unless stations.first.is_a?(Station) || stations.last.is_a?(Station)
      raise 'Станция не является объектом'
    end
    true
  end
end
