class DummyMiddleware
  def initialize(app, message = "Response")
    @app = app
    @message = message
  end

  def call(env)
    Rails.logger.info('Request start------')
    start_time = Time.now
    status, headers, response = catch(:restrict) do
      @app.call(env)
    end
    end_time = Time.now

    if status.nil?
      RestrictController.call(env)
    else
      # We could get the response body, that should be some rack wrapper it.
      # assume it is ActionController::Response object
      # result = response.body

      # [status, headers, response]
      [status, headers, Body.new(headers, response, @message, start_time, end_time)]
    end

  end

  # That does make things easier to test and elegantly handles the thread-safety issue
  class Body
    def initialize(headers, response, message, start_time, end_time)
      @response = response
      @start_time = start_time
      @end_time = end_time
      @message = message
      @headers = headers
    end
    # The only method that Rack requires a response object to support is each
    # This makes our DummyMiddleware class a type of response
    # http://rack.rubyforge.org/doc/Rack/Response.html
    def each(&block)
      block.call("<!-- #{@message}: #{@end_time - @start_time}-->\n") if @headers["Content-Type"].include? "text/html"
      @response.each(&block)
    end
  end
end
