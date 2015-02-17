module OffersHelper

	def show_buyer(offer)
		buyer = User.find(offer.user_id)
		return "#{buyer.first} #{buyer.last}"
	end
end
