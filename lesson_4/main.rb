require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'

train1 = PassengerTrain.new(1)
train2 = CargoTrain.new(2)

wagon1 = Wagon.new("passenger")
wagon2 = Wagon.new("passenger")
wagon3 = Wagon.new("passenger")
wagon4 = Wagon.new("cargo")

if train1.add_wagon(wagon1)
  puts "Поезду №#{train1.number} добавлен #{wagon1.type} вагон, теперь у него #{train1.count_wagons} вагона(ов)"
end

if train1.add_wagon(wagon2)
  puts "Поезду №#{train1.number} добавлен #{wagon2.type} вагон, теперь у него #{train1.count_wagons} вагона(ов)"
end

if train1.add_wagon(wagon3)
  puts "Поезду №#{train1.number} добавлен #{wagon3.type} вагон, теперь у него #{train1.count_wagons} вагона(ов)"
end

if train1.add_wagon(wagon4)
  puts "Поезду №#{train1.number} добавлен #{wagon4.type} вагон, теперь у него #{train1.count_wagons} вагона(ов)"
else
  puts "Поезду №#{train1.number} не добавлен #{wagon4.type} вагон"
end

if train1.remove_wagon(wagon2)
  puts "У поезда №#{train1.number} был удален #{wagon2.type} вагон, теперь у него #{train1.count_wagons} вагона(ов)"
end