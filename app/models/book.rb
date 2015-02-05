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

	validates :isbn, presence: true, uniqueness:true
	validate :is_valid_isbn
	validates :course_id, presence:true

	def is_valid_isbn
		if (isbn.present? && !ISBNdb::Query.find_book_by_isbn(isbn).first)
			errors.add(:isbn, "invalid ISBN")
		end
	end
end
