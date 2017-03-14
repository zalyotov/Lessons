class Route
  attr_accessor :stations

  def initialize(from, to)
    @stations = [from, to]
  end

  def add_station(station_name)
    @stations.insert(-2, station_name)
  end

  def delete_station(station_name)
    @stations.delete(station_name)
  end

  def show
    puts "Маршрут: #{@stations.join(' => ')}"
  end
end