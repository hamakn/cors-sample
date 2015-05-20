require "bundler"
Bundler.require

require "./app"

# https://github.com/cyu/rack-cors
# TODO: prod only
use Rack::Cors do
  allow do
    origins 'localhost:5000'
    resource '/api/*',
      methods: [:get, :post, :options],
      headers: :any,
      credentials: true,
      max_age: 86400
  end
end

map "/assets" do
  run App.sprockets
end

map "/" do
  run App
end
