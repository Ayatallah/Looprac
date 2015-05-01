class LandmarksController < ApplicationController
	before_filter :ensure_admin!, except: [:show , :index , :create,:new]

	def index
		# @author Ayatallah
		#Index method is updates so that only landmarks approved by admin appear to users
		@landmarks = Landmark.where(accepted: true)
	end


	def show
		@landmark = Landmark.find(params[:id])
        @lmratings = Lmrating.where( landmark_id: @landmark.id)
        @lmrating= Lmrating.where( landmark_id: @landmark.id, user_id: current_user.id)
        if @lmratings.blank?
            @avg_lmrating = 0
        else
            @avg_lmrating = @lmratings.average(:rating).round(2)
        end

	end

	def new
		@landmark = Landmark.new
    end

	def edit
		@landmark = Landmark.find(params[:id])
	end

	#  @author : Ayatallah 
	#  The Following Method is used to list the Suggested Landmarks where accepted attribute
	#  is still false 
	
	def suggestions
		@landmarks = Landmark.where(accepted: false)
	end

	#  @author : Ayatallah 
	#  The Following Method is used to accept a suggested Landmark by updating accepted
	#  attribute to be true 
	
	def accept
		@landmark = Landmark.find(params[:id])
		@landmark.update(accepted: true)
		redirect_to landmarks_suggestions_path
	end

	#  @author : Ayatallah 
	#  The Following Method is used to Reject a suggested Landmark by deleting it from the
	#  database
	
	def reject
		@landmark = Landmark.find(params[:id])
		@landmark.destroy
		redirect_to landmarks_suggestions_path
	end

	def create
		@landmark = Landmark.new(landmark_params)
		if @landmark.save
			#  @author : Ayatallah 
			# 	The Following Check is used to set accepted attribute to true in case and admin created
			# 	new Landmark, and set it to false in case user suggests new Landmark
			
			if current_user.admin?
				@landmark.update(accepted: true)
				redirect_to @landmark
			else
				@landmark.update(accepted: false)
				redirect_to landmarks_path
				flash[:notice] = 'Suggestion Submitted Succesfully, an admin will review it shortly.'
			end	
		else
			render 'new'
		end
	end

	def update
		@landmark = Landmark.find(params[:id])
		if @landmark.update(landmark_params)
			redirect_to @landmark
		else
			render 'edit'
		end
	end

	def destroy
		@landmark = Landmark.find(params[:id])
		@landmark.destroy
		redirect_to landmarks_path
	end

   private
	def ensure_admin!
		unless current_user.admin?
		redirect_to root_path
		return false
		end
	end

	def landmark_params
		params.require(:landmark).permit(:name , :longitude , :latitude )
	end
end
