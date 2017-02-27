class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session , if: Proc.new {|c|
    c.request.format.json? or c.request.format.xml?
  }
  before_action :authenticate_user
  def authenticate_user
    puts "--------------------------2"
   if session[:user_id].blank?
      redirect_to new_user_path
   end
  end
end
