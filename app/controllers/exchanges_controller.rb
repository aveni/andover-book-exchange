class ExchangesController < ApplicationController
	load_and_authorize_resource
	include ApplicationHelper

	def index
		@exchanges = Exchange.all.reverse
	end

	def library_inventory
		@exchanges = []
		Exchange.all.each do |exchange|
			if exchange.library_exchange
				@exchanges.push(exchange)
			end
		end
	end

	# def deliver
	# 	@exchange = Exchange.find(params[:id])
 #    		@exchange.delivered = true
 #    		if @exchange.save
 #    			# mailer stuff will go here
 #    			redirect_to library_inventory_path, alert: "Book delivered to library"
 #    		else
 #    			redirect_to library_inventory_path, alert: "Error..."
 #    		end
 #    	end

    	def edit
    		@exchange = Exchange.find(params[:id])
    	end

    	def update
		@exchange = Exchange.find(params[:id])
		
		if exchange_params[:delivered] && !@exchange.delivered && !@exchange.picked_up
			if @exchange.update(exchange_params)
				Mailrobot.notify_delivery_buyer(@exchange).deliver
				Mailrobot.notify_delivery_seller(@exchange).deliver
				redirect_to library_inventory_path, notice: "Book delivered to library by seller (#{show_name(@exchange.listing.user)}). Buyer (#{show_name(@exchange.user)}) has been notified!"
			else
				render 'edit'
			end
		elsif !@exchange.picked_up && exchange_params[:picked_up] && @exchange.delivered
			if @exchange.update(exchange_params)
				Mailrobot.notify_pickup_buyer(@exchange).deliver
				Mailrobot.notify_pickup_seller(@exchange).deliver
				redirect_to library_inventory_path, notice: "Book picked up from library by buyer (#{show_name(@exchange.user)}). Both seller and buyer have been notified about payment and reporting policies!"
			else
				render 'edit'
			end
			
		else
			if @exchange.update(exchange_params)
				redirect_to library_inventory_path, notice: "You changed something there"
			else
				render 'edit', alert: "that didn't compute"
			end
		end	
	end

    	private 

    	def exchange_params
		params.require(:exchange).permit( :delivered, :picked_up, :exchange_id, :user_id, :listing_id)
	end
  
end
