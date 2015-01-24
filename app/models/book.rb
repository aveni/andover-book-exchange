# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  author     :string
#  isbn       :integer
#  course_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
	has_many :listings, dependent: :destroy
	belongs_to :course
end
