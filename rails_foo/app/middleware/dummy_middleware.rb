class DummyMiddleware
  def initialize(app, message = "Response")
    @app = app
    @message = message
  end

  def call(env)
    Rails.logger.info('Request start------')
    @status, @headers, @response = @app.call(env)

    # We could get the response body, that should be some rack wrapper it.
    # assume it is ActionController::Response object
    # result = response.body

    # So when we insert the middleware in the first one ( config.middleware.insert_before 0, 'DummyMiddleware' ),
    # we could not get the response.body
    # result = response.each_with_object("") {|part, body| body << part}

    [@status, @headers, self]

    # [status, headers, [ "<!-- Response Time: ... -->\n", result, "\n<!-- This is content End -->" ]]
  end

  # The only method that Rack requires a response object to support is each
  # This makes our DummyMiddleware class a type of response
  # http://rack.rubyforge.org/doc/Rack/Response.html
  def each(&block)
    block.call("<!-- #{@message}: -->\n")# if @headers["Content-Type"].include? "text/html"
    @response.each(&block)
  end
end
