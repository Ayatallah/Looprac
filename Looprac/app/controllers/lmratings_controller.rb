class LmratingsController < ApplicationController
	before_action :set_landmark

	def new
		@lmrating = Lmrating.new
    end


    def create
    	@lmrating = Lmrating.new(lmrating_params)
    	@lmrating.user = current_user
    	@lmrating.landmark = @landmark
    	if @lmrating.save
    	redirect_to @landmark
        else
    	render 'new'
        end
    end




	private 
     def lmrating_params
     	params.require(:lmrating).permit(:rating)
     end
     def set_landmark
     	@landmark = Landmark.find(params[:landmark_id])
     end
end
