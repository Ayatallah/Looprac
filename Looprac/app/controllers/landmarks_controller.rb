class LandmarksController < ApplicationController
before_filter :ensure_admin!, except: [ :show , :index ] 
  

	def new
		@landmark = Landmark.new
	end

	def show
		@landmark = Landmark.find(params[:id])
	end

	def index
		@landmarks = Landmark.all
	end

	def edit
		@landmark = Landmark.find(params[:id])
	end

	def create
  		@landmark = Landmark.new(landmark_params)
       if @landmark.save
    		redirect_to @landmark
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
