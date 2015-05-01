class Search < ActiveRecord::Base
	belongs_to :source, class_name: 'Landmark'
	belongs_to :destination, class_name: 'Landmark'
end
