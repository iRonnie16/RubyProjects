#!/usr/bin/env ruby
loop do
print "Enter a string"
$user_input = gets.chomp
$user_input.downcase!.capitalize!

if $user_input.include? "s"
  $user_input.gsub!(/s/, "th")
  break
    elsif
    $user_input.empty? 
    puts "You didn't enter anything"
  else
    puts "string doesn't contain 'S'"
end
end
print "You said #{$user_input}!"