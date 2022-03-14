class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update]

  def index
    @reports = Report.all.order(updated_at: :desc)
  end

  def show
  end

  def new
    if params[:type] == "position"
      @report = Report.new(reportable: PositionReport.new)
    else
      @report = Report.new(reportable: PitcherReport.new)
      @report.reportable&.pitches&.build
    end
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:success] = "Report was created."
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @report.update(report_params)
      flash[:success] = "Report updated successfully."
      redirect_to root_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.require(:report).permit(:reportable_type, :player_id, :scout_id, :summary,
      reportable_attributes: [:id, :position, :batting_grade, :running_time, :role,
      pitches_attributes: [:id, :pitch_type, :velocity_high, :velocity_low, :_destroy]])
  end

  def set_report
    @report = Report.find(params[:id])
  end
end
