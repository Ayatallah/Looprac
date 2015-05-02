class SearchesController < ApplicationController

	before_filter :authenticate_user!

	def new
		@search = Search.new
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		@users = User.all
		@user_requests=Request.where(:requester_id => current_user.id).pluck(:ride_id)
	end

	private

		def search_params
			params.require(:search).permit(:source_id, :destination_id, :seatnum, :price, :gender, :ac, :food, :pets, :smoking, :music, :datetime)
		end

end
