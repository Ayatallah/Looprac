class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :comments
   has_many :posts
  acts_as_voter
  acts_as_messageable

  def mailboxer_email(object)
  email
end

 def name(object)
 	username
 end
end
