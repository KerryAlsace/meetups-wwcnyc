class Meetups::EventScraper

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
        event.save
      end
    end
  end
  
end