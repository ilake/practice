class ResourcesController < ApplicationController
  def index
    render :json => {:msg => 'bar'}
  end
end
