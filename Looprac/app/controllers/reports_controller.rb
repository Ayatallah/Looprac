class ReportsController < ApplicationController
	def show
		@users = User.all
		render 'index'
	end

	def new
		@report = Report.new
	end

	def create
  		@report = Report.new(report_params)
  		if @report.save
    		render 'show'
  		else
    		render 'failure'
  		end
	end

	def report_params
		params.require(:report).permit(:reporter,:reported)
	end
end
