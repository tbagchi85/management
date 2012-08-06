class ProfilesController < ApplicationController
  before_filter :authorize_approve!
  before_filter :find_user

  def edit
    @profile = @user.profile
  end

  def update
    @profile = @user.profile
    respond_to do |format|
      if @profile.update_attributes(params[:profile])

          @address = Address.new()
          @address.street_1 = "Bally howrah"
          @address.save


        format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @profile = current_user.profile
  end

  protected
  def find_user
    @user = User.find(current_user)
  end
end
