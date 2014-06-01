class HomeController < ApplicationController
  def index
    render :text => 'Hello World'
  end

  def restrict
    throw :restrict
  end
end
