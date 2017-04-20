require_relative 'station'
require_relative 'validation'
require_relative 'accessors'

class Route
  include Validation
  extend Accessors

  attr_accessor :stations
  strong_attr_accessor :first_station, Station
  strong_attr_accessor :last_station, Station

  validate :first_station, :type, Station
  validate :last_station, :type, Station

  def initialize(from, to)
    self.stations = [from, to]
    @first_station = from
    @last_station = to
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
end
