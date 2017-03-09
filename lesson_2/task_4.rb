
letters = ('a'..'z').to_a
res = {}
vowels = ["a", "e", "o", "u", "y"]
i = 1

letters.each do |letter|

  if vowels.include? letter
    res[letter] = i
  end

  i +=1

end