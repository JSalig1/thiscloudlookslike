class CloudsController < ApplicationController
  def show
    @cloud = Cloud.find(params[:format])
    @comment = Comment.new
  end
end
