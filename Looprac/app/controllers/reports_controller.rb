class ReportsController < ApplicationController

	def show
		@report = Report.new
		@reported = User.find_by_id(params[:id]).username
	end

	def create
  		@report = Report.new(report_params)
  		@report.reporter = current_user.username
  		if @report.save
  			flash[:notice] = 'User Reported Successfuly!'
    		redirect_to	user_path((User.find_by_username(report_params[:reported])).id)
  		else
    		flash[:alert] = 'User could not be reported!'
    		redirect_to	report_path((User.find_by_username(report_params[:reported])).id)
  		end
	end

	def getUsers
		@users = User.all
		@requests = Request.find_by_requester_id(current_user.id)
	end

	def report_params
		params.require(:report).permit(:reported, :reason)
	end
end
