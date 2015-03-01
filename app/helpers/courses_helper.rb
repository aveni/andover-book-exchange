module CoursesHelper
	def show_subject(course)
		content_tag(:div, course.subject, class:'label label-info')
	end
end
