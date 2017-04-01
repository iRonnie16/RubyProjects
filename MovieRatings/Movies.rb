#!/usr/bin/env ruby
require 'yaml'
file = 'C:\Users\Ronnie\Desktop\Coding\Ruby\Movielist.yml'
movies = File.exists?(file) ? YAML::load_file(file): movies = Hash.new 
p "What would you like to do?" 
p "-- Type 'add' to add a movie."
p "-- Type 'update' to update a movie."
p "-- Type 'display' to display all movies."
p "-- Type 'delete' to delete a movie."
choice = gets.chomp.downcase.capitalize!
case choice
when 'Add' then p "What movie would you like to add?"
  title = gets.chomp.downcase.split.each {|i| i.capitalize!}.join(' ')
  p movies[title.to_sym].nil? ? "What rating would you give #{title}? (0-5)": "That movie already exists! Assign a new rating."
    rating = gets.chomp
      if (rating.to_i < 0 || rating.to_i > 5) 
        p "Ratings must be between 0 and 5!"
      else
        p "#{title} added with a rating of #{rating}."
      end
      if !(rating.to_i < 0 || rating.to_i > 5)
        movies[title.to_sym] = rating.to_i
      end
when 'Update' then p "Which title would you like to update?"
  movies.each {|movie, score| p "#{movie}: #{score}"}
  title = gets.chomp.downcase.split.each {|i| i.capitalize!}.join(' ')
  p movies[title.to_sym].nil? ? "Movie not found!": "What's the new rating for #{title}? (0-5)"
    rating = gets.chomp
    p (rating.to_i < 0 || rating.to_i > 5) ? "Ratings must be between 0 and 5": "#{title} has been updated with new rating of #{rating}!" 
      if !(rating.to_i < 0 || rating.to_i > 5)
        movies[title.to_sym] = rating.to_i
      end
when 'Display' then movies.each {|movie, score| p "#{movie}: #{score}"}
when 'Delete' then p "What movie do you want to delete?"
  movies.each {|movie, score| p "#{movie}: #{score}"}
  title = gets.chomp.downcase.split.each {|i| i.capitalize!}.join(' ')
  p movies[title.to_sym].nil? ? "Movie not found!": "#{title} has been removed."
  if !(movies[title.to_sym].nil?)
    movies.delete(title.to_sym)
  end
else
  p "Error! Check spelling."
end
movies.each {|movie, score| p "#{movie}: #{score}"} if !(choice.include? "Display")
File.open(file, 'w') {|f| f.write movies.to_yaml} #store yaml