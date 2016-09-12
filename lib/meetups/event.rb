class Meetups::Event
  attr_accessor :name, :date, :time, :location, :address, :url

  @@events = []

  def save
    @@events << self
  end

  def self.all
    @@events
  end

  def self.destroy
    @@events = []
  end

end
