class Admin::UsersController < Admin::BaseController
  before_filter :authorize_approve!
  def index
    @users = User.all(:order => "email")
  end
end
