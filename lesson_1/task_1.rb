puts "Введите Ваше имя"
name = gets.chomp.to_s
puts "Введите Ваш рост"
increase = gets.chomp.to_f

res = increase - 110

if res >= 0
  puts "#{name}, Ваш идеальный вес - #{res} кг"
else
  puts "#{name}, Ваш вес уже оптимальный"
end


