require 'rails_helper'

RSpec.describe "Create data request API endpoint" do
  it "returns data" do
    headers = {"Content-Type" => "text/json" }
    body = JSON.dump(
      data: {
        "return_url" => FakeEventRequester::Application.return_url
      }
    )

    post '/data_requests', params: body, headers: headers

    expect(response).to have_http_status(200)
  end
end
