class ReportsController < ApplicationController
	load_and_authorize_resource

  def index
    @reports = Report.all.reverse
  end


  def new
  	@report = Report.new(book_id: params[:book_id], user_id: current_user.id)
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      Mailrobot.admin_report(@report).deliver
      redirect_to @report.book, notice: "Succesfully made report!"

    else
      render 'new', notice: "Error. Cannot make report."
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy unless @report.nil?
    redirect_to reports_path
  end

private
  def report_params
    params[:report].permit(:text, :user_id, :book_id)
  end
end
