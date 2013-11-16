class Post < ActiveRecord::Base
  attr_accessible :title, :header, :body
  scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }

  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :title, :body, :presence => true

def previous
  Post.previous(self.id).first
end

end
