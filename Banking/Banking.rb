#!/usr/bin/env ruby
class Account
    
  attr_reader :name, :balance
    
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end
  
  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    return "Access denied: incorrect PIN."
  end
  
  public
  
  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end
  
  def withdraw(pin_number, amount)
    if @balance < 2 && amount > 1
      puts "Insufficient funds!"
    elsif pin_number == pin
      @balance -= amount
      puts "Withdrew $#{amount}. New balance: $#{@balance}."
    else
      puts pin_error
    end
  end
  
  def deposit(pin_number, amount)
    if pin_number == pin
      @balance += amount
      puts "Added $#{amount}. New balance: $#{balance}"
    else
      pin_error
    end
  end 
  
end

class SavingsAccount < Account 
    
  def pin
    @pin = 135
  end
  
end

checking_account = Account.new("Ronnie", 1)
checking_account.deposit(1234, 1)
savings_account = SavingsAccount.new("RonnieSave", 1)
savings_account.withdraw(135, 1)