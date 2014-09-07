class TestingController < ApplicationController
  def send_cors_request
    app_js = File.join(Rails.root, 'app', 'assets', 'javascripts', 'application.js')
    @content = File.read(app_js)
  end
end
