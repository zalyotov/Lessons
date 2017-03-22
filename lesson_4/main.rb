require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

=begin  
1 Создавать станции
2 Создавать поезда
3 Создавать маршруты и управлять станциями в нем (добавлять, удалять)
4 Назначать маршрут поезду
5 Добавлять вагоны к поезду
6 Отцеплять вагоны от поезда
7 Перемещать поезд по маршруту вперед и назад
8 Просматривать список станций и список поездов на станции    
=end



class Main
  attr_accessor :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def main_menu
    puts "Меню:
    1: Создать станцию
    2: Создать поезд
    3: Создать маршруты и управлять станциями в нем (добавлять, удалять)
    4: Назначать маршрут поезду
    5: Добавить вагон к поезду
    6: Отцепить вагон от поезда
    7: Переместить поезд по маршруту вперед и назад
    8: Посмотреть список станций и список поездов на станции
    0: Выход"

    loop do
      input = gets.chomp.to_i

      case input
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        add_route_to_train
      when 5
        add_wagon_to_train
      when 6
        remove_wagon_from_train
      when 7
        move_train
      when 8
        station_list
      when 0
        break
      else
        puts "Введите число от 0 до 8"
      end
    end
  end

  def create_station
    puts "Введите название станции"

    station_name = gets.chomp
    puts "Станция создана" if create_station_action(station_name)

    main_menu
  end

  def create_train
    puts "Введите номер поезда"
    train_number = gets.chomp.to_i

    if train_number > 0
      puts "Поезд создан" if create_train_action(train_number)  
      main_menu
    else
      puts "Введен некорректный номер поезда"
      create_train
    end
  end

  def create_route
    puts "Введите начальную станцию"
    from = gets.chomp.to_s
    puts "Введите конечную станцию"
    to = gets.chomp.to_s

    if !from.empty? && !to.empty?
      from_station = create_station_action(from)
      to_station = create_station_action(to)
      route = create_route_action(from_station, to_station)
      if route.class == Route
        puts "Создан маршрут:"
        route.show
      end
    end
    main_menu
  end

  def add_route_to_train
    if !self.trains.empty?
      puts "#{Выберите поезд}"
      self.trains.each.with_index(1) do |train, index|
        puts "#{index}: #{train.number}"
      end
      train_index = gets.chomp.to_i
    else
      puts "Сначала надо добавить поезд"
      create_train
    end

    if !self.routes.empty?
      puts "#{Выберите маршрут}"
      self.routes.each.with_index(1) do |route, index|
        puts "#{index}: #{route.show}"
      end
      route_index = gets.chomp.to_i
    else
      puts "Сначала надо добавить маршрут"
      create_route
    end
  end

  def add_wagon_to_train
  end

  def remove_wagon_from_train
  end

  def move_train
  end

  def station_list
    if !self.stations.empty?
      self.stations.each do |station|
        puts "Станция \"#{station.name}\":"
        station.train_list
      end
    else
      puts "Список станций пуст"
    end    
    
    main_menu
  end

  private

  def create_station_action(station_name)
    station = Station.new(station_name)
    self.stations << station
    station
  end

  def create_train_action(train_number)
    train = Train.new(train_number)    
    self.trains << train
    train
  end

  def create_route_action(from, to)
    route = Route.new(from, to)
    self.routes << route
    route
  end
end

app = Main.new

app.main_menu


