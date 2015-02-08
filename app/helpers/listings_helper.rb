module ListingsHelper
	def show_type(listing)
		case listing.exchange_type
		when "Buy"
			content_tag(:div, "Buy", class: "label label-success label-as-badge")
		when "Auction"
			content_tag(:div, "Auction", class: "label label-warning label-as-badge")
		when "Borrow"
			content_tag(:div, "Borrow", class: "label label-info label-as-badge")
		end
	end

	def show_price(listing)
		if (listing.min_price == nil)
			"Free"
		else
			"$#{listing.min_price.round}"
		end
	end

	def show_quality(listing)
		QUALITY.key(listing.quality)
	end	

end
