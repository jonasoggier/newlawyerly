class User < ActiveRecord::Base
  
  authenticates_with_sorcery!

  attr_accessible :first_name, :last_name, :email, :teaser, :description, :password, :password_confirmation, :profile_picture

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :notifications, :dependent => :destroy

  has_many :relationships
  has_many :followed_users, :through => :relationships
  has_many :inverse_relationships, :class_name => "Relationship", :foreign_key => "followed_user_id"
  has_many :inverse_followed_users, :through => :inverse_relationships, :source => :user

  mount_uploader :profile_picture, ProfilePictureUploader

  validates_length_of :password, :minimum => 5, :flash => "Password must be at least 5 characters long", :if => :password
  validates_confirmation_of :password, :flash => "Password should match confirmation", :if => :password
  validates :email, :presence => true, :uniqueness => true

  include PgSearch
  multisearchable :against => [:first_name, :last_name]

  def feed
    Post.from_users_followed_by(self) 
  end

end