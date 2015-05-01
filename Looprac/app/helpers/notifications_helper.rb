module NotificationsHelper
	#@author:Zuishek
	# formats a message from the request, getting the name of the offerer and the respone whether accepted or rejected
	def get_message_from_request(requestID, response)
       offererName = User.find(Request.find(requestID).offerer_id).username
       acceptance = if response then "accepted" else "rejected" end
       message = "#{offererName} has #{acceptance} your request"
	end
    # Creates a new notification 
	def create_notification(requestID,response,user)
		@message = get_message_from_request(requestID,response)
		@notification = Notification.new(:message => @message, :userID => user)
		@notification.save
	end

	#Changes the notification to viewed
	def viewed(notificationID,user)
        @notification = Notification.find(notificationID)
        @notification.viewed = true
        @notification.save
	end

	#returns number of unviewed notifications
	def number_of_unviewed_notifications(user)
       Notification.where(:userID => user.id).where(:viewed => false).count
	end
end
