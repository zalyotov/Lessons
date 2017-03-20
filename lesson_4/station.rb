class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    puts "Поезд №#{train.number} (#{train.type}) прибыл на станцию #{self.name}" if self.trains << train
    train.stop
  end

  def departure(train)
    puts "Поезд №#{train.number} (#{train.type}) убыл со станции #{@name}" if self.trains.delete(train)
    train.go(50)
  end

  # в задании надо "возвращать список поездов на станции 
  # по типу (см. ниже): кол-во грузовых, пассажирских", 
  # тоесть вернуть все поезда, отсортированные по типу
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