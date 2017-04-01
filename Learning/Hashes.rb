#!/usr/bin/env ruby
myhash = Hash.new
myhash["Drink"] = "Coke"
myhash["Game"] = "Fallout 4" # Creates a new Hash containing a type of drink and specific game

myhash.each do |type, item|  # Specifically puts the keys and values so as
  puts "#{type}: #{item}"    # To not include square brackets and rockets.(=>)
end    

movie_ratings = {
  memento: 3,
  primer: 3.5,
  the_matrix: 5,
  truman_show: 4,        # Creates a new Hash of movie
  red_dawn: 1.5,         #    Titles and ratings
  skyfall: 4,
  alex_cross: 2,
  uhf: 1,
  lion_king: 3.5
}

movie_ratings.each_key do |k| #   Only puts the names (keys"k")
    puts k                    # Of movies from movie_ratings array. 
end 

good_movies = movie_ratings.select { |movie, rate| rate > 3 } # Creates a Hash containing only "good" movies (rating of more than 3)
