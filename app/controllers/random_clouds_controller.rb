class RandomCloudsController < ApplicationController
  def show
    clouds = Cloud.all.select { |cloud| cloud.approved? }
    @cloud = clouds.sample
    @comment = Comment.new
    
    respond_to do |format|
      format.html { render "clouds/show" }
      format.js
    end
  end
end
