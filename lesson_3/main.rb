require "./route.rb"
require "./train.rb"
require "./station.rb"

station1 = Station.new("Москва")
station2 = Station.new("Липецк")
station3 = Station.new("Тамбов")
station4 = Station.new("Волгоград")

station1.train_filter_list

train1 = Train.new(1, "cargo", 12)
train2 = Train.new(2, "cargo", 7)
train3 = Train.new(3, "passanger", 12)

route1 = Route.new(station1, station4)
route2 = Route.new(station1, station2)
route3 = Route.new(station1, station3)

train1.add_route(route1)
train2.add_route(route2)
train3.add_route(route3)

puts "Маршрут поезда №1:"
puts route1.show
puts "Маршрут поезда №2:"
puts route2.show
puts "Маршрут поезда №3:"
puts route3.show
puts "\n";

station1.arrive(train1)
station1.arrive(train2)
station1.arrive(train3)

puts "\n"
station1.train_filter_list
puts "\n"

puts "Скорость поезда №3 - #{train3.speed}"
station1.departure(train3)
puts "Скорость поезда №3 - #{train3.speed}\n\n"

puts "Маршрут №1:"
route1.show
puts "\nВ маршрут №1 добавлена станция #{station2.name}" if route1.add_station(station2)
puts "Маршрут №1:"
route1.show
puts "\n"

train1.cur_station
train3.cur_station



puts "\n"
puts "У поезда №#{train3.number} #{train3.wagons} вагонов"
train3.add_wagon
train3.remove_wagon
station4.arrive(train3)
train3.add_wagon
puts "У поезда №#{train3.number} #{train3.wagons} вагонов"
puts "\n"

station1.train_list
station2.train_list
station3.train_list
station4.train_list

puts "\n"
station1.train_filter_list
station4.train_filter_list

train1.add_route(route1)
train1.forward

