class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


protected
  def authorize
    if User.all.nil?
      redirect_to new_user_path, notice: 'No admin user created!..Please create one before proceeding!'
    else
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
  end
end
