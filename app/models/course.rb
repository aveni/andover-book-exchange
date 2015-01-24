# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  teacher    :string
#  subject_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Course < ActiveRecord::Base
	has_many :books, dependent: :destroy
end
