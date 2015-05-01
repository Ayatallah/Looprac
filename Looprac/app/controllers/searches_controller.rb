class SearchesController < ApplicationController

	def new
		@search = Search.new
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private

		def search_params
			params.require(:search).permit(:source_id, :destination_id, :seatnum, :price, :gender, :ac, :food, :pets, :smoking, :music, :datetime)
		end

end
