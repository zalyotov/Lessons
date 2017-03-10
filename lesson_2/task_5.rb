puts 'Введите число'
day = gets.chomp.to_i

puts 'Введите месяц'
month = gets.chomp.to_i

puts 'Введите год'
year = gets.chomp.to_i

result = 0
months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if ( year % 4 == 0 && year % 100 == 0 ) || year % 400 == 0
	months[1] = 29
	puts '#{year} - високосный год'
else
	puts '#{year} - не високосный год'
end

months.each do |index, days|
	
	if index + 1 < month
		result += days
	elsif index + 1 == month
		result += day
	end
	
end

puts 'Порядковый номер даты равен #{result}'
