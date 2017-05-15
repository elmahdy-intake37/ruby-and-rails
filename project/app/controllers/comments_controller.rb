class CommentsController < InheritedResources::Base
  before_action :set_comment
  # # before_filter :authenticate_user!
  # before_action :authenticate_user! , only: [:new,:create]
  before_action :comment_params
  # load_and_authorize_resource





  def index
  @comments = Comment.all()
  authorize! :index, @comment
  end


  def new
    authorize! :create, @comment if can? :create, @comment
    @comments = Comment.new


end

def create
@comment = @lecture.comments.create(params[:comment]).permit(:body)
@comment.User_id=current_user.id
@comment.save

if @comment.save
  redirect_to lecture_path(@lecture)
else
  render 'new'
end

  # @comment = Comment.new(:user_id => params[:id],:lecture_id => params[:parent],:content => params[:content])
  #      @comment.save()
  #
  #  params[:id] = @comment.id
  #
  # @lecture = Lecture.find(params[:lecture_id])
  # @comment = @lecture.comments.create(comment_params)
  # redirect_to lecture_path(@lecture)
  # respond_to do |format|

  end
  def show
  end
  #update

  def update
  respond_to do |format|
    if @comment.update(comment_params)
      format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
      format.json { render :show, status: :ok, location: @comment }
    else
      format.html { render :edit }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
  end

  def edit

  end

  #delete
  def destroy
  @comment.destroy
  redirect_to lecture_path(@lecture)
  # respond_to do |format|
  #   format.html { redirect_to course_url, notice: 'Comment was successfully destroyed.' }
  #   format.json { head :no_content }
  end
end



  private

    def comment_params
    @lecture= Lecture.find(params[:Lecture_id])
    #  params.require(:comment).permit(:body, :commenter, :Lecture_id, :user_id)
    end
    #callback function
    def set_comment

  # begin
      @comment = @lecture.comments.find(params[:Lecture_id])
  #     @user_name = @comment.User.try(:name)
  #     rescue ActiveRecord::RecordNotFound
  #     flash[:notice] = 'check name of instructor who created or check ur data '
  #
  #   redirect_to :controller => "comments", :action => "new"
  # return
  #
  #   end
  end


  # end
