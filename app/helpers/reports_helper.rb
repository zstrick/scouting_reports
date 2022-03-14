module ReportsHelper
  def render_reportable(report)
    if report.class == PositionReport
      render "position_report", position_report: report
    else
      render "pitcher_report", pitcher_report: report
    end
  end

  def render_reportable_form(report, form)
    if report.reportable_type == "PositionReport"
      render "position_form", form: form
    else
      render "pitcher_form", form: form
    end
  end
end
