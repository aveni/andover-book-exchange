module ListingsHelper
	def show_type(listing)
		case listing.exchange_type
		when "0"
			content_tag(:div, "Buy", class: "label label-success label-as-badge")
		when "1"
			content_tag(:div, "Auction", class: "label label-warning label-as-badge")
		when "2"
			content_tag(:div, "Borrow", class: "label label-info label-as-badge")
		end
	end

	def show_quality(listing)
		QUALITY.key(listing.quality)
	end	

end
