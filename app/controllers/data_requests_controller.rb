class DataRequestsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  require "uri"
  require "net/http"

  def create
    data_request = DataRequest.new(requester_attributes)
    if data_request.save
      send_back_events
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def requester_attributes
    { ip: request.remote_ip }
  end

  def send_back_events
    10.times {
      Event.build_event.save
      sleep(1)
    }
  end
end
