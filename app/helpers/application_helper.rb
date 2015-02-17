module ApplicationHelper

	def show_role(user)
	    if user.is?(:superuser)
	      content_tag(:span, 'Super User', class:'label label-danger')
	    elsif user.is?(:admin)
	      content_tag(:span, 'Admin', class:'label label-warning')
	    elsif user.is?(:member)
	      content_tag(:span, 'Exchange Member', class:'label label-info')
	    end
	end
end
