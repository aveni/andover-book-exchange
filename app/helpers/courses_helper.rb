module CoursesHelper
	def show_subject(course)
		content_tag(:span, course.subject, class:'label label-info')
	end
end
