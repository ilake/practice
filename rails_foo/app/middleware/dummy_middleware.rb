class DummyMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    Rails.logger.info('Request start------')
    status, headers, response = @app.call(env)

    # We could get the response body, that should be some rack wrapper it.
    # result = response.body

    # So when we insert the middleware in the first one ( config.middleware.insert_before 0, 'DummyMiddleware' ),
    # we could not get the response.body
    result = response.each_with_object("") {|part, body| body << part}


    [status, headers, [ "<!-- Response Time: ... -->\n", result, "\n<!-- This is content End -->" ]]
  end
end
