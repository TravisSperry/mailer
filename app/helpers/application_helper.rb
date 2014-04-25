module ApplicationHelper
  def flash_class(type)
    case type
    when :alert
      "warning"
    when :error
      "warning"
    when :notice
      "success"
    else
      ""
    end
  end
end
