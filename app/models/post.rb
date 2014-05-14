class Post < ActiveRecord::Base
  attr_accessible :title, :content
  belongs_to :user
  has_many :comments

  validates_presence_of :title, :content, :user
end
