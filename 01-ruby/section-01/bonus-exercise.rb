#!/usr/bin/ruby

number = rand(10)
guess = false
response = nil

until guess do
  if response == nil
    print 'guess a number including or between 0 and 9: '
  elsif response < number and response >= 0
    print 'too low! guess again: '
  elsif response > number and response < 10
    print 'too high! guess again: '
  else
    print 'guess out of range! guess again: '
  end

  response = gets.to_i

  guess = true if response == number
end

puts 'you got it right! byeeeee!'
