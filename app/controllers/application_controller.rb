class ApplicationController < ActionController::Base
  def authenticate_admin_user!
    authenticate_user!
    redirect_to root_path unless current_user.has_role?(:admin)
  end
end
