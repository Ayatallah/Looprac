module RequestsHelper
	# Calculates the number of requests that the user hasn't responded to yet
	# @author:Zuishek
	def pending_ride_requests_helper(user)
    Request.where(:offerer_id => user.id).where(:response => nil).count
    end
end
