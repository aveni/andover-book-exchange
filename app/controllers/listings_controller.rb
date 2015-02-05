class ListingsController < ApplicationController
	before_action :set_book

	#def index
	#	@book = Book.find(params[:book_id])
	#	@listings = @book.listings
	#end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@listing = Listing.new(book_id: @book.id)
	end

	def create
		@listing = Listing.new(listings_params)
		if @listing.save
			redirect_to book_listing_path(@listing.book, @listing), notice:'Listing was created successfully'
		else
			render :new
		end
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listings_params)
			redirect_to @book.listing, notice: 'Listing was successfully updated'
		else
			render 'edit'
		end
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy unless @listing.nil?
		redirect_to @book
	end

	private

	def set_book
		@book = Book.find(params[:book_id])
	end

	def listings_params
		params[:listing].permit(:description, :quality, :exchange_type, :max_price, :min_price, :book_id, :course_id)
	end


end
