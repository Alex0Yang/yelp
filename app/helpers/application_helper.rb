module ApplicationHelper
  def options_for_business_rate(selected = nil)
   options_for_select( (1..5).map { |i| [pluralize(6-i, "Star"), 6-i] }, selected )
  end

  def time_format(time)
    time.strftime("%b %d, %Y")
  end
end
