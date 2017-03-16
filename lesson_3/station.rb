class Station
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    puts "Поезд №#{train.number} (#{train.type}) прибыл на станцию #{self.name}" if self.trains << train
    train.stop
    train.step += 0.3
  end

  def departure(train)
    puts "Поезд №#{train.number} (#{train.type}) убыл со станции #{@name}" if self.trains.delete(train)
    train.go(50)
    train.step += 0.7
  end

  def train_list
    if self.trains.count > 0
      puts "Список всех поездов на станции #{@name}: "
      self.trains.each { |train| puts "Поезд №#{train.number}" }
    else
      puts "На станции #{@name} поездов нет"
    end
  end

  def train_filter_list
    result = {cargo: 0, passanger: 0}
    self.trains.each do |train| 
      if train.type == "cargo"
        result[:cargo] += 1
      else
        result[:passanger] += 1
      end
    end
    puts "Список поездов, находящиеся на станции #{@name} по типу: пассажирских - #{result[:passanger]}, грузовых - #{result[:cargo]}"
  end
end