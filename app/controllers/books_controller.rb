class BooksController < ApplicationController
 include BooksHelper

  def index
    @books = Book.all
    if (params[:search])
      @books = Book.all.where("title LIKE ?", "%#{params[:search]}%")
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @book.course_id = params[:course_id]
    @book.isbn = params[:isbn]
  end

  def create
    @book = Book.new(book_params)
    set_book(@book, @book.isbn)
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
      if @book.update(book_params)
        redirect_to @book, notice: 'Textbook Successfully Updated'
      else
        render 'edit'
      end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy unless @book.nil?
    redirect_to books_path
  end

  private

  def book_params
    params[:book].permit( :title, :author, :isbn, :course_id)
  end
end
