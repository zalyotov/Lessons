class Station
  attr_accessor :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    @trains << train
  end

  def departure(train)
    puts "Поезд #{train.number} убыл со станции #{@name}" if @trains.delete(train)
  end

  def train_list
    puts "Список всех поездов на станции #{@name}: "
    @trains.each { |train| puts "Поезд №#{train.number}" }
  end

  def train_filter_list(type)
    puts "Список поездов типа \"#{type}\", находящиеся на станции #{@name}:"
    @trains.find_all { |train| train.type == type }
  end
end