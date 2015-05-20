require "sinatra"
require "sprockets/helpers"
require "haml"
require "dotenv"
require "json"

class App < Sinatra::Base
  set :sprockets, Sprockets::Environment.new
  helpers Sprockets::Helpers

  configure do
    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.prefix = "/assets"
      config.digest = true
    end
    sprockets.append_path "assets/javascripts"
    sprockets.append_path "assets/stylesheets"
    sprockets.js_compressor = :uglifier if ENV["RACK_ENV"] == "production"
  end

  before "/*.json" do
    content_type "application/json"
  end

  get "/" do
    haml :index
  end

  get "/echo" do
    haml :echo
  end

  post "/api/echo.json" do
    params.to_json
  end
end
