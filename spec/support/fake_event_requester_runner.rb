FakeEventRequesterRunner =
  Capybara::Discoball::Runner.new(FakeEventRequester::Application) do |server|
    FakeEventRequester::Application.return_url = "http://#{server.host}:#{server.port}/events"
  end

