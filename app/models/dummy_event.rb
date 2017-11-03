require 'time'

class DummyEvent
  def self.build_json
    new.payload.to_json
  end

  def payload
    {
      "Address": email_address,
      "EmailType": email_type,
      "Event": event,
      "Timestamp": timestamp
    }
  end

  def email_address
    emails.shuffle.first
  end

  def email_type
    email_types.shuffle.first
  end

  def event
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

  def timestamp
    now = Time.now
    (now - Random.rand(100000)).to_i
  end



  def email_types
    ["Order",
     "UserConfirmation",
     "Shipment",
     "ReferAFriend"]
  end


  def emails
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
