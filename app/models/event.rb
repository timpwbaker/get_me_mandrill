class Event < ActiveResource::Base
  self.site = ENV.fetch("RETURN_EVENTS_URL")

  def self.build_event
    new(dummy_data)
  end

  def self.dummy_data
    { "Address": email_address, "EmailType": email_type, "Event": event, "Timestamp": timestamp }
  end

  def self.email_address
    emails.shuffle.first
  end

  def self.email_type
    email_types.shuffle.first
  end

  def self.event
    n = Random.rand(100)
    case n
    when 1..60
      "send"
    when 61..90
      "open"
    when 91..100
      "click"
    end
  end

  def self.timestamp
    Time.now.to_i
  end

  def self.email_types
    ["Order",
     "UserConfirmation",
     "Shipment",
     "ReferAFriend"]
  end

  def self.emails
    ["alex@foobar.baz",
     "barney@foobar.baz",
     "callum@foobar.baz",
     "f@foobar.baz",
     "jacob@foobar.baz",
     "jesse@foobar.baz",
     "josh@foobar.baz",
     "oz@foobar.baz",
     "patrick@foobar.baz",
     "pete@foobar.baz",
     "rehat@foobar.baz",
     "simon@foobar.baz",
     "simonf@foobar.baz",
     "tal@foobar.baz",
     "tom@foobar.baz",
     "tony@foobar.baz",
     "vitor@foobar.baz"]
  end
end
