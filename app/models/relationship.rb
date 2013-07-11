class Relationship < ActiveRecord::Base
  attr_accessible :followed_user_id, :user_id

  belongs_to :user
  belongs_to :followed_user, :class_name => 'User'

  validates_uniqueness_of :user_id, :scope => :followed_user_id # ensures that same relationship is only saved once

end
