class MessagesController < ApplicationController
  include ActionController::Live

  def index
    gon.channel = '1'
  end

  def events
    response.headers["Content-Type"] = "text/event-stream"
    redis = Redis.new
    redis.psubscribe('messages.*') do |on|
      on.pmessage do |pattern, event, data|
        Rails.logger.info ("pattern #{pattern}, event #{event} data #{data}")
        response.stream.write("event: #{event}\n")
        response.stream.write("data: #{data}\n\n")
      end
    end
  rescue IOError
    logger.info "Stream closed"
  ensure
    redis.quit
    response.stream.close
  end
end
