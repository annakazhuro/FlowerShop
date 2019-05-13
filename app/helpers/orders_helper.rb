module OrdersHelper
  def default_user_name
    current_user.present? ? current_user.name : ''
  end

  def default_phone
    current_user.present? ? current_user.phone : ''
  end

  def default_email
    current_user.present? ? current_user.email : ''
  end
end
