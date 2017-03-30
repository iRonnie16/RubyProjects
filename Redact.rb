#!/usr/bin/env ruby
puts "Text to search through: "
text = gets.chomp.downcase
puts "Words to redact: "
redact = gets.chomp.downcase.to_s

redactedString = " "

words = text.split(" ")
redactedWords = redact.split(" ")

words.each do |word|
  redactedString += "[redacted] " if redactedWords.include? word   
  if !(redactedWords.include? word)
     redactedString += word + " "
  end
end

puts redactedString