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



end
