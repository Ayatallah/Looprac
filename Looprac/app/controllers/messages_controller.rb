class MessagesController < ApplicationController
	before_action :authenticate_user!

	def new
		@receiver = params[:userID]
	end

	def create
		recipients = User.find(params[:user_id])
		conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
		redirect_to conversation_path(conversation)
	end
end
