module NotificationsHelper
	#@author:Zuishek
	# formats a message from the request, getting the name of the offerer and the respone whether accepted or rejected
	def get_message_from_request(requestID, response)
       offererName = User.find(Request.find(requestID).offerer_id).username
       acceptance = if response then "accepted" else "rejected" end
       message = "#{offererName} has #{acceptance} your request"
	end

	def create_notification(requestID,response)
		@message = get_message_from_request(requestID,response)
		@notification = Notification.new(:message => @message)
		@notification.save
	end
end
