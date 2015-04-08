class Userating < ActiveRecord::Base
	belongs_to :rater, class_name: "User"
	belongs_to :rated, class_name: "User"
	validates :rating, :presence => true
end
