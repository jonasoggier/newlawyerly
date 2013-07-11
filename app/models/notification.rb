class Notification < ActiveRecord::Base
  
  attr_accessible :user_id, :follower_id, :commenter_id, :post_id

  belongs_to :user

end
