class Meetups::CLI

  def call
    list_meetups
    menu
    goodbye
  end

  def list_meetups
    puts ""
    puts "---------- WomenWhoCodeNYC's Upcoming Meetups: ----------"
    puts ""
    @meetups = Meetups::Event.scrape_meetups
    @meetups.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date}"
    end
    puts ""
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of a meetup to see more details, or type 'list' to see the list of meetups, or type 'exit'."
      puts ""
      input = gets.strip.downcase.gsub("'", "")

      if input.to_i > 0 && @meetups[input.to_i - 1]
        event_details = @meetups[input.to_i - 1]
        puts ""
        puts "********** #{event_details.name} **********"
        puts ""
        puts "When: #{event_details.date} at #{event_details.time}"
        puts "Where: #{event_details.location} at #{event_details.address}"
        puts ""
        puts "RSVP at #{event_details.url}"
        puts ""
        puts "-"
      elsif input == "list"
        list_meetups
      elsif input == "exit"
        return
      else
        puts ""
        puts "Make sure you're typing a number between #{@meetups.index(@meetups.first) + 1} - #{@meetups.index(@meetups.last) + 1} or the word 'list' or 'exit'."
      end
    end
  end

  def goodbye
    puts ""
    puts "Have fun at your meetups!"
    puts ""
  end

end