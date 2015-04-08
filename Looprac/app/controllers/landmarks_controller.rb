class LandmarksController < ApplicationController
	def index
		@landmarks = Landmark.all
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
end
