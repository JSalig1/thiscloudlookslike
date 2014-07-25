class CommentsController < ApplicationController
  def create
    @cloud = Cloud.find(params[:cloud_id])
    comment = @cloud.comments.create(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
