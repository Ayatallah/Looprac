class Report < ActiveRecord::Base
	validates :reporter, presence: true
	validates :reported, presence: true
	validates :reason, presence: true
end