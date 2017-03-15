require "./route.rb"
require "./train.rb"
require "./station.rb"

first_station = Station.new("first_station")
second_station = Station.new("second_station")
last_station = Station.new("last_station")

first_station.train_filter_list

train1 = Train.new(1, "cargo", 12)
train2 = Train.new(2, "cargo", 7)
train3 = Train.new(3, "passanger", 12)

route1 = Route.new(first_station, last_station)
route2 = Route.new(first_station, last_station)
route3 = Route.new(first_station, last_station)

train1.add_route(route1)
train2.add_route(route2)
train3.add_route(route3)

first_station.arrive(train1)
first_station.arrive(train2)
first_station.arrive(train3)

first_station.train_filter_list

puts "Скорость поезда №3 - #{train3.speed}"
first_station.departure(train3)
puts "Скорость поезда №3 - #{train3.speed}"

train1.cur_station

first_station.train_list

first_station.train_filter_list


train1.add_wagon
train1.add_route(route1)
train1.forward

