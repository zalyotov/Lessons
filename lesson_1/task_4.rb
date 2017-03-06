puts "Введите a"
a = gets.chomp.to_i

puts "Введите b"
b = gets.chomp.to_i

puts "Введите c"
c = gets.chomp.to_i


d = b**2 - 4 * a * c

if d > 0
	x_1 = (-b + Math.sqrt(d) ) / (2 * a)
	x_2 = (-b - Math.sqrt(d) ) / (2 * a)
	puts "x_1 = #{x_1}"
	puts "x_2 = #{x_2}"
elsif d == 0
	x = -b / ( 2 * a )
	puts "x_1 = x_2 = #{x}"
elsif d < 0
	puts "Корней нет"
end
