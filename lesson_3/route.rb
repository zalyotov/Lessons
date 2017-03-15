class Route
  attr_accessor :stations

  def initialize(from, to)
    self.stations = [from, to]
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def delete_station(station)
    self.stations.delete(station)
  end

  def show
    self.stations.each { |station|
      puts station.name
    }
  end
end