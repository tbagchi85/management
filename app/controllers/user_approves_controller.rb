class UserApprovesController < ApplicationController
  #skip_before_filter :authenticate_approve!
  before_filter :authenticate_user!
  def new

  end
  def create
    @user = User.find(current_user.id)
    if params
      if params[:user_approves][:key_id][0..2] == "STU"
        @student = Student.find_by_key_id(params[:user_approves][:key_id])
        if @student.key_token == params[:user_approves][:key_token]
          @user.approved = true
          #@user.student = true
          @student.approved = true
          @student.user_id = current_user.id
          if @user.save && @student.save
            @profile = Profile.new
            @profile.user_id = current_user.id
            @profile.save
            flash[:notice] = "Congrats! you have successfully authenticate."
            redirect_to root_path
          else
            redirect_to new_user_approfe_path
          end
        end
      end
    end
  end
  def index

  end
end
