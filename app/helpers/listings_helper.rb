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

	def show_price(listing, precision)
		if (listing.min_price == 0)
			"Free"
		else
			number_to_currency(listing.min_price, precision: precision)
		end
	end

	def show_quality(listing)
		QUALITIES.key(listing.quality)
	end	

end
