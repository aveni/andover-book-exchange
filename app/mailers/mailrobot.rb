class Mailrobot < ApplicationMailer
	default from: "pabookexchange@gmail.com"
	default reply_to: "brigdenr@gmail.com"

	def notify_listing(user, listing)
		@listing = listing
		@user = user
		if Rails.env.development?
			recipient = "brigdenr@gmail.com"
		else
			recipient = @user.email
		mail(to:recipient, subject:"Listing for #{@listing.book.title} has been created")
		end
	end
end
