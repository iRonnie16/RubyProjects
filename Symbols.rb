#!/usr/bin/env ruby
###########################################################
strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"] #
                                                          #
symbols = []                                              #   Converts strings in strings
                                                          #   array to symbols and pushes 
strings.each do |s|                                       #     them to symbols array.
    symbols.push(s.to_sym) # .intern can replace .to_sym  #
end                                                       #
###########################################################

##############################\
my_hash = {              #     #
  :Car => "Ford",        #     #
  :Drink => "Coke",      #     #   
  :Place => "Ireland"    #     #       How to create hashes using
}                        #     ######  Symbols to define keys and
        ##OR##           #     #       Using hash literal construct
my_hash2 = {             #     #
  Drug: "Weed",          #     #
  Alcohol: "Whiskey",    #     #
  Gun: "AR-15"           #     #
}                        #     #
         ##OR##          #####<
my_hash3 = Hash.new      #     #        How to create hashes using
  my_hash3[Cat] = "Tabby"#     ######  Variable name to set keys and
  my_hash3[Bar] = "Twix" #     #       Using hash construct notation
  my_hash3[Shoe] = "Van" #     #
##############################/
