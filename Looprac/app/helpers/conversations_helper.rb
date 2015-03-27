module ConversationsHelper
	def other_participants_helper(conversation)
       participants = conversation.participants
       participants.reject! do |participant|
          participant.username == current_user.username
       end
       participants
	end

	def names_other_participants_helper(conversation)
	  participants_names = ""
      other_participants = other_participants_helper(conversation)
      other_participants.each do |participant|
          participants_names << participant.username

          if other_participants.last != participant

          	 participants_names << " | "

          end
      end
      participants_names
	end
end
