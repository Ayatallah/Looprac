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
    		redirect_to	'/reports/index'
  		else
    		render 'failure'
  		end
	end

	def report_params
		params.require(:report).permit(:reported, :reason)
	end
end
