class Cloud < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  def approved?
    approval_status == true
  end
end
