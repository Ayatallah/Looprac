class RidesController < ApplicationController

	def index
	end

	def show
		@landmark = Landmark.all
		@ride = Ride.new
		render 'index'
	end

end
