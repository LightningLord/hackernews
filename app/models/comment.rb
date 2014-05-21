class Comment < ActiveRecord::Base
  attr_accessible :content
  validates_presence_of :content
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable
end
