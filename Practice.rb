#!/usr/bin/env ruby
puts "".methods

array = Array.new

array.push("fun")
array.push("games")

class Penguin
  def looks()
    return "We are cute!"
  end
end

class Calculator
  def add(x, y)
    return x + y
  end
end

Calculator.add(3, 5)

class Celsius
  
  def initialize(temp)
    @temp = temp
  end
  
  def c_to_f(temp)
    return (@temp * 1.8 + 32)
  end
end