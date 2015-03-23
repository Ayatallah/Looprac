class Report < ActiveRecord::Base
	validates :reporter, presence: true
	validates :reported, presence: true
end