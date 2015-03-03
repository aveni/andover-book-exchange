# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  author     :string
#  isbn       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
	
	has_many :listings, dependent: :destroy
	has_and_belongs_to_many :courses
	has_many :reports

	
	validates :isbn, presence: true, uniqueness:true
	validate :is_valid_isbn

	def is_valid_isbn
		if (isbn.present? && !ISBNdb::Query.find_book_by_isbn(isbn).first)
			errors.add(:isbn, "invalid ISBN")
		end
	end
end
