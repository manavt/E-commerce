module ApplicationHelper
  def product_count
   count = Product.count
  end
  def current_user
     if session[:user_id].present?
       user = User.find session[:user_id]
     end
  end
end
