class Route
  attr_accessor :stations

  def initialize(from, to)
    self.stations = [from, to]
  end

  def add_station(station_name)
    self.stations.insert(-2, station_name)
  end

  def delete_station(station_name)
    self.stations.delete(station_name)
  end

  def show
    puts "Маршрут: #{@stations.join(' => ')}"
  end
end