require "sinatra"

module FakeEventRequester
  class Application < Sinatra::Base
    require 'json'

    cattr_accessor :return_url

    post "/events" do
      json_response 200, ""
    end 

    def json_response(response_code, body)
      content_type :json
      {status: response_code, body: body}.to_json
    end
  end
end
