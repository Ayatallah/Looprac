class MessagesController < ApplicationController
	before_action :authenticate_user!
    #@author: Zuishek
    # new method fetches the id of the owner of the ride and puts it in a variable called @receiver so the new message view can know the id of the owner
	def new
		@receiver = params[:userID]
	end

	def create
		recipients = User.find(params[:user_id])
		conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
		redirect_to conversation_path(conversation)
	end
end
