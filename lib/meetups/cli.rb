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
    input = nil
    while input != "exit"
      puts "Enter the number of a meetup to see more details, or type list to see the list of meetups, or type exit."
      input = gets.strip
      case input
      when "1"
        puts "More info on 1..."
      when "2"
        puts "More info on 2..."
      when "list"
        list_meetups
      when "exit"
        return
      else
        puts "Not sure what you want"
      end
    end
  end

  def goodbye
    puts "Have fun at your meetups!"
  end

end