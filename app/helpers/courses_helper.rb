module CoursesHelper
	def show_subject(course, color)
		content_tag(:span, course.subject, class:'label label-default')
	end
end
