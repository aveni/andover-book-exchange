class Mailrobot < ApplicationMailer
	default from: "pabookexchange@gmail.com"
	default reply_to: "brigdenr@gmail.com"

	def notify_listing(user, listing)
		@listing = listing
		@user = user
		mail(to:@user.email, subject:"Listing for #{@listing.book.title} has been created")
	end

end
