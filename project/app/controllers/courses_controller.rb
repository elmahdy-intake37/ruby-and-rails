class CoursesController < InheritedResources::Base
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  # before_filter :authenticate_user!
  before_action :authenticate_user! , only: [:new,:create]

  load_and_authorize_resource

  def index
  @courses = Course.all()
  authorize! :index, @course


end

def new

  #  if current_user.is_instructor
  authorize! :create, @course if can? :create, @course

    @course = Course.new
  #  else
  #    redirect_to  courses_path
  #  end

end

def create

  # if !current_user.is_instructor
  #       redirect_to  courses_path
  #   end
  @course = Course.new(course_params)
  # @course.user_id = current_user.id


    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
end

  #   @course = Course.new(courses_params)
  #
  # @course.user_id = current_user.id
  # if @course.save
  #
  #  redirect_to courses_path
  # else
  #
  #   render 'new'
  end
  def show
end
#update
def update
  respond_to do |format|
    if @course.update(course_params)
      format.html { redirect_to @course, notice: 'Course was successfully updated.' }
      format.json { render :show, status: :ok, location: @course }
    else
      format.html { render :edit }
      format.json { render json: @course.errors, status: :unprocessable_entity }
    end
  end
end

#delete
def destroy
  @Course.destroy
  respond_to do |format|
    format.html { redirect_to course_url, notice: 'Course was successfully destroyed.' }
    format.json { head :no_content }
  end
end

end
  private

    def course_params
      params.require(:course).permit(:title, :image, :User_id)
    end

    #callback function
    def set_course

  begin
      @course = Course.find(params[:id])
      @user_name = @course.User.try(:name)
      rescue ActiveRecord::RecordNotFound
      flash[:notice] = 'check name of instructor who created or check ur data '

    redirect_to :controller => "courses", :action => "new"
  return

    end
  end


end
