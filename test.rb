require 'yaml'
$file = 'C:\Users\Ronnie\Desktop\Coding\Ruby\vm_db.yml'
$filedoc = 'C:\Users\Ronnie\Desktop\Coding\Ruby\user_files.yml'
$users = File.exists?($file) ? YAML::load_file($file): $users = {}
$filedoc = File.exists?($filedoc) ? YAML::load_file($filedoc): $files = {}

$sign_up_success = false
$file_created = false
$logged_in = false
$password_change = false
$valid_pass = false

def filewrite(file, hash)
  File.open(file, 'w') {|f| f.write hash.to_yaml}
end

def validate(password)
  if password =~ /\d/ and password.length < 21 and password.length > 5
    if password != password.downcase
      if password != password.upcase
        $valid_pass = true
      end
    end
  end
end

class Computer
  attr_accessor :username
  attr_accessor :password
  
  def initialize(username, password)
    @username = username.to_sym
    @password = password.to_sym
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

$session = Computer.new("initialize", "initialize")

class MyApp < Shoes
  class Actions
    def initialize(myApp)
      @myApp = myApp
    end
    
    def dosignup(username, password)
      @myApp.app do
        if !($users[username.to_sym])
          validate(password)
          if $valid_pass == true
            $users[username.to_sym] = password.to_sym
            alert "Sign up succesful! Account created!"
            $sign_up_success = true
            if $sign_up_success == true
              filewrite($file, $users)
              visit "/main"
            end
          else
            alert "Invalid password!"
          end
        else
          alert "That username is taken!"
        end
      end
    end
  
    def dologin(username, password)
      @myApp.app do
        if $users[username.to_sym] == password.to_sym
         visit '/main'
        elsif !($users[username.to_sym])
          alert "Invalid username!"
        else
          alert "Invalid password"
        end
      end
    end
    
    def dopwchange(username, old_pass, new_pass)
      @myApp.app do
        if $users[username.to_sym] == old_pass.to_sym
          validate(new_pass)
          if $valid_pass == true
            $users[username.to_sym] = new_pass.to_sym
            alert "Password changed successfully!"
            $password_change = true
            if $password_change == true
              filewrite($file, $users)
              visit "/main"
            end
          else
            alert "Invalid new password!"
          end
        else
          alert "Incorrect username/password!"
        end
      end
    end
    
    def dodelete(username, password)
      @myApp.app do
        if $users[username.to_sym] == password.to_sym
          $users.delete(username.to_sym)
          filewrite($file, $users)
          alert "Account succesfully deleted, logging you out!"
          visit '/'
        else
          alert "Incorrect username/password!"
        end
      end
    end
  end
  
  url "/", :mainmenu
  url "/login", :login
  url "/signup", :signup
  url "/main", :loggedin 
  url "/files", :files
  url "/pwchange", :passwordchange
  url "/open", :openfile
  url "/create", :create
  url"/delete", :deletefile
  url "/deleteaccount", :deleteaccount
  
  def mainmenu
    stack do
      para "Would you like to log in or sign up?"
      flow do
        button "Log In" do visit "/login" end
        button "Sign Up" do visit "/signup" end
      end
    end
  end

  def signup
    stack do
      @signup = Actions.new(self)
      para "Enter a valid username:"
      username = edit_line
      para "Enter a valid password:"
      password = edit_line
      para "(must be between 6 and 20 characters with one lowercase, one uppercase and a number)"
      
      flow do
        button "Back" do visit '/' end
        button "Sign Up" do
          @signup.dosignup(username.text, password.text)
        end
      end
    end
  end
  
  def login
    stack do
      @login = Actions.new(self)
      para "Username:"
      username = edit_line text: "iRonnie16"
      para "Password:"
      password = edit_line text: "iRonnie16"
      
      flow do
        button "Back" do visit '/' end 
        button "Log In" do
          @login.dologin(username.text, password.text)
        end
      end
    end
  end
  
  def loggedin
    stack do 
      para "Welcome! What would you like to do?"
      button "File management" do visit '/files' end
      button "Change password" do visit '/pwchange' end
      button "Sign out" do visit '/' end
      button "Delete account" do visit '/deleteaccount' end
    end
  end
  
  def files
    stack do 
      para "Select what you'd like to do"
      button "Open a file" do visit '/open' end
      button "Create new file" do visit '/create'end
      button "Delete file" do visit '/delete' end
      button "Back" do visit '/main' end
    end
  end
  
  def openfile
    para "Select what you'd like to do"
    flow do
      button "Back" do visit '/files' end
      button "Open File" do 
       filename = ask_open_file
       Shoes.app do
         para File.read(filename)
       end
      end
    end
  end
  
  def create
    stack do
      para "Choose a name for your new file:"
      @filename = edit_line text: "Example_file_name.txt"
      para "Enter the contents of your file:"
      @contents = edit_line text: "Example file contents."
      flow do
        button "Back" do visit '/files' end
        button "Create File" do
          filewrite(@filename.text, @contents.text)
          $file_created = true
          $session.create(@filename.text)
          if $file_created == true
            alert "File: #{@filename.text} succesfully created!"
          end
        end
      end
    end
  end
  
  def deletefile
    stack do
      para "Enter the filename you wish to delete"
      @filename = edit_line text: "example.txt"
      flow do
        button "Back" do visit '/files' end
        button "Delete" do
          if File.exists? "#{@filename.text}"
            File.delete "#{@filename.text}"
            alert "#{@filename.text} succesfully deleted:"
          else
            alert "File: #{@filename.text} doesn't exist!"
          end
        end
      end
    end 
  end
  
  def passwordchange
    @pwchange = Actions.new(self)
    stack do 
      para "Enter your username:"
      user = edit_line
      para "Enter your old password:"
      old_pass = edit_line
      para "Enter your new password:"
      new_pass = edit_line
      para "(must be between 6 and 20 characters with one lowercase, one uppercase and a number)"
    
      flow do
        button "Back" do visit '/main' end
        button "Change Password" do
          @pwchange.dopwchange(user.text, old_pass.text, new_pass.text)
        end
      end
    end   
  end
  
  def deleteaccount
    @delete_account = Actions.new(self) 
    stack do
      para "Confirm your username:"
      username = edit_line
      para "Confirm your password:"
      password = edit_line
        
      flow do
        button "Back" do visit '/main' end
        @delete = check; para "I'm sure I want to delete my account."
        button "Delete" do
          if @delete.checked?
            @delete_account.dodelete(username.text, password.text)
          else
            alert "Please agree that you wish to delete your account"
          end
        end 
      end     
    end
  end
end
Shoes.app :width => 300, :height => 300, :margin => 5

if $file_created == true then filewrite($filedoc, $files);end
if $sign_up_success == true then filewrite($file, $users);end