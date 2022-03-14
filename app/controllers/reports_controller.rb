class ReportsController < ApplicationController
  def index
    @reports = Report.all.order(updated_at: :desc)
  end

  def show
    @report = Report.find(params[:id])
  end
end
