class ApplicationController < ActionController::Base

  protect_from_forgery
  private
  def authorize_admin!
    authenticate_user!
    unless current_user.user_admin
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def authorize_approve!
    authenticate_user!
    unless current_user.approved
      flash[:alert] = "Please authenticate before continue..."
      redirect_to new_user_approfe_path
    end
  end
end
