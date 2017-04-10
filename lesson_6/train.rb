require_relative 'instance_counter'
require_relative 'company_name'

class Train
  include InstanceCounter
  include CompanyName
  attr_accessor :number, :type, :speed, :wagons
  attr_writer :current_station_id
  @@trains = {}
  NUMBER_FORMAT = /^[а-я\d]{3}-?[а-я\d]{2}$/i

  class << self
    def find(number)
      @@trains[number]
    end
  end

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @@trains[number] = self
    register_instance
    validate!
  end

  def add_route(route)
    @current_station_id = 0
    @route = route
  end

  def current_station
      @route.stations[@current_station_id]
  end

  def next_station
    route.stations[@current_station_id + 1]
  end

  def prev_station
    route.stations[@current_station_id - 1]
  end

  def forward
    @current_station_id += 1
  end

  def back
    @current_station_id -= 1 if @current_station_id > 0
  end

  def stop
    speed = 0
  end

  def go(speed)
    speed = speed
  end

  def count_wagons
    wagons.count
  end 

  def add_wagon(wagon)
    wagons << wagon if valid_wagon?(wagon)    
  end

  def remove_wagon(wagon)
    wagons.delete(wagon) if speed == 0 && wagons.count > 0
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  private

  def validate!
    raise "Неверный формат номера поезда" if number !~ NUMBER_FORMAT
    true
  end  

end