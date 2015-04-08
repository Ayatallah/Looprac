class UseratingsController < ApplicationController
	before_action :set_user
	def new
		@userating = Userating.new
	end

	def create
		@userating = Userating.new(userating_params)
		@userating.rater = current_user
		@userating.rated = @user
		@points = @user.points
		if @userating.save

			@user.update(points: @points+ @userating.rating*10)
			if @user.level.blank? and @user.points<1000
				@user.update(level: "LooPrac Rookie")
			end
			if @user.points>=1000 and @points<1000
				@user.update(level: "LooPrac Enthusiast")
			else
				if @user.points>=2000 and @points<2000
					@user.update(level: "LooPrac's Emperor")
				else
					if @user.points>=3000 and @points<3000
						@user.update(level: "LooPrac's Chosen One")
					end
				end
			end
			
		redirect_to @user
		else
			render 'new'
		end
	end

	private

		def userating_params
			params.require(:userating).permit(:rating, :review)
		end

		def set_user
			@user = User.find(params[:user_id])
		end


	


end
