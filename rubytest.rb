class MyApp < Shoes
  class Actions
    def initialize(myApp)
      @myApp = myApp
    end
  
    def dologin(username, password)
      @myApp.app do
        visit '/entry'
      end
    end
  end
	url "/", :loginscreen
	url "/entry", :entryscreen
	url "/help", :helpscreen
  
  def loginscreen
    stack do
      @myActions = Actions.new(self)
  
      username = edit_line
      password = edit_line
  
      button "Log In" do
        @myActions.dologin(username.text, password.text)
        para "Please enter your username and password"
      end
    end
  end
  
  def entryscreen
    stack do 
      para "Entry Screen - whats your secret?"
      @the_secret = edit_line text: "Secret"
      flow do
        button "home" do visit '/'end
        button "help" do visit '/help' end
      end
    end
  end
  
  def helpscreen
     stack do 
      para "This page describes MyApp, a very demo for structuring a Shoes application "
      flow do
        button "entry" do visit '/entry'end
        button "home" do visit '/' end
      end
    end end
end
Shoes.app :width => 400, :height => 300, :margin => 5