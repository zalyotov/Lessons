class Route
  attr_accessor :stations

  def initialize(from, to)
    self.stations = [from, to]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def show
    stations.each do |station|
      puts station.name
    end
  end
end