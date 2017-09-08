array_of_numbers = (1..16).to_a

#hard way

i = 0

array_of_numbers.each do |item|
  p array_of_numbers[i, 4] if i % 4 == 0
  i = i + 1
end

# easy way
array_of_numbers.each_slice(4) {|a| p a}
