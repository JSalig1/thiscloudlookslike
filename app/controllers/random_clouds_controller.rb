class RandomCloudsController < ApplicationController
  def show
    clouds = Cloud.all.select { |cloud| cloud.approved? }
    cloud = clouds.sample
    redirect_to cloud_path(cloud)
  end
end
