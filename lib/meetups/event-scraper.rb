class Meetups::EventScraper

  def self.scrape_meetups
    # Scrape WWCNYC meetups page and add events and their details to @events array
    doc = Nokogiri::HTML(open("https://www.meetup.com/WomenWhoCodeNYC/"))
    binding.pry
    description = doc.css("div.event-content div.event-desc").text
    description.each.with_index do |desc, i|
      if !desc.include?("Place holder")
        puts "#{i} is not a placeholder"
      end
    #   first_level = doc.css("ul.event-list li.event-item").to_a
    #   new_array = []
    #   first_level.each do |event|
    #     if !first_level.include?("past")
    #       new_array << event
    #     end
    #   end
    #
    # new_array.each.with_index do |event, i|
    #   if !(doc.css("div.event-content div.event-desc").text.include?("Place holder"))
    #     puts "#{i} is not a placeholder"
    #   end
    #   i
    # end
    # if !first_level.include?("past") && !placeholders
    #   event = Meetups::Event.new
    #   event.name = doc.css("h3.flush--bottom span")[i].text
    #   event.date = doc.css("li.dateTime span.date")[i].text
    #   event.time = doc.css("li.dateTime span.time")[i].text
    #   if doc.css("div.event-content dt.event-venuename")[i].inspect.include?("no-color")
    #     event.location = doc.css("div.event-content dt.event-venuename a.no-color")[i].text
    #     event.address = doc.css("div.event-content dd.text--secondary")[i].text.split.join(" ").gsub(" (map)", "")
    #   else
    #     event.location = doc.css("div.event-content dt.event-venuename")[i].text.gsub("\t", "").gsub("\n", "")
    #     event.address = doc.css("div.event-content dl.event-where dd")[i].text.gsub("\t", "").gsub("\n", "")
    #   end
    #   event.url = doc.css("h3.flush--bottom a")[i].attr('href')
    #   event.save
    end
  end

end
