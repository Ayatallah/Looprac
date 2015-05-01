#@author: Zuishek
class NotificationsController < ApplicationController

	#Previews all the notifications with 10 notifications per page
	def index
		@notification = Notification.all.reverse
	end
    
end
