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
    9: Посмотреть список поездов
    0: Выход"

    loop do
      input = gets.chomp.to_i

      case input
      when 1
        create_station
      when 2
        create_train
      when 3
        manage_route_menu
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
      when 9
        train_list
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
    puts "
    1. Пассажирский
    2. Грузовой"
    type = gets.chomp.to_i

    create_train if type != 1 && type != 2

    puts "Введите номер поезда"
    train_number = gets.chomp

    puts "Поезд создан" if create_train_action(train_number, type)  
    main_menu    
  rescue
    puts "Введен некорректный номер поезда"
    create_train
  end

  def manage_route_menu
    puts "
    1. Добавить маршрут
    2. Управлять станциями в маршруте
    3. Посмотреть список маршрутов
    0. Главное меню"

    loop do
      input = gets.chomp.to_i

      case input
      when 1
        create_route
      when 2
        manage_route
      when 3
        puts "Список маршрутов:"
        show_routes
        manage_route_menu
      when 0
        main_menu
      else
        puts "Введите число от 0 до 2"
      end
    end
  end

  def create_route
    puts "Введите начальную станцию"
    from = gets.chomp.to_s
    puts "Введите конечную станцию"
    to = gets.chomp.to_s

    unless from.empty? && to.empty?
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

  def manage_route
    unless self.routes.empty?
      puts "Выберите маршрут"
      show_routes
      route_index = gets.chomp.to_i
      puts "
      1. Добавить станцию
      2. Удалить станцию
      0. Назад
      "

      loop do
        input = gets.chomp.to_i

        case input
        when 1
          puts "Введите название станции"
          station_name = gets.chomp.to_s
          station = create_station_action(station_name)
          self.routes[route_index-1].add_station(station)
          manage_route_menu
        when 2
          puts "Введите название станции"
          station_name = gets.chomp.to_s
          station = find_station(station_name)

          puts "Удаляемая станция: #{station}"
          self.routes[route_index-1].delete_station(station)
          manage_route_menu
        when 0
          manage_route_menu
        else
          puts "Введите число от 0 до 2"
        end
      end
    else
      puts "Маршрутов нет, создаем первый маршрут"
      create_route
    end
  end

  def find_station(station_name)
    self.stations.select{|station| station.name == station_name}
  end

  def add_route_to_train
    unless self.trains.empty?
      show_trains
      train_index = gets.chomp.to_i
    else
      puts "Сначала надо добавить поезд"
      create_train
    end

    unless self.routes.empty?
      puts "Выберите маршрут"
      show_routes
      route_index = gets.chomp.to_i
    else
      puts "Сначала надо добавить маршрут"
      create_route
    end
    
      puts "Маршрут добавлен" if add_route_to_train_action(train_index, route_index)
      main_menu
  end

  def add_wagon_to_train
    unless self.trains.empty?
      show_trains
      train_index = gets.chomp.to_i
      train = self.trains[train_index-1]

      if train.class == PassengerTrain
        wagon = PassengerWagon.new
      elsif train.class == CargoTrain
        wagon = CargoWagon.new
      end
      puts "Вагон добавлен" if train.add_wagon(wagon)
    else
      puts "Сначала надо добавить поезд"
      create_train
    end
    train_list
    main_menu
  end

  def remove_wagon_from_train
    unless self.trains.empty?
      show_trains
      train_index = gets.chomp.to_i
      train = self.trains[train_index-1]
      if train.count_wagons > 0
        puts "Удален последний вагон" if train.remove_wagon(train.wagons.last)
      else
        puts "У поезда нет вагонов, удалять нечего"
      end
    else
      puts "Сначала надо добавить поезд и вагоны"
      create_train
    end
    train_list
    main_menu
  end

  def show_trains
    puts "Выберите поезд"
    self.trains.each.with_index(1) do |train, index|
      puts "#{index}: #{train.number}"
    end
  end

  def show_routes
    self.routes.each.with_index(1) do |route, index|
      puts "#{index}:"
      route.stations.each do |station|
        puts "станция #{station.name}"
      end
    end
  end

  def move_train
    show_trains
    train_index = gets.chomp.to_i
    train = self.trains[train_index-1]
    puts "
    1. Вперед
    2. Назад"
    direction = gets.chomp.to_i

    if direction == 1
      puts "Поезд уехал на следующую станцию" if train.forward
    elsif direction == 2
      puts "Поезд уехал на предыдущую станцию" if train.back
    end
    main_menu
  end

  def station_list
    unless self.stations.empty?
      self.stations.each do |station|
        puts "Станция \"#{station.name}\":"
        station.train_list
      end
    else
      puts "Список станций пуст"
    end    
    
    main_menu
  end

  def train_list
    self.trains.each.with_index(1) do |train, index|
      puts "#{index} (#{train.class}): номер #{train.number}, вагонов #{train.count_wagons}"
    end
    main_menu
  end

  private

  def add_route_to_train_action(train_index, route_index)
    train = self.trains[train_index-1]
    route = self.routes[route_index-1]
    train.add_route(route)
  end

  def create_station_action(station_name)
    station = Station.new(station_name)
    self.stations << station
    station
  end

  def create_train_action(train_number, type)
    if type == 1
      train = PassengerTrain.new(train_number)
    elsif type == 2
      train = CargoTrain.new(train_number)
    end
              
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


