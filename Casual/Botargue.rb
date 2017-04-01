#!/usr/bin/env ruby
# Bot doesn't have the patience for you to mess around. Just do what he says.
counter = 0
puts "Type 'Hello World!': "
input = gets.chomp

if (counter == 0) && (input.include? "Hello World!")
  puts "Good boy."
  counter += 5
 else
   puts "Try again, idiot"
   counter +=1
end

if counter == 5
  abort
end


input2 = gets.chomp

if (counter == 1) && (input2.include? "Hello World!")
  puts "Finally!"
  counter += 4
 else
   puts "Last chance, read carefully"
   counter +=1
end

if counter == 5
  abort
end


input3 = gets.chomp

if (counter == 2) && (input3.include? "Hello World!")
  puts "At long fucking last!"
elsif
  (counter == 2) && (input3.include? " ")
  puts "Fine. Goodbye, asshole!"
 else
   puts "Fine. Goodbye, asshole!"
    
end

