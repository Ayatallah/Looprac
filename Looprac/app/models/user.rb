class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :gender, presence: true
   
   has_many :comments
   has_many :posts
   has_many :user_as_owner, :class_name => 'Ride', :foreign_key => 'user_id'
   has_many :user_as_offerer, :class_name => 'Request', :foreign_key => 'offerer_id'
   has_many :user_as_requester, :class_name => 'Request', :foreign_key => 'Requester_id'
   has_many :useratings, foreign_key: "rated_id", dependent: :destroy
   has_many :useratings, foreign_key: "rater_id", dependent: :destroy
  acts_as_voter
end
