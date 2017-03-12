letters = ('a'..'z')
res = {}
vowels = %w( a e i o u )

letters.each.with_index(1) do |letter, index|
  res[letter] = index if vowels.include? letter
end