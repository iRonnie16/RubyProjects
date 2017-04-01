#!/usr/bin/env ruby
friends = ["Bob", "Alice", "Miriana"]

puts "What's your name?"
name = gets.chomp.downcase!
name.capitalize!

if friends.include? name
  puts "Hello #{name}!"
  else
    puts "
You're new here, #{name}. I'll remember you next time!"
    friends.push("#{name}")
    puts "
Updated list:"
    puts friends
end


