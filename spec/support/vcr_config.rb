# spec/support/vcr_config.rb
VCR.configure do |c|
  # This directory will hold all of your recordings
  c.cassette_library_dir = 'spec/vcr'

  # Your HTTP request service. You can also use fakeweb, webmock, and more
  c.hook_into :webmock
  # If you only want VCR to handle requests made while a cassette is in use
  c.allow_http_connections_when_no_cassette = true
  # . VCR will ignore this request since it is made when there is no cassette [3]
end
