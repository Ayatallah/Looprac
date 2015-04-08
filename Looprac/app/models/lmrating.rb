class Lmrating < ActiveRecord::Base
	belongs_to :user
	belongs_to :landmark
	validates :rating, :presence => true
end
