module NotificationsHelper
	#@author:Zuishek
	
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
