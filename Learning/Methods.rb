#!/usr/bin/env ruby
# Method that capitalizes a word
def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}"
end


# Method that outputs a doubled number
def double(n)
  puts n * 2
end


# Method that returns true if 'number' divides wholly into 5
def by_5?(number)
  return number % 5 ==0
end


# Method Block
# The block, {|i| puts i}, is passed the current
# array item each time it is evaluated. This block
# prints the item. 
[1, 2, 3, 4, 5].each { |i| puts i }

# This block prints the number 5 for each item.
# (It chooses to ignore the passed item, which is allowed.)
[1, 2, 3, 4, 5].each { |i| puts i * 5 }


# Method that first sorts an array and then decides if it should display in ascending order or reverse
def alphabetize(arr, rev=false)
  arr.sort!
  if rev
  arr.reverse!
  end
end

def double(n)                  # 
  yield n                      # This method accepts a single parameter
end                            # Then yields the parameter to the
                               # Block to be doubled
double(5) { |n| puts n * 2 }   #