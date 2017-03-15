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
      puts "Поезду №#{self.number} добавлен вагон"
    else
      puts "Нельзя добавить вагон поезду №#{number}, т.к. он находится в движении"
    end
  end

  def remove_wagon
    if self.speed == 0
      self.wagons -= 1
      puts "У поезда №#{self.number} убран вагон"
    else
      puts "Нельзя удалить вагон у поезда №#{number}, т.к. он находится в движении"
    end
  end

  def add_route(route)
    @step = 0
    @route = route
  end

  def cur_station
    puts "floor: #{self.step.floor} | ceil: #{self.step.ceil}"
    if self.step.floor != self.step.ceil
      puts "Поезд №#{number} находится в пути между станциями \"#{@route.stations[self.step.floor].name}\" и \"#{@route.stations[self.step.ceil].name}\""
    else
      puts "Поезд №#{number} находится на станции: \"#{@route.stations[self.step].name}\""
    end
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