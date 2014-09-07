Rails.application.routes.draw do
  get '/send_cors_request' => 'testing#send_cors_request'
end
