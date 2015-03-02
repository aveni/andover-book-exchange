class BooksController < ApplicationController
 include BooksHelper
  load_and_authorize_resource

  def index
    if (params[:search])
      @books = Book.all.where("title LIKE ? OR author LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order(:title)
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

  def sell
  end

   def create_sell
    isbnf = strip(params[:isbn], "-")
    book_hash = get_book(isbnf)
    unless book_hash.blank?
      matches = Book.find_by_isbn(isbnf) 
      matches = Book.find_by_title(title_upcase(book_hash.title)) if matches.blank?
      if matches.blank?
        course_select(book_hash)
      else
        redirect_to matches, notice: "Book found. Now add a listing for this book."
      end   
    else
      render 'sell', alert: "Invalid ISBN."
    end
  end

  def course_select(book_hash)
    @book = Book.new(isbn: book_hash.isbn, title: title_upcase(book_hash.title), author: strip(book_hash.authors_text, ','))
    if (params[:course_id] != nil)
      @book.courses << Course.find(params[:course_id])
    end 
    render :action => 'course_select'
  end

  def book_save
    @book = Book.new(book_params)
    if @book.save
      Report.create(book_id:@book.id, user_id: current_user.id, text:"BOOK CREATED")
      redirect_to new_book_listing_path(@book), notice: 'Book created. Now add a listing for this book.'
    else
      render 'sell', notice: "Couldn't save book."
    end
  end 

  def create
    @book = Book.new(book_params)
    set_book(@book)
    if @book.save
      redirect_to @book, notice: 'Book created.'
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
