class Meetups::EventScraper

  def self.scrape_meetups
    # Scrape WWCNYC meetups page and add events and their details to @events array
    doc = Nokogiri::HTML(open("https://www.meetup.com/WomenWhoCodeNYC/"))
    first_level = doc.css("div#events-list-module ul.event-list li.event-item").to_a
    unless first_level.include?("past")
      first_level.each.with_index do |event, i|
        unless doc.css("div.event-content div.event-desc")[i].text.include?("Place holder")
          event = Meetups::Event.new
          event.name = doc.css("h3.flush--bottom span")[i].text
          event.date = doc.css("li.dateTime span.date")[i].text
          event.time = doc.css("li.dateTime span.time")[i].text
          if doc.css("div.event-content dt.event-venuename")[i].inspect.include?("no-color")
            event.location = doc.css("div.event-content dt.event-venuename a.no-color")[i].text
            event.address = doc.css("div.event-content dd.text--secondary")[i].text.split.join(" ").gsub(" (map)", "")
          else
            event.location = doc.css("div.event-content dt.event-venuename")[i].text.gsub("\t", "").gsub("\n", "")
            event.address = doc.css("div.event-content dl.event-where dd")[i].text.gsub("\t", "").gsub("\n", "")
          end
          event.url = doc.css("h3.flush--bottom a")[i].attr('href')
          event.save
        end
      end
    end
  end

end
