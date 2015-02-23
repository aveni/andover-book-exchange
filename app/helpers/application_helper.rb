module ApplicationHelper

	def show_role(user)
		if user
		    if user.is?(:superuser)
		      content_tag(:span, 'Super User', class:'label label-danger')
		    elsif user.is?(:admin)
		      content_tag(:span, 'Admin', class:'label label-success')
		    else
		      content_tag(:span, 'Member', class:'label label-info')
		    end
		end
	end

	def truncate(text, options = {}, &block)
	   	if text
	  	length  = options.fetch(:length, 20)

	   	content = text.truncate(length, options)
	   	content = options[:escape] == false ? content.html_safe : ERB::Util.html_escape(content)
	    	content << capture(&block) if block_given? && text.length > length
	   	content
	  	end
	end

	def show_name(user)
		"#{user.first} #{user.last}"
	end
	
	def show_price(price, precision)
		if (price == 0)
			"Free"
		else
			number_to_currency(price, precision: precision)
		end
	end
end
