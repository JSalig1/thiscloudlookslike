class Cloud < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  mount_uploader :upload_path, ImageUploader

  def approved?
    approval_status == true
  end
end
