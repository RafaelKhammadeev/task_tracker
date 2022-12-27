module SessionsHelper
  # Возвращает true, если пользователь вошел, иначе false.
  def logged_in?
    current_user.present?
  end

  def check_for_null(text)
    text.blank? ? nil : text
  end

  def check_name_output
    check_for_null(current_user['first_name']) || check_for_null(current_user['last_name']) || current_user['email']
  end
end
