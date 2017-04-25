class Meetups::EventFinder

  def self.get_meetups
    uri = URI.parse('https://api.meetup.com/WomenWhoCodeNYC/events?&sign=true&photo-host=public')
    response = Net::HTTP.get_response(uri)
    events = JSON.parse(response.body)
    events.each do |json_event|
      date_time = Time.at(json_event["time"] / 1000)
      event = Meetups::Event.new
      event.name = json_event["name"]
      event.date = date_time.strftime("%B %d, %Y")
      event.time = date_time.strftime("%I:%M %p %Z")
      if json_event["venue"]
        event.location = json_event["venue"]["name"]
        event.address = json_event["venue"]["address_1"] + ", " + json_event["venue"]["city"] + " " + json_event["venue"]["zip"]
      end
      event.url = json_event["link"]
      event.save
    end
  end

end