class PostsController < ApplicationController
  protect_from_forgery :with => :null_session
  def create
    Post.create(:title => params[:title], :content => params[:content])
    Post.create(:title => params[:title], :content => params[:content])
    render :text => Post.order("id DESC").limit(2).pluck(:uuid)
  end
end
