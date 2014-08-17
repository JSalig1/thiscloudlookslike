class CommentsController < ApplicationController
  def create

    post = params[:comment]

    ## validate cloud id
    cloud = Cloud.find_by id: post[:cloud_id], approval_status: 1
    head 403 if cloud.blank?

    exist_comment = Comment.find_by cloud_id: cloud.id, body: post[:body], status: 1

    if exist_comment.blank?
      comment = Comment.new cloud_id: cloud.id, body: post[:body], count: 1, status: 1
      comment.save
    else
      exist_comment.count += 1
      exist_comment.save
    end

    relation = Comment.where cloud_id: cloud.id, status: 1
    comments = Array.new
    relation.each{ |comment|
      comments.push comment
    }

    respond_to do |format|
      format.json { render json: comments }
    end    
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:cloud_id)
  end
end
