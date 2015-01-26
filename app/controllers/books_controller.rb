class BooksController < ApplicationController
 include BooksHelper

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    if (params[:isbn])
      @book_hash = ISBNdb::Query.find_book_by_isbn(params[:title])
    elsif (params[:title])
      @book_hash = ISBNdb::Query.find_book_by_title(params[:title])
    else
      
    end
  end

  def create
    @book = Book.new(book_params)
    book_hash = get_book(@book.isbn)
    unless book_hash.nil? or book_hash.blank?
      @book.title = book_hash.title
      @book.author = book_hash.authors_text
      if @book.save
        redirect_to @book, notice: "Textbook Successfully Added"
      else
        render 'new'
      end
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
