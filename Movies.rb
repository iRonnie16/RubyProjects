#!/usr/bin/env ruby
require 'yaml'

file = 'C:\Users\Ronnie\Desktop\test.yml'
if File.exists?(file)
  movies = YAML::load_file(file)  # load yaml
else
  movies = Hash.new
end
  
puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie."
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."

choice = gets.chomp.downcase.capitalize!
case choice
when 'Add'
  puts "What movie would you like to add?"
  title = gets.chomp.downcase.capitalize!
  if movies[title.to_sym].nil?
    puts "What rating would you give #{title}? (0-5)"
    rating = gets.chomp
    if (rating.to_i < 0 || rating.to_i > 5)
      puts "Ratings must be between 0 and 5!"
    else
    movies[title.to_sym] = rating.to_i
    puts "#{title} added with a rating of #{rating}."
    end
  else 
    puts "That movie already exists!"
  end
when 'Update'
  puts "Which title would you like to update?"
  movies.each { |movie, score| puts "#{movie}: #{score}" }
  title = gets.chomp.downcase.capitalize!
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    puts "What's the new rating for #{title}? (0-5)"
    rating = gets.chomp
    if (rating.to_i < 0 || rating.to_i > 5)
      puts "Ratings must be between 0 and 5"
    else
    movies[title.to_sym] = rating.to_i
    puts "#{title} has been updated with new rating of #{rating}!"
    end
  end
when 'Display'
  movies.each do |movie, score|
    puts "#{movie}: #{score}"
  end
when 'Delete'
  puts "What movie do you want to delete?"
  movies.each { |movie, score| puts "#{movie}: #{score}" }
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Movie not found!"
  else
    movies.delete(title.to_sym)
    puts "#{title} has been removed."
  end
else
  puts "Sorry, I didn't understand you."
end

movies.each { |movie, score| puts "#{movie}: #{score}" }

File.open(file, 'w') {|f| f.write movies.to_yaml } #store yaml