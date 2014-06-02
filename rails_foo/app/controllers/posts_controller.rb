class PostsController < ApplicationController
  protect_from_forgery :with => :null_session
  def create
    Post.create(:title => params[:title], :content => params[:content])
    Post.create(:title => params[:title], :content => params[:content])
    redirect_to root_url
  end
end
