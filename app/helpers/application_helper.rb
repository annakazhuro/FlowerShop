module ApplicationHelper

  def cart_count_over_one
    if total_cart_items
      "<span class='tag is-dark'>#{total_cart_items}</span>".html_safe
    end
  end

  def total_cart_items
    total = @cart.line_items.map(&:quantity).sum
    total if total > 0
  end

  def bootstrap_class_for(name)
    {
        success: "alert-success",
        error: "alert-danger",
        danger: "alert-danger",
        alert: "alert-warning",
        notice: "alert-info"
    }[name.to_sym] || name
  end
end
