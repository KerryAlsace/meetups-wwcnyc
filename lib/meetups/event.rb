class Meetups::Event
  attr_accessor :name, :date, :time, :location, :address, :url

  def self.upcoming
    #return upcoming WWCNYC meetups
    scrape_meetups
  end

  def self.scrape_meetups
    doc = Nokogiri::HTML(open("https://www.meetup.com/WomenWhoCodeNYC/"))

    event_1 = self.new
    event_1.name = doc.css("ul.event-list li.event-item h3.flush--bottom span")[0].text
    event_1.date = doc.css("ul.event-list li.event-item li.dateTime span.date")[0].text
    event_1.time = doc.css("ul.event-list li.event-item li.dateTime span.time")[0].text
    event_1.location = doc.css("ul.event-list li.event-item div.event-content dt.event-venuename a.no-color")[0].text
    event_1.address = doc.css("ul.event-list li.event-item div.event-content dd.text--secondary")[0].text.split.join(" ").gsub(" (map)", "")
    event_1.url = doc.css("ul.event-list li.event-item h3.flush--bottom a")[0].attr('href')

    event_2 = self.new
    event_2.name = doc.css("ul.event-list li.event-item h3.flush--bottom span")[1].text
    event_2.date = doc.css("ul.event-list li.event-item li.dateTime span.date")[1].text
    event_2.time = doc.css("ul.event-list li.event-item li.dateTime span.time")[1].text
    event_2.location = doc.css("ul.event-list li.event-item div.event-content dt.event-venuename a.no-color")[1].text
    event_2.address = doc.css("ul.event-list li.event-item div.event-content dd.text--secondary")[1].text.split.join(" ").gsub(" (map)", "")
    event_2.url = doc.css("ul.event-list li.event-item h3.flush--bottom a")[1].attr('href')

    puts [event_1, event_2]
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