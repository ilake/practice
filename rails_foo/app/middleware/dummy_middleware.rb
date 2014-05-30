class DummyMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    Rails.logger.info('Request start------')
    @app.call(env)
    Rails.logger.info('Request End------')
  end
end
