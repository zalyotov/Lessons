class Train
  attr_accessor :number, :type, :wagons, :speed, :step

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def add_wagon
    if self.speed == 0
      self.wagons += 1
    else
      puts "Нельзя добавить вагон, т.к. поезд находится в движении"
    end
  end

  def remove_wagon
    if self.speed == 0
      self.wagons -= 1
    else
      puts "Нельзя удалить вагон, т.к. поезд находится в движении"
    end
  end

  def add_route(route)
    @step = 0
    @route = route
  end

  def cur_station
    puts "Поезд №#{number} находится на станции: \"#{@route.stations[@step].name}\""
  end

  def next_station
    puts "Предыдущая станция: \"#{route.stations[self.step + 1]}\""
  end

  def prev_station
    puts "Предыдущая станция: \"#{route.stations[self.step - 1]}\""
  end

  def forward
    self.step += 1
  end

  def back
    self.step -= 1
  end

  def stop
    self.speed = 0
  end

  def go(speed)
    self.speed = speed
  end

end