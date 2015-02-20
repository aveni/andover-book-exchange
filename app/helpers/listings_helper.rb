module ListingsHelper
	def show_type(listing)
		case listing.listing_type
		when "Buy"
			content_tag(:div, "Buy", class: "label label-success label-as-badge")
		when "Auction"
			content_tag(:div, "Auction", class: "label label-warning label-as-badge")
		when "Borrow"
			content_tag(:div, "Borrow", class: "label label-info label-as-badge")
		end
	end

	def show_status(listing)
		if listing.status
			content_tag(:div, "Open", class: "label label-success label-as-badge")
		else
			content_tag(:div, "Closed", class: "label label-danger label-as-badge")
		end
	end

	def show_seller(listing)
		user = User.find(listing.user_id)
		"#{user.first} #{user.last}"
	end

	def show_quality(listing)
		QUALITIES.key(listing.quality)
	end	

end
