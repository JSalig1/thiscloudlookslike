class CloudsController < ApplicationController

  def index

    @comment = Comment.new
    
    respond_to do |format|
      format.html { render "clouds/index" }
      format.js
    end
  end 

  def ajax

    clouds = Cloud.all.select { |cloud| cloud.approved? }
    @cloud = clouds.sample

    respond_to do |format|
      format.json { render json: @cloud }
    end
  end

  def new
    @cloud = Cloud.new
  end

  def create
    @cloud = Cloud.create(cloud_params)
    redirect_to root_path
  end

  def show
    @cloud = Cloud.find(params[:id])
    @comment = Comment.new
  end

  private

  def cloud_params
    params.require(:cloud).permit(
      :image,
      :remote_image_url,
      :approval_staus
    )
  end
end
