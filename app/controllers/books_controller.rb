class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
        redirect_to books_path, notice: "textbook successfully added"
      else
        render 'new'
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to @book, notice: 'textbook successfully added'
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
    params[:book].permit(:title, :isbn, :course_id)
  end
end
