# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string
#  author     :string
#  isbn       :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ActiveRecord::Base
	
	has_many :listings, dependent: :destroy
	has_many :reports, dependent: :destroy

	validates :isbn, presence: true, uniqueness: true
	validate :is_valid_isbn

	def is_valid_isbn
		if !title.present?
			 errors.add(:isbn, "Invalid ISBN.")
		end
	end
end
