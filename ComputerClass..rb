#!/usr/bin/env ruby
require 'yaml'
file = 'C:\Users\Ronnie\Desktop\Coding\Ruby\vm_db.yml'
$users = File.exists?(file) ? YAML::load_file(file): $users = {}

class Computer
  attr_accessor :username
  attr_accessor :password
  attr_accessor :users
  attr_accessor :files
  
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    $users[username.to_sym] = password.to_sym
  end  
  
  def create(filename)
    @time = Time.now
    @files[filename] = @time
    p "New file created: #{filename}(#{@time})"
  end
  
  def Computer.get_users
    return $users
  end
end
sign_up_success = false
logged_in = false
length_ok = false
correct_password = false

p "Would you Like to log in or sign up?"
choice = gets.chomp.upcase!

case choice
when "SIGN UP"
  until sign_up_success
    p "Enter a valid username (0-10 characters):"
    username_new = gets.chomp
      if ($users[username_new.to_sym].nil?) && ((username_new.length < 11) && (username_new.length > 0))
        until length_ok 
        p "Enter a new password (between 5 and 15 characters):"
        password_new = gets.chomp
          if (password_new.length > 4) && (password_new.length < 16)
            length_ok = true
            if length_ok
              p "New account created. Login succesful!"
              username_new = Computer.new(username_new.to_sym, password_new.to_sym)
              logged_in = true
              sign_up_success = true
            end
          else
          p "Passwords must be between 5 and 15 characters!"
          end
        end
      else
      p "That username is taken or doesn't fit the character limit!"
      end
  end
when "LOG IN"
  until logged_in
    p "Enter your username:"
    username = gets.chomp
      if $users[username.to_sym]
        until correct_password
          p "Enter your password:"
          password = gets.chomp
          p $users[username.to_sym] == password.to_sym ? "Login succesful!": "invalid password!"
          if $users[username.to_sym] == password.to_sym
            (logged_in = true) && (correct_password = true)
          end
        end
      else
        p "That username isn't registered!"
      end
  end
else
  p "Please choose to either 'log in' or 'sign up'."
end

if logged_in
  p "Welcome what would you like to do?"
  p "Type 'create' to create a new file"
  p "Type 'sign out' if you would like to sign out"
end

if sign_up_success > 0 then file = File.open(file, 'w') {|f| f.write $users.to_yaml};end