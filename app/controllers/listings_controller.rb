class ListingsController < ApplicationController


	#def index
	#	@book = Book.find(params[:book_id])
	#	@listings = @book.listings
	#end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@book = Book.find(params[:book_id])
		@listing = @book.listings.new
	end

	def create
		@listing = Listing.new(listings_params)
		if @listing.save
			redirect_to @listing.book, notice:'Listing was created successfully'
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
			redirect_to @listing, notice: 'Listing was successfully updated'
		else
			render 'edit'
		end
	end


	private

	def listings_params
		params[:listing].permit(:description, :quality, :exchange_type, :max_price, :min_price, :book_id, :course_id)
	end


end
