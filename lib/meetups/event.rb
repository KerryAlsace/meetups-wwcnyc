class Meetups::Event
  attr_accessor :name, :date, :time, :location, :address, :url, :events

  def initialize
    @events = []
  end

  def self.events
    @events
  end

  def self.upcoming
    self.scrape_meetups
  end

  def self.scrape_meetups
    # Scrape WWCNYC meetups page and add events and their details to @events array
    doc = Nokogiri::HTML(open("https://www.meetup.com/WomenWhoCodeNYC/"))
    doc.css("div#events-list-module ul.event-list li.event-item").to_a.each.with_index do |event, i|
      event = Meetups::Event.new
      unless doc.css("h3.flush--bottom span")[i].text.include?("Holiday")
        event.name = doc.css("h3.flush--bottom span")[i].text
        event.date = doc.css("li.dateTime span.date")[i].text
        event.time = doc.css("li.dateTime span.time")[i].text
        event.location = doc.css("div.event-content dt.event-venuename a.no-color")[i].text
        event.address = doc.css("div.event-content dd.text--secondary")[i].text.split.join(" ").gsub(" (map)", "")
        event.url = doc.css("h3.flush--bottom a")[i].attr('href')
        event.events << event
      end
    end
    self.events
  end
      
end



    # event_1 = self.new
    # event_1.name = doc.css("ul.event-list li.event-item h3.flush--bottom span")[0].text
    # event_1.date = doc.css("ul.event-list li.event-item li.dateTime span.date")[0].text
    # event_1.time = doc.css("ul.event-list li.event-item li.dateTime span.time")[0].text
    # event_1.location = doc.css("ul.event-list li.event-item div.event-content dt.event-venuename a.no-color")[0].text
    # event_1.address = doc.css("ul.event-list li.event-item div.event-content dd.text--secondary")[0].text.split.join(" ").gsub(" (map)", "")
    # event_1.url = doc.css("ul.event-list li.event-item h3.flush--bottom a")[0].attr('href')

    # event_2 = self.new
    # event_2.name = doc.css("ul.event-list li.event-item h3.flush--bottom span")[1].text
    # event_2.date = doc.css("ul.event-list li.event-item li.dateTime span.date")[1].text
    # event_2.time = doc.css("ul.event-list li.event-item li.dateTime span.time")[1].text
    # event_2.location = doc.css("ul.event-list li.event-item div.event-content dt.event-venuename a.no-color")[1].text
    # event_2.address = doc.css("ul.event-list li.event-item div.event-content dd.text--secondary")[1].text.split.join(" ").gsub(" (map)", "")
    # event_2.url = doc.css("ul.event-list li.event-item h3.flush--bottom a")[1].attr('href')

    # puts [event_1, event_2]