module ApplicationHelper

  def bootstrap_class_for(name)
    {
        success: "alert-success",
        error: "alert-danger",
        danger: "alert-danger",
        alert: "alert-warning",
        notice: "alert-info",
    }[name.to_sym] || name
  end

  def check_user
    if user_signed_in? && (current_user.email == @project.author || current_user.admin?)
      return true
    else
      return false
    end
  end

end