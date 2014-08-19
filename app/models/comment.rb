class Comment < ActiveRecord::Base
  belongs_to :cloud

  def self.getByUser( user_id, cloud_id )
    return Comment.find_by cloud_id: cloud_id, status: 1, user_id: user_id
  end

  def self.getByCloud( cloud_id )
    comments = Array.new
    Comment
      .select( :id , :cloud_id , :body , 'COUNT(*) AS count' )
      .where( cloud_id: cloud_id, status: 1 )
      .group(:body)
      .each{ |comment|
        comments.push comment.attributes
      }

    return comments
  end
end
