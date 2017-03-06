puts "Введите длину первой стороны треугольника"
a = gets.chomp.to_i

puts "Введите длину второй стороны треугольника"
b = gets.chomp.to_i

puts "Введите длину третьей стороны треугольника"
c = gets.chomp.to_i


# равносторонний
if a == b && b == c
	puts "Треугольник равносторонний и не прямоугольный"
	abort
	
end

# равнобедренный
if a == b || b == c || c == a
	puts "Треугольник равнобедренный"
end

# поиск гипотенузы и проверка на прямоугольность
max = a
tr = false

if max < b
	max = b
	if max**2 == a**2 + c**2
		tr = true
	end
end
if max < c
	max = c
	if max**2 == a**2 + b**2
		tr = true
	end
end

if tr
	puts "Треугольник прямоугольный"
	puts "Гипотенуза треугольника равна #{max}"
elsif
	puts "Треугольник не прямоугольный"
end



