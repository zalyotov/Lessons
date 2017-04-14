require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

#
# 1 Создавать станции
# 2 Создавать поезда
# 3 Создавать маршруты и управлять станциями в нем (добавлять, удалять)
# 4 Назначать маршрут поезду
# 5 Добавлять вагоны к поезду
# 6 Отцеплять вагоны от поезда
# 7 Перемещать поезд по маршруту вперед и назад
# 8 Просматривать список станций и список поездов на станции

class Main
  attr_accessor :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def main_menu
    input = get_int(
      'Меню:
      1: Создать станцию
      2: Создать поезд
      3: Создать маршруты и управлять станциями в нем (добавлять, удалять)
      4: Назначать маршрут поезду
      5: Добавить вагон к поезду
      6: Отцепить вагон от поезда
      7: Переместить поезд по маршруту вперед и назад
      8: Посмотреть список станций и список поездов на станции
      9: Посмотреть список поездов
      10: Посмотреть список вагонов у поезда
      11: Занять место/объем в вагоне
      0: Выход'
    )

    loop do
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
        train_list(true)
      when 10
        wagon_list
      when 11
        train_menu
      when 0
        abort
      else
        puts 'Введите число от 0 до 8'
      end
    end
  end

  def create_station
    station_name = get_string('Введите название станции')
    puts 'Станция создана' if create_station_action(station_name)
    main_menu
  end

  def create_train
    type = get_int('
      1. Пассажирский
      2. Грузовой')

    create_train if type != 1 && type != 2
    train_number = get_int('Введите номер поезда')
    puts 'Поезд создан' if create_train_action(train_number, type)
    main_menu
  end

  def train_menu
    puts 'Выберите поезд'
    train_list(false)
    train_index = gets.chomp.to_i
    train = trains[train_index - 1]
    train_details train
    wagon_index = get_int('Выберите номер вагона')

    if train.wagons.count < wagon_index
      puts 'Такого вагона нет'
      main_menu
    end

    if train.class == PassengerTrain
      train.wagons[wagon_index - 1].busy_place
    else
      puts 'Введите объем, который нужно занять'
      volume = gets.chomp.to_f
      train.wagons[wagon_index - 1].take_busy_volume(volume)
    end
    main_menu
  end

  def manage_route_menu
    input = get_int('
      1. Добавить маршрут
      2. Управлять станциями в маршруте
      3. Посмотреть список маршрутов
      0. Главное меню')

    loop do
      case input
      when 1
        create_route
      when 2
        manage_route
      when 3
        puts 'Список маршрутов:'
        show_routes
        manage_route_menu
      when 0
        main_menu
      else
        puts 'Введите число от 0 до 2'
      end
    end
  end

  def create_route
    from = get_string('Введите начальную станцию')
    to = get_string('Введите конечную станцию')

    unless from.empty? && to.empty?
      from_station = create_station_action(from)
      to_station = create_station_action(to)
      route = create_route_action(from_station, to_station)
      puts 'Создан маршрут:'
      route.show
    end
    main_menu
  end

  def manage_route
    if routes.empty?
      puts 'Маршрутов нет, создаем первый маршрут'
      create_route
    else
      show_routes
      route_index = get_int('Выберите маршрут')
      input = get_int('
        1. Добавить станцию
        2. Удалить станцию
        0. Назад')

      loop do
        case input
        when 1
          station_name = get_string('Введите название станции')
          station = create_station_action(station_name)
          routes[route_index - 1].add_station(station)
          manage_route_menu
        when 2
          station_name = get_string('Введите название станции')
          station = find_station(station_name)
          puts "Удаляемая станция: #{station}"
          routes[route_index - 1].delete_station(station)
          manage_route_menu
        when 0
          manage_route_menu
        else
          puts 'Введите число от 0 до 2'
        end
      end
    end
  end

  def find_station(station_name)
    stations.select { |station| station.name == station_name }
  end

  def add_route_to_train
    if trains.empty?
      puts 'Надо добавить поезд'
    elsif routes.empty?
      puts 'Надо добавить маршрут'
    else
      train_index = select_train
      route_index = show_routes
      puts 'Маршрут добавлен' if add_route_to_train_action(train_index, route_index)
    end
    main_menu
  end

  def select_train
    show_trains
    gets.chomp.to_i
  end

  def select_route
    show_routes
    gets.chomp.to_i
  end

  def wagon_list
    if trains.empty?
      puts 'Сначала надо добавить поезд'
      create_train
    else
      show_trains
      train_index = gets.chomp.to_i
      train = trains[train_index - 1]
      train_details train
      train_menu
    end
  end

  def train_details(train)
    puts "Поезд: #{train.number}:"
    puts " -тип: #{train.class}"
    puts " -количество вагонов: #{train.wagons.count}"
    if train.class == PassengerTrain
      passenger_train_details(train)
    else
      cargo_train_details(train)
    end
  end

  def add_wagon_to_train
    if trains.empty?
      create_train
    else
      show_trains
      train_index = gets.chomp.to_i
      train = trains[train_index - 1]
      add_wagon_to_train_action(train)
    end
    train_list(false)
    main_menu
  end

  def remove_wagon_from_train
    if trains.empty?
      create_train
    else
      show_trains
      train_index = gets.chomp.to_i
      train = trains[train_index - 1]
      remove_wagon_from_train_action(train)
    end
    train_list(false)
    main_menu
  end

  def show_trains
    puts 'Выберите поезд'
    trains.each.with_index(1) do |train, index|
      puts "#{index}: #{train.number}"
    end
  end

  def show_routes
    routes.each.with_index(1) do |route, index|
      puts "#{index}:"
      route.stations.each do |station|
        puts "станция #{station.name}"
      end
    end
  end

  def move_train
    show_trains
    train_index = gets.chomp.to_i
    train = trains[train_index - 1]
    puts '
    1. Вперед
    2. Назад'
    direction = gets.chomp.to_i
    move_train_action(train, direction)
    main_menu
  end

  def station_list
    unless stations.empty?
      stations.each do |station|
        puts "Станция \"#{station.name}\":"
        station.each_train do |train|
          train_details train
        end
      end
    end
    main_menu
  end

  def train_list(show_menu)
    puts trains[0].number
    trains.each.with_index(1) do |train, index|
      puts "#{index} (#{train.class}): номер #{train.number}, вагонов #{train.count_wagons}"
    end
    main_menu if show_menu
  end

  private

  def get_string(string)
    puts string
    gets.chomp.to_s
  end

  def get_int(string)
    puts string
    gets.chomp.to_i
  end

  def cargo_train_details(train)
    train.each_wagon do
      puts "Вагон №#{index}"
      puts "Общий объем: #{wagon.free_volume + wagon.busy_volume}"
      puts "Свободный объем: #{wagon.free_volume}"
      puts "Занятый объем: #{wagon.busy_volume}"
    end
  end

  def passenger_train_details(train)
    train.each_wagon do
      puts "Вагон №#{index}"
      puts "Всего мест: #{wagon.free_places + wagon.busy_places}"
      puts "Свободных мест: #{wagon.free_places}"
      puts "Занятых мест: #{wagon.busy_places}"
    end
  end

  def add_wagon_to_train_action(train)
    if train.class == PassengerTrain
      puts 'Введите количество мест в вагоне'
      places = gets.chomp
      wagon = PassengerWagon.new(places)
    elsif train.class == CargoTrain
      puts 'Введите оъем вагона'
      volume = gets.chomp
      wagon = CargoWagon.new(volume)
    end
    puts 'Вагон добавлен' if train.add_wagon(wagon)
  end

  def remove_wagon_from_train_action(train)
    if train.count_wagons > 0
      puts 'Удален последний вагон' if train.remove_wagon(train.wagons.last)
    else
      puts 'У поезда нет вагонов, удалять нечего'
    end
  end

  def move_train_action(train, direction)
    if direction == 1
      puts 'Поезд уехал на следующую станцию' if train.forward
    elsif direction == 2
      puts 'Поезд уехал на предыдущую станцию' if train.back
    end
  end

  def add_route_to_train_action(train_index, route_index)
    train = trains[train_index - 1]
    route = routes[route_index - 1]
    train.add_route(route)
  end

  def create_station_action(station_name)
    station = Station.new(station_name)
    stations << station
    station
  end

  def create_train_action(train_number, type)
    train =
      if type == 1
        PassengerTrain.new(train_number)
      elsif type == 2
        CargoTrain.new(train_number)
      end
    trains << train
    train
  end

  def create_route_action(from, to)
    route = Route.new(from, to)
    routes << route
    route
  end
end

app = Main.new
app.main_menu
