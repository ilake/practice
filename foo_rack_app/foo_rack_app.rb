require 'rack'

app = Proc.new do |env|
  file_server   = ::Rack::File.new('hello.html')

  file_server.call(env)
end

Rack::Handler::WEBrick.run app
# ruby foo_rack_app.rb
