class Request < ActiveRecord::Base
	validates :offerer, presence: true
	validates :ride, presence: true
	validates :requester, presence: true
end
