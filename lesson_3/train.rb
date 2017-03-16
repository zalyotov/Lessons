class Train
  attr_accessor :number, :type, :wagons, :speed
  attr_writer :current_station_id

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def add_wagon
    if self.speed == 0
      self.wagons += 1
      puts "Поезду №#{self.number} добавлен вагон"
    else
      puts "Нельзя добавить вагон поезду №#{number}, т.к. он находится в движении"
    end
  end

  def remove_wagon
    if self.speed == 0
      if self.wagons > 0
        self.wagons -= 1
      else
        return false
      end
      puts "У поезда №#{self.number} убран вагон"
    else
      puts "Нельзя удалить вагон у поезда №#{number}, т.к. он находится в движении"
    end
  end

  def add_route(route)
    @current_station_id = 0
    @route = route
  end

  def cur_station
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
    @current_station_id -= 1
  end

  def stop
    self.speed = 0
  end

  def go(speed)
    self.speed = speed
  end

end