class CloudsController < ApplicationController
  def show
    @cloud = Cloud.find(params[:id])
    @comment = Comment.new
  end
end
