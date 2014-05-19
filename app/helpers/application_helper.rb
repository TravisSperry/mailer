module ApplicationHelper
  def flash_class(type)
    case type.to_sym
    when :alert
      "warning"
    when :error
      "danger"
    when :notice
      "success"
    else
      ""
    end
  end
end
