# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  teacher    :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ActiveRecord::Base
	has_and_belongs_to_many :books
	after_destroy :cleanup

	validates :name, presence:true
	validates :teacher, presence:true, inclusion: {in: TEACHERS}
	validates :subject, presence:true, inclusion: {in: SUBJECTS.collect {|k,v| v}}


private
	def cleanup
		Book.all.each do|b|
			if b.courses.include?(self)
				b.courses.delete(self)
			end
		end
	end

	def self.search(query)
    	# where(:title, query) -> This would return an exact match of the query
    		where("name like ?", "%#{search}%") 
 	end



end
