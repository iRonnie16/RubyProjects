#!/usr/bin/env ruby
require 'yaml'
file = 'C:\Users\Ronnie\Desktop\Coding\Ruby\expenses.yml'
class String
  def numeric?
    Float(self) != nil rescue false
  end
end
expenses = File.exists?(file) ? YAML::load_file(file): expenses = Hash.new
puts "What would you like to do?" 
puts "-- Type 'add' to add an expense."
puts "-- Type 'update' to update a cost."
puts "-- Type 'display' to display all expenses and total cost."
puts "-- Type 'delete' to delete an expense."
choice = gets.chomp.downcase.capitalize!
show = Proc.new { |expense, cost| puts "#{expense}: #{cost}" if !(choice.include? "Display") }
case choice
when 'Add' then puts "What expense would you like to add?"
  title = gets.chomp.downcase.capitalize!
  puts expenses[title.to_sym].nil? ? "What will #{title} cost?": "That expense already exists! Assign a new cost."
  amount = gets.chomp
  puts !(amount.numeric?) ? "Cost must be a number!": expenses[title.to_sym] = amount.to_i
  puts "#{title} added with a cost of #{amount}." if (amount.numeric?)
when 'Update' then puts "Which expense would you like to update?"
  expenses.each.to_a.select(&show)
  title = gets.chomp.downcase.capitalize!
  puts expenses[title.to_sym].nil? ? "Expense not found!": "What's the new cost of #{title}?"
  puts expenses[title.to_sym].nil? ? "#{abort}": amount = gets.chomp
  if !(amount.numeric?)
    puts "Cost must be a number!"
  else
    puts "#{title} has been updated with new cost of #{amount}!"
  end
  expenses[title.to_sym] = amount.to_i if (amount.numeric?)
when 'Display' then expenses.each do |expense, cost|
    puts "#{expense}: #{cost}"
end
when 'Delete' then puts "What movie do you want to delete?"
  expenses.each.to_a.select(&show)
  title = gets.chomp.downcase.capitalize!
  puts expenses[title.to_sym].nil? ? "Expense not found!": "#{title} has been removed.#{expenses.delete(title.to_sym)}"
else
  puts "Error! Check spelling."
end
expenses.each.to_a.select(&show)
my_cash = 371
sum = 0
expenses.each { |key, value| sum += value }
spare_cash = (my_cash - sum)
puts "---------------
Total: #{sum}
Spare cash: #{spare_cash}"
File.open(file, 'w') {|f| f.write expenses.to_yaml } #store yaml