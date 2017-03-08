puts 'Введите длину первой стороны треугольника'
a = gets.chomp.to_f

puts 'Введите длину второй стороны треугольника'
b = gets.chomp.to_f

puts 'Введите длину третьей стороны треугольника'
c = gets.chomp.to_f


# равносторонний
if a == b && b == c
  abort 'Треугольник равносторонний, равнобедренный и не прямоугольный'
end

# равнобедренный
if a == b || b == c || c == a
  puts 'Треугольник равнобедренный'
end

# поиск гипотенузы
if a > b and a > c
  gipotenuza = a
  katet_1 = b
  katet_2 = c
elsif b > a and b > c
  gipotenuza = b
  katet_1 = a
  katet_2 = c
else
  gipotenuza = c
  katet_1 = a
  katet_2 = b
end

puts "Гипотенуза равна #{gipotenuza}"

if katet_1**2 + katet_2**2 == gipotenuza**2
  puts 'Треугольник прямоугольный'
else
  puts 'Треугольник не прямоугольный'
end




