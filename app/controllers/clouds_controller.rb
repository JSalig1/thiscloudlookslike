class CloudsController < ApplicationController
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
