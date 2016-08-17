class Meetups::CLI

  def call
    list_meetups
    menu
    goodbye
  end

  def list_meetups
    puts "WomenWhoCodeNYC's Upcoming Meetups:"
    @meetups = Meetups::Event.scrape_meetups
    @meetups.each.with_index(1) do |event, i|
      puts "#{i} #{event.name} - #{event.date}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of a meetup to see more details, or type list to see the list of meetups, or type exit."
      input = gets.strip.downcase
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