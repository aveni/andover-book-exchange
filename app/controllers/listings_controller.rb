class ListingsController < ApplicationController
	before_action :set_book
	before_filter :verify_ed, :only=>[:edit, :update, :destroy]

	#def index
	#	@book = Book.find(params[:book_id])
	#	@listings = @book.listings
	#end

	def buy
		@listing = Listing.find(params[:listing_id])
		if @listing.status && @listing.user_id != current_user.id
			@exchange = Exchange.new(listing_id: @listing.id, user_id: current_user.id)
			if @exchange.save	
				Mailrobot.notify_buyer(@exchange.user, @exchange.listing).deliver
	      Mailrobot.notify_seller(@exchange.user, @exchange.listing).deliver
				redirect_to @exchange.user, notice: "Sucessfully bought #{@listing.book.title}! An email will be sent to both you and the seller shortly."
	      @listing.status = false
				@listing.save
			else
				redirect_to books_path, alert: "Error. Could not purchase book."
			end
    else
    	redirect_to books_path, alert: "Cannot purchase book."
    end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@listing = Listing.new(book_id: @book.id, listing_type: "Buy", status: true, user_id: current_user.id)
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.save
			redirect_to book_listing_path(@listing.book, @listing), notice:'Listing was created successfully'
		else
			render 'new'
		end
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to book_listing_path(@listing.book, @listing), notice: 'Listing was successfully updated'
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

	def verify_ed
		@listing = Listing.find(params[:id])
		redirect_to books_path unless @listing.status && (@listing.user_id == current_user.id || (can? :modify, Listing))
	end

	def listing_params
		params.require(:listing).permit( :description, :quality, :listing_type, :status, :min_price,  :course_id,  :user_id, :book_id)
	end


end
