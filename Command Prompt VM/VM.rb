#!/usr/bin/env ruby
require 'yaml'
file = 'C:\Users\Ronnie\Desktop\Coding\Ruby\vm_db.yml'
files = 'C:\Users\Ronnie\Desktop\Coding\Ruby\user_files.yml'
$users = File.exists?(file) ? YAML::load_file(file): $users = {}
$files = File.exists?(files) ? YAML::load_file(files): $files ={}

class Computer
  attr_accessor :username
  attr_accessor :password
  attr_accessor :users
  attr_accessor :files
  
  def initialize(username, password)
    @username = username
    @password = password
    $files = {}
    $users[username.to_sym] = password.to_sym
  end  
  
  def create(filename)
    @time = Time.now
    $files[filename.to_sym] = @time 
    p "New file created: #{filename.to_sym}(#{@time})"
  end
  
  def Computer.get_users
    return $users
  end
end
choice_picked = false
sign_up_success = false
logged_in = false
length_ok = false
correct_password = false
old_password = false
old_account = false

p "Would you Like to log in or sign up?"
until choice_picked
choice = gets.chomp.upcase!

case choice
when "SIGN UP" then choice_picked = true
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
when "LOG IN" then choice_picked = true
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
end

session = Computer.new("initialize".to_sym, "initialize".to_sym)

if logged_in
  p "Welcome what would you like to do?"
  while logged_in
    p "Type 'create' to create a new file"
    p "Type 'change password' if you'd like to update your password"
    p "Type 'sign out' if you would like to sign out"
    p "Type 'delete' to delete your account"
    choice = gets.chomp.upcase!
  
    case choice
    when "CREATE" then puts "what would you like to name your new file?"
      filename = gets.chomp
      puts "What do you want to enter in the file?"
      contents = gets.chomp
      File.open("#{filename}", "w") {|f| f.write"#{contents}"}
      file_created = true
      session.create("#{filename.to_sym}")
    when "SIGN OUT"
      puts "Succesfully signed out. Come back soon!"
      logged_in = false
    when "CHANGE PASSWORD"
      p "Confirm your username:"
      curr_user = gets.chomp
      until old_account
        if $users[curr_user.to_sym]
          old_account = true
          until old_password
            p "Confirm your old password:"
            prev_password = gets.chomp
            p $users[curr_user.to_sym] == prev_password.to_sym ? "Enter your new password (5-15 chars):": "Incorrect password!"
            if $users[curr_user.to_sym] == prev_password.to_sym
              new_password = gets.chomp
              if ((new_password.length < 16) && (new_password.length > 4))
                $users[:iRonnie16] = new_password.to_sym
                old_password = true
              else
                p "Password must be between 5 and 15 chars!"
              end
            end
          end
        else
          p "Incorrect username!"
        end
      end
    when "DELETE" then puts "Are you sure?!"
      response = gets.chomp.upcase!
      if response.include? "YES"
        p "Confirm account to delete (username):"
        username = gets.chomp
        $users.delete(username.to_sym)
        puts "Account #{username} deleted! Signing you out..."
        logged_in = false
      end
    else
      puts "Pick a valid choice"
    end
  end
end

if file_created then files = File.open(files, 'w') {|f| f.write $files.to_yaml};end
if sign_up_success then file = File.open(file, 'w') {|f| f.write $users.to_yaml};end