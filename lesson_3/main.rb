require "./route.rb"
require "./train.rb"
require "./station.rb"

first_station = Station.new("first_station")
second_station = Station.new("second_station")
last_station = Station.new("last_station")

train1 = Train.new(1, "cargo", 12)
train2 = Train.new(4, "cargo", 7)
train3 = Train.new(18, "passanger", 12)

route1 = Route.new("first_station", "last_station")
train1.add_route(route1)

first_station.arrive(train1)
first_station.arrive(train2)
train1.cur_station

first_station.train_list

first_station.train_filter_list("cargo")


train1.add_wagon
train1.add_route(route1)
train1.forward

