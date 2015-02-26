class Mailrobot < ApplicationMailer
	default from: "pabookexchange@gmail.com"
	default reply_to: "brigdenr@gmail.com"


# def notify_listing(user, listing)
		# @listing = listing
		# @user = user
		# if Rails.env.development?
		# 	recipient = "brigdenr@gmail.com"
		# else
		# 	recipient = @user.email
		# end
		# mail(to:recipient, subject:"Listing for #{@listing.book.title} has been created")


	# end

	def notify_buyer(buyer, seller, listing)
		@buyer = buyer
		@seller = seller
		@listing = listing
		mail(to:@buyer.email, subject:"Congrats! You purchased #{@listing.book.title} from #{@seller.name}")
	end

	def notify_seller(buyer, seller, listing)
		@buyer = buyer
		@seller = seller
		@listing = listing
		mail(to:@buyer.email, subject:"Congrats! You purchased #{@listing.book.title} from #{@seller.name}")
	end



end
