require 'rails_helper'

RSpec.describe "Create data request API endpoint" do
  it "returns data" do
    headers = {"Content-Type" => "text/json" }

    post '/data_requests', headers: headers

    expect(response).to have_http_status(200)
  end
end
