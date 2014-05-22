class Post < ActiveRecord::Base
  include Votable
  attr_accessible :title, :content, :vote_count
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable
  validates_presence_of :title, :content, :user
end
