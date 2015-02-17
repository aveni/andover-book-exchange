module ApplicationHelper


	def truncate(text, options = {}, &block)
	   	if text
	  	length  = options.fetch(:length, 20)

	   	content = text.truncate(length, options)
	   	content = options[:escape] == false ? content.html_safe : ERB::Util.html_escape(content)
	    	content << capture(&block) if block_given? && text.length > length
	   	content
	  	end
	end

	def show_price(price, precision)
		if (price == 0)
			"Free"
		else
			number_to_currency(price, precision: precision)
		end
	end
end
