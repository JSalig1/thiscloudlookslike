class RandomCloudsController < ApplicationController
  def show
    clouds = Cloud.all.select { |cloud| cloud.approved? }
    @cloud = clouds.sample
    @comment = Comment.new
    render "clouds/show"
  end
end
