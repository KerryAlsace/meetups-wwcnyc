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

      if input.to_i > 0 && @meetups[input.to_i - 1]
        event_details = @meetups[input.to_i - 1]
        puts "Event: #{event_details.name}"
        puts "When: #{event_details.date} at #{event_details.time}"
        puts "Where: #{event_details.location} at #{event_details.address}"
        puts "RSVP at #{event_details.url}"
      elsif input == "list"
        list_meetups
      elsif input == "exit"
        return
      else
        puts "Not sure what you want, type list or exit"
      end
    end
  end

  def goodbye
    puts "Have fun at your meetups!"
  end

end