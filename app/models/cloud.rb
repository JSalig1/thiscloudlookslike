class Cloud < ActiveRecord::Base
  has_many :comments, dependent: :destroy
end
