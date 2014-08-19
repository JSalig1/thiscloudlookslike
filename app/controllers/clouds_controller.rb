class CloudsController < ApplicationController

  def index

    require 'json'

    @comment = Comment.new
    @comments_json = "null";

    # already voted? load up comments
    if !session.id.blank? and !session[:cloud_id].blank?
      exist_comment = Comment.getByUser session.id, session[:cloud_id]   
      if !exist_comment.blank?
        comments = Comment.getByCloud exist_comment.cloud_id
        if comments.count > 0 
          @comments_json = JSON.generate comments, quirks_mode: true
        end
      end
    end
    
    respond_to do |format|
      format.html { render "clouds/index" }
      format.js
    end
  end 

  def ajax

    clouds = Cloud.all.select { |cloud| cloud.approved? }
    @cloud = clouds.sample

    session[:cloud_id] = @cloud.id

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
