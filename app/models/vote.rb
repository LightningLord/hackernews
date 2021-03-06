class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user
  validates_presence_of :value
  attr_accessible :value, :votable_type, :votable_id
end
