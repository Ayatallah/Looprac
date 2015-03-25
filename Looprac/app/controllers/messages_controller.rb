class MessagesController < ApplicationController
	before_action :authenticate_user!

	def new
	end

	def create
		recipients = User.where(email: params['recipients'])
		conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
		redirect_to conversation_path(conversation)
	end
end
