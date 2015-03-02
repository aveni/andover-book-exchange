module CoursesHelper
	def show_subject(course, color)
		if color
			content_tag(:span, course.subject, class:'label label-default')
		else
			content_tag(:span, course.subject, class:'label label-default')
		end
	end
end
