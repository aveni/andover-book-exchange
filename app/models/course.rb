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
	has_many :books, dependent: :destroy

	validates :name, presence:true, uniqueness:true
	validates :teacher, presence:true
	validates :subject, presence:true
end
