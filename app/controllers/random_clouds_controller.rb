class RandomCloudsController < ApplicationController
  def show
    cloud = Cloud.all.sample
    redirect_to cloud_path(cloud)
  end
end
