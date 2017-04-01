#!/usr/bin/env ruby
class Person
  def initialize(name)
    @name = name
  end                           # Basic class allowing us to add new people with specified names
end

matz = Person.new("Yukihiro")