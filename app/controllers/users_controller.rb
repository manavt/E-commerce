class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create, :sign_in, :allow_login]
  include DownloadFile
  def index
    name = params[:name]
    @user = User.where(name: name.gsub!("+", ' '))
  end

  def new
    @user = User.new
    @user.build_image
  end
  def my_name
    @user = User.find params[:id]
  end
  def create
    @user = User.new(user_params)
    if @user.save(validate: false)
      SendEmailsMailer.welcome(@user).deliver_now!
      # below session will get use only once when new user is coming so he can see the
       # the products index page
      session[:user_id] = @user.id
       redirect_to products_path
       flash[:notice] = "Successfully registered and logged in"
     else
       render :new
    end
  end
  def allow_login
    @user = User.where(email: params[:email], password: params[:password] )
    if not @user.blank?
        session[:user_id] = @user.last.id
        redirect_to products_path
        flash[:notice] = "Successfully logged in"
      else
        redirect_to new_user_path
        flash[:notice] = "Opps something went wrong"
    end
  end
  def show
    @user = User.find params[:id]
  end

  def edit
  end
  def logout
    session[:user_id] = nil
    redirect_to new_user_path
  end
  private
  def user_params
    params.require(:user).permit!
  end
end
