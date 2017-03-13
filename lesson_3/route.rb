class Route
  attr_writer :route

  def initialize(from, to)
    @route = [from, to]
  end

  def add_station(station_name)
    @route.insert(-2, station_name)
  end

  def delete_station(station_name)
    @route.delete(station_name)
  end

  def show
    puts "Маршрут: #{@route.join(' => ')}"
  end
end