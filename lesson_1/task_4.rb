puts "Введите a"
a = gets.chomp.to_f

puts "Введите b"
b = gets.chomp.to_f

puts "Введите c"
c = gets.chomp.to_f


d = b**2 - 4 * a * c
d_2 = Math.sqrt(d)

if d > 0
  x_1 = (-b + d_2 ) / (2 * a)
  x_2 = (-b - d_2 ) / (2 * a)
  puts "x_1 = #{x_1}"
  puts "x_2 = #{x_2}"
elsif d == 0
  x = -b / ( 2 * a )
  puts "x_1 = x_2 = #{x}"
else
  puts "Корней нет"
end
