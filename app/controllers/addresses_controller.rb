class AddressesController < ApplicationController
  before_filter :authorize_approve!, :only => [:create, :edit, :destroy]
  def create
    begin
      @profile = current_user.profile
      @addresses = @profile.address.build_addressable(params[:profile][:address])
      @addresses.user_id = current_user.id
      @addresses.save
      redirect_to @profile
      flash[:notice] = "Successfully created a comment."
    rescue ActiveRecord::RecordInvalid => invalid
      flash[:alert] = invalid.record.errors.first[1]
    end
  end
  def destroy
    @address = Address.find(params[:address_id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to @profile }
      format.json { head :no_content }
    end
  end
end
