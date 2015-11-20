class Mailrobot < ApplicationMailer
	add_template_helper(ApplicationHelper)
	default from: "pabookexchange@gmail.com"
	default reply_to: "pabookexchange@gmail.com"


	def admin_report(report)
		@user = report.user
		@report = report
		mail(to: "pabookexchange@gmail.com", subject: "Report for Andover Book Exchange")
	end

	def notify_buyer(buyer, listing)
		@buyer = buyer
		@listing = listing
		@seller = listing.user
		
		mail(to:@buyer.email, subject:"Congrats! You purchased #{@listing.book.title} from #{@seller.first + " " + @seller.last}")
	end

	def notify_seller(buyer, listing)
		@buyer = buyer
		@listing = listing
		@seller = listing.user
		
		mail(to:@seller.email, subject:"Congrats! You sold #{@listing.book.title} to #{@buyer.first + " " + @buyer.last}")
	end


	# for library pickups

	def notify_delivery_seller(exchange)
		@exchange = exchange
		mail(to:@exchange.listing.user.email, subject:"Delivery to OWHL Confirmation")
	end

	def notify_delivery_buyer(exchange)
		@exchange = exchange
		mail(to:@exchange.user.email, subject:"#{@exchange.listing.book.title} is ready for pickup from the OWHL!")
	end

	def notify_pickup_seller(exchange)
		@exchange = exchange
		mail(to:@exchange.listing.user.email, subject:"Pickup from OWHL Confirmation")
	end

	def notify_pickup_buyer(exchange)
		@exchange = exchange
		mail(to:@exchange.user.email, subject:"Pickup from OWHL Confirmation")
	end

	def notify_late_pickup_library(exchange)
		@exchange = exchange
		mail(to:"owhlibrary@andover.edu", subject:"Late Pickup Notification [#{@exchange.user.full_name}]")
	end

	def notify_late_pickup_buyer(exchange)
		@exchange = exchange
		mail(to:@exchange.user.email, subject:"Late Pickup Notification [owhlibrary@andover.edu]")
	end




end
