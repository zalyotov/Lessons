basket = {}
full_price = 0

loop do
  puts 'Введите название товара'
  name = gets.chomp

  break if name == 'stop' || name == 'стоп'

  puts 'Введите цену за единицу товара'
  price = gets.chomp.to_f

  puts 'Введите количество купленного товара'
  quantity = gets.chomp.to_f

  basket[name] = {quantity: quantity, price: price, sum: quantity*price}
  full_price += quantity * price
end

basket.keys.each do |product|
  puts "Куплено #{product} на сумму #{basket[product][:sum]}"
end

puts "Итоговая сумма всех покупок в корзине равна #{full_price}"