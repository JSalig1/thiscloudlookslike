class CommentsController < ApplicationController
  def create

    post = params[:comment]

    ## validate cloud id
    cloud = Cloud.find_by id: post[:cloud_id], approval_status: 1
    head 403 if cloud.blank?

    # clean up the vote string a little
    body = post[:body].strip
    body.sub!(/^(a)|(the) /,'')

    # already voted?
    exist_comment = Comment.getByUser session.id, cloud.id

    if exist_comment.blank?
      comment = Comment.new cloud_id: cloud.id, count: 1, body: body, status: 1, user_id: session.id
      comment.save
    else
      exist_comment.body = body
      exist_comment.save
    end
    
    comments = Comment.getByCloud cloud.id

    respond_to do |format|
      format.json { render json: comments }
    end    
  end

  private

  def comment_params
    params.require(:comment).permit(:body,:cloud_id)
  end
end
