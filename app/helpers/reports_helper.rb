module ReportsHelper
  def render_reportable(report)
    if report.class == PositionReport
      render "position_report", position_report: report
    else
      render "pitcher_report", pitcher_report: report
    end
  end
end
