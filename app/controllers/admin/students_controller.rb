class Admin::StudentsController < Admin::BaseController
  before_filter :find_admin
  def new
    @student = Student.new
  end
  def create
    i = params[:student][:count].to_i
    j = 1
    while j <= i
      @student = Student.new
      @student.standard = params[:student][:standard]
      @student.section = params[:student][:section]
      @student.count = params[:student][:count]
      @student.key_id =  "STU" + Time.now.strftime("%y").to_s + params[:student][:standard].to_s + params[:student][:section].to_s + j.to_s
      @student.key_token = rand(999999)
      j += 1
      @student.save
    end
    redirect_to admin_students_path
  end
  def index
    @students = Student.order('created_at desc').page(params[:page]).per(2)
  end
  def show

  end
  protected
  def find_admin
    @admin = User.find(current_user.id)
  end
end
