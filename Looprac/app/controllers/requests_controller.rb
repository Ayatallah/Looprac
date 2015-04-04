class RequestsController < ApplicationController
	def index
		@requests=Request.where(:offerer_id => current_user.id)
		@landmarks=Landmark.all
		@requesters=Array.new
		@requests.each do |r|
			@user=User.find(r.offerer_id)
			@requesters.push(@user)
		end	
		#@requesters=User.where(:requester_id => )
	end	
end
