class Meetups::Event
  attr_accessor :name, :date, :time, :location, :address, :url, :events

  def initialize
    @events = []
  end

  def self.events
    @events
  end

  def self.upcoming
    # binding.pry
    #self.scrape_meetups returns array of events
    #self.events = nil for some reason
    @events = self.scrape_meetups
    @events
  end

  def self.scrape_meetups
    # Scrape WWCNYC meetups page and add events and their details to @events array
    doc = Nokogiri::HTML(open("https://www.meetup.com/WomenWhoCodeNYC/"))
    events = []
    doc.css("div#events-list-module ul.event-list li.event-item").to_a.each.with_index do |event, i|
      event = Meetups::Event.new
      # events still = [] at this point in first loop
      unless doc.css("h3.flush--bottom span")[i].text.include?("Holiday")
        event.name = doc.css("h3.flush--bottom span")[i].text
        event.date = doc.css("li.dateTime span.date")[i].text
        event.time = doc.css("li.dateTime span.time")[i].text
        event.location = doc.css("div.event-content dt.event-venuename a.no-color")[i].text
        event.address = doc.css("div.event-content dd.text--secondary")[i].text.split.join(" ").gsub(" (map)", "")
        event.url = doc.css("h3.flush--bottom a")[i].attr('href')
        events << event
        # events = [event] at this point in first loop
      end
    end
    # events = [all_events]
    events
  end
      
end