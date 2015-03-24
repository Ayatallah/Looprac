class ReportsController < ApplicationController

	def show
		@users = User.all
		@report = Report.new
		render 'index'
	end

	def create
  		@report = Report.new(report_params)
  		@report.reporter = current_user.username
  		if @report.save
  			flash[:notice] = 'User Reported Successfuly!'
    		redirect_to	'/reports/index'
  		else
    		flash[:alert] = 'User could not be reported!'
    		redirect_to	'/reports/index'
  		end
	end

	def report_params
		params.require(:report).permit(:reported, :reason)
	end
end
