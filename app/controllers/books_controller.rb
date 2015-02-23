class BooksController < ApplicationController
 include BooksHelper
 load_and_authorize_resource

  def index
    if (params[:search])
      @books = Book.all.where("title LIKE ? OR author LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @books = Book.all.order(:title)
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    if (params[:course_id] != nil)
      @book.courses << Course.find(params[:course_id])
    end 
  end

  def create
    @book = Book.new(book_params)
    set_book(@book)
    if @book.save
      redirect_to @book, notice: "Textbook Successfully Added"
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      set_book(@book)
      if @book.update(book_params)
        redirect_to @book, notice: 'Textbook Successfully Updated'
      else
        render 'edit'
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy unless @book.nil?
    redirect_to books_path, alert: 'Textbook Deleted'
  end

  private

  def book_params
    params[:book].permit(:title, :author, :isbn, :course_ids=>[])
  end
end
