#!/usr/bin/env ruby

=begin
Multi
Line
Comment
=end

|| # Or boolean operator

&& # And boolean operator

"#{ex_var}" #String interpolation. Fetches the string value of variable ex_var

puts # Displays the following string and adds a new line

print # Doesn't add a new line

name = gets.chomp # Creates the variable "name" and is defined by "gets" a.k.a what it receives from the user. ".chomp" Erases unnecessary whitespace and extra lines

name.downcase! # Takes all input from the user and makes it all lowercase. The "!" Makes it change the original text rather than making a new copy

name.upcase! # Does the same as ".downcase!" but instead of making it lowercase it makes it all uppercase

name.capitalize! # Pretty self explanatory

expression if boolean # This simplified if statement executes the expression if boolean. Pretty simple

expre... boolean ? ...ssion: Else expression # Example if this equals to true:... puts this ? "Put this if true": "Else put this if false"

boolean ? expression: else          # Ternary conditional, a one line if/else
puts 3 > 1 ? "Hello World!": "Goodbye"   # Here is an example of a ternary conditional

unless # Basically the reverse of an if statement
  
return # Not necessary in a method (implicit return)

.gsub! # Globabl substitution

{} # Anything in curly braces is a block

do something  # Do and End can
end           # Replace curly brackets

|X|, |Y,Z|, and |The_other, 23| # Block arguments

$ # Creates a global variable

@ # Creates an instance variable

@@ # Creates a class variable

.split # A postfix for variables. name.split(" ") Would take the name variable, the text from the user, and splits it everywhere that a space appears
# Thus the ("(space)") essentially listing it into individual words. Useful for counting words, creating hashes etc.

def splat_arg(beers, *brands)    # Splat arguments for methods
  body               # Use an asterisk before the argument
end                  # These allow the method to accept multiple arguments

Hash.new # A shortcut to create a new hash list

puts # displays whatever you put after it on screen

print # Same as puts but doesn't start a new line

.to_s # Converts to a string

.to_a # Converts to an array

.to_f # Converts to a float

.to_sym # Converts to a symbol

.to_i # Converts to an integer

.each_key # Specifically works with hash keys

.each_value # Specifically works with hash values

"L".upto("P") { |letter| puts letter }  # Puts the range of letters from L to P

.downto # Reverse version of .upto

.respond_to? # Returns true if an object can respond to a symbol method ([1, 2, 3].respond_to?(:push)) = true

.next # Takes an integer and returns the next integer

<< # Can push a single item to an array/string etc.  "Hello" << "World!" --> "Hello World!"

var ||= # Changes a variable and make it immutable until var = is called again

x.times do # Can perform an expression x amount of times (end)
  
x ** y # Puts x to the power of y

array.collect {|x| x*x} # Applies expression in a block to each element in an array and returns a copy of the array unless .collect!

yield # Essentially transfers between a block and a method

sleep(secs); # Allows you to delay the expression for (secs)

my_array.each do |n| puts n if n % 2 == 0 # Puts each even number of an array (2 != 0 for odd)
  
books.sort! { |firstBook, secondBook| firstBook <=> secondBook } # To sort books in ascending order (switch firstbool with secondbook for descending)

.floor # Rounds a float down to the nearest integer

.call # Calls a process/lambda without using a method

.is_a? # Returns true if the specified object is what comes after. i.e .is_a? Symbol

class1 < class2 # Lets class1 inherit attributes from class2

Time.now # Gets current time

public/private # Placed before methods to decide what's visible to end users

date # Ruby Module to get current date

include # Allows you to acces a modules methods in your class blocks

extend # Allows a class itself to access a modules methods

.inspect # Used to make symbols readable

.join # Converts all elements of an array to a string

.keys/.values # Specifies either keys or values in hashes

.split # Turns each word in a string to a sinlge string

module Example       # modules store constants and act as toolboxes
  CONSTANT = value   # module constants can be called with Example::CONSTANT
end


word = gets.chomp                 # Frames a specific word in asterisks
frame = '*' * (4 + word.size)   #       
puts frame                      #        *************
puts "* #{word} *"              #        * Like This *
puts frame                      #        *************

variable                                 #This is an alternative to:
case variable                            #case variable
  when option1 then expression1          #when option1
  when option2 then expression2          # expression1
end                                      #end

