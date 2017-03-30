#!/usr/bin/env ruby
cube = Proc.new { |x| x ** 3 } # Simply a process to cube a number

multiples_of_3 = Proc.new do |n|       # Process that checks
  n % 3 == 0                           # if a number divides 
end                                    # Into three

(1..100).to_a.select(&multiples_of_3)  # Calls the process to display multiples of 3 (0-100)