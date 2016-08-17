class Meetups::Event
  attr_accessor :name, :date, :time, :location, :url

  def self.upcoming
    #return upcoming WWCNYC meetups
    event_1 = self.new
    event_1.name = "#HIREWWCode- How to Negotiate your Salary with a Corporation"
    event_1.date = "Tue Aug 23"
    event_1.time = "6:30 PM"
    event_1.location = "250 Greenwich St, New York, NY"
    event_1.url = "https://www.meetup.com/WomenWhoCodeNYC/events/232116881/"

    event_2 = self.new
    event_2.name = "Holiday - Labor Day"
    event_2.date = "Mon Sep 5"
    event_2.time = "7:00 PM"
    event_2.location = "USA, New York, NY"
    event_2.url = "https://www.meetup.com/WomenWhoCodeNYC/events/228581253/"

    [event_1, event_2]
    scrape_meetups
  end

  def self.scrape_meetups
    doc = Nokogiri::HTML(open("https://www.meetup.com/WomenWhoCodeNYC/"))
    binding.pry

    event_1 = self.new
    event_1.name = doc.css("ul.event-list li.event-item h3.flush--bottom span").first.text
    event_1.date = doc.css("ul.event-list li.event-item li.dateTime span.date").first.text
    event_1.time = doc.css("ul.event-list li.event-item li.dateTime span.time").first.text
    event_1.location = "250 Greenwich St, New York, NY"
    event_1.url = "https://www.meetup.com/WomenWhoCodeNYC/events/232116881/"

    event_2 = self.new
    event_2.name = doc.css("ul.event-list li.event-item h3.flush--bottom span")[1].text
    event_2.date = doc.css("ul.event-list li.event-item li.dateTime span.date")[1].text
    event_2.time = doc.css("ul.event-list li.event-item li.dateTime span.time")[1].text
    event_2.location = "USA, New York, NY"
    event_2.url = "https://www.meetup.com/WomenWhoCodeNYC/events/228581253/"
  end
      
end

# Event will have:
# Name
# Date
# Time
# Locations
# URL

# Add later:
# Event Details
# RSVP open?