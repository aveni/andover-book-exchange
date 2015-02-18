class OffersController < ApplicationController
	before_action :set_book_listing

	def new
		@offer = Offer.new(listing_id: @listing.id, user_id: current_user.id)
		if @listing.listing_type = "Buy"
			@offer.price = @listing.min_price
		end 
	end

	def create
		@offer = Offer.new(offer_params)
		if @offer.save
		  redirect_to book_listing_path(@book, @listing), notice: "Offer Successfully Added"
		else
		  render 'new'
		end
	end

	def edit
		@offer = Offer.find(params[:id])
	end

	def update
		@offer = offer.find(params[:id])
		if @offer.update(offer_params)
			redirect_to book_listing_path(@book, @listing), notice: 'Offer Successfully Updated'
		else
			render 'edit'
		end
	end

	def destroy
		@offer = Offer.find(params[:id])
		@offer.destroy unless @offer.nil?
		redirect_to book_listing_path(@book, @listing), alert: 'Offer Deleted'
	end

	private

	def offer_params
		params[:offer].permit(:listing_id, :user_id, :price)
	end

	def set_book_listing
		@book = Book.find(params[:book_id])
		@listing = Listing.find(params[:listing_id])
	end
end
