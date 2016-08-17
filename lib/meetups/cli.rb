class Meetups::CLI

  def call
    list_meetups
    menu
    goodbye
  end

  def list_meetups
    puts "WomenWhoCodeNYC's Upcoming Meetups:"
    puts <<-DOC.gsub /^\s*/, ''
    1. #HIREWWCode- How to Negotiate your Salary with a Corporation on Tue Aug 23
    2. Holiday - Labor Day on Mon Sep 5
    DOC
  end

  def menu
    puts "Enter the number of a meetup to see more details"
  end

  def goodbye
    puts "Have fun at your meetups!"
  end

end