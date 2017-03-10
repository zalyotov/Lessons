puts 'Введите число'
day = gets.chomp.to_i

puts 'Введите месяц'
month = gets.chomp.to_i

puts 'Введите год'
year = gets.chomp.to_i

i = 0
result = 0
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

months = months[0..month-1]

if ( year % 4 == 0 && year % 100 == 0 ) || year % 400 == 0
	months[1] = 29
	puts "#{year} год - високосный"
else
	puts "#{year} год - не високосный"
end

months.each do |days|

	i += 1

	if i == month
		result += day
	else
		result += days
	end

end

puts "Порядковый номер даты равен #{result}"
