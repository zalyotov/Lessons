class Train
  attr_accessor :number, :type, :wagons, :speed

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def add_wagon
    @wagons += 1 if @speed == 0
  end

  def remove_wagon
    @wagons -= 1 if @speed == 0
  end

  def add_route(route)
    @step = 0
    @route = route
  end

  def cur_station
    puts "Поезд №#{number} находится на станции: \"#{@route.stations[@step]}\""
  end

  def next_station
    puts "Предыдущая станция: \"#{route.stations[@step + 1]}\""
  end

  def prev_station
    puts "Предыдущая станция: \"#{route.stations[@step - 1]}\""
  end

  def forward
    @step += 1
  end

  def back
    @step -= 1
  end
end