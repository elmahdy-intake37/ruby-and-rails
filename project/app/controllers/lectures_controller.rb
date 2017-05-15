class LecturesController < InheritedResources::Base
  # before_action :set_lecture, only: [:show, :edit, :update, :destroy, :upvote ,:downvote]
  # before_action :authenticate_user!
  before_action :authenticate_user! , only: [:new,:create,:update,:edit,:like,:unlike,:upvote,:downvote]
  before_action :set_lecture, only: [:show, :edit, :update, :destroy,:show_course_lectures,:upvote,:downvote]
  load_and_authorize_resource
  def index
   @lecture = Lecture.all
   authorize! :index, @lecture
 end

 def new

   #  if current_user.is_instructor
   authorize! :create, @lecture if can? :create, @lecture

     @lecture = Lecture.new
   #  else
   #    redirect_to  courses_path
   #  end

 end

 def create

   @lecture= Lecture.new(lecture_params)
  #  @lecture = current_user.lectures.build(params[:lecture])
   respond_to do |format|
       if @lecture.save
         format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
         format.json { render :show, status: :created, location: @lecture }
       else
         format.html { render :new }
         format.json { render json: @lecture.errors, status: :unprocessable_entity }
  end
end
   def show
    #  lecture_id = params[:lecture_id]
   @lecture =Lecture.find_by(:id => lecture_id)
   @comments = Comment.where(Lecture_id: @lecture).order("created_at DESC").first

 end
 #update
 def update
   @lecture = Lecture.find_by(:id => params[:id])

   respond_to do |format|
     if @lecture.update(lecture_params)
       format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
       format.json { render :show, status: :ok, location: @lecture }
     else
       format.html { render :edit }
       format.json { render json: @lecture.errors, status: :unprocessable_entity }
     end
   end
 end
  def edit
    @lecture.course_id = params[:Course_id]
    # @lecture =Lecture.find_by(:id => params[:id])
    authorize! :edit, @lecture

  end


 def show_course_lectures

  course.id = params[:Course_id]
  @course_title = Course.find_by(:id => course_id).title
  @lectures = Lecture.where(:Course_id => Course_id)
end

 #delete
 def destroy
   @lecture.destroy
   respond_to do |format|
     format.html { redirect_to lecture_url, notice: 'Lecture was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 end


 def upvote
   @lecture = Lecture.find(params[:id])
   @lecture.upvote_by current_user
   redirect_to :back

 end

 def downvote
   @lecture = Lecture.find(params[:id])
   @lecture.downvote_by current_user
   redirect_to :back
 end

  private

    def lecture_params
      params.require(:lecture).permit(:title,:content,:attachment, :User_id, :Course_id,:name,:image)
    end
    def set_lecture
      begin

      @lecture = Lecture.find(params[:id])
      @user_name = @lecture.User.try(:name)
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = 'no lecture found'

      redirect_to :controller => "lectures", :action => "new"
    return
    end
  end

end
