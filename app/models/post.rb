class Post < ActiveRecord::Base
  attr_accessible :title, :header, :body

  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :title, :body, :presence => true

  
end
