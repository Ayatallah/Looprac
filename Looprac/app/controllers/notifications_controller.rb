#@author: Zuishek
class NotificationsController < ApplicationController

	#Previews all the notifications with 10 notifications per page
	def index
		@notification = Notification.all.reverse.paginate(page: params[:page], per_page: 10)
	end
    

   
	

	private 
	def notification_params
		params.require(:notification).permit(:message)
	end
end
