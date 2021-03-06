class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_secure_password
  validates_presence_of :name
  has_many :votes
  def self.create(params)
    user = User.new
    user.name = params[:name]
    user.password = params[:password]
    user.password_confirmation = params[:password]
    user
  end
end
