class Post < ActiveRecord::Base
  attr_accessible :body, :title

  belongs_to :user
  has_many :comments, :dependent => :destroy

  default_scope order: 'posts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_user_id FROM relationships
                         WHERE user_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end

end
