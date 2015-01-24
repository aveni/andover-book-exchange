class CoursesController < ApplicationController
  def index
    @couses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
        redirect_to courses_path, notice: "textbook successfully added"
      else
        render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
      @course = Course.find(params[:id])
      if @course.update(book_params)
        redirect_to @course, notice: 'textbook successfully added'
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
