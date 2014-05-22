class Comment < ActiveRecord::Base
  include Votable
  attr_accessible :content, :vote_count
  validates_presence_of :content
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable
end
