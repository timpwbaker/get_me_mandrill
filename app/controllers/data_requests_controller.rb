class DataRequestsController < ApplicationController
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
      uri = URI.parse("http://localhost:3000/events")
      headers = {"Content-Type" => "text/json" }
      params = DummyEvent.build_json.to_s
      
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.body = params

      http.request(request)
    }
  end

end
