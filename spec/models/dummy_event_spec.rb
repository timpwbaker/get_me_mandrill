require "spec_helper"
require_relative "../../app/models/dummy_event.rb"

RSpec.describe DummyEvent, ".build_json" do
  it "returns a json blob containing the dummy data" do
    dummy_event_json = DummyEvent.build_json

    expect(dummy_event_json[:Address]).not_to be nil
    expect(dummy_event_json[:EmailType]).not_to be nil
    expect(dummy_event_json[:Event]).not_to be nil
    expect(dummy_event_json[:Timestamp]).not_to be nil
  end
end
