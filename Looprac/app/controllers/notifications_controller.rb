#@author: Zuishek
class NotificationsController < ApplicationController

	#Previews all the notifications with 10 notifications per page
	def index
		@notification = Notification.where(:userID => current_user.id).reverse
	end
    
end
