class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
    if (params[:search])
      @courses = Course.all.where("name COLLATE UTF8_GENERAL_CI LIKE ? OR teacher COLLATE UTF8_GENERAL_CI LIKE ?", "%#{params[:search]}%","%#{params[:search]}%" ).order(:name)
    elsif params[:sort] == 'subj'
      @courses = Course.all.sort_by {|c| [c.subject, c.name]}     
    else
      @courses = Course.all.order(:name)
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
        redirect_to @course, notice: "Course Successfully Added"
      else
        render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
      @course = Course.find(params[:id])
      if @course.update(course_params)
        redirect_to @course, notice: 'Course Successfully Updated'
      else
        render 'edit'
      end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy unless @course.nil?
    redirect_to books_path
  end

  private

  def course_params
    params[:course].permit(:name, :teacher, :subject)
  end
end
