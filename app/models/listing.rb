# == Schema Information
#
# Table name: listings
#
#  id           :integer          not null, primary key
#  description  :text
#  quality      :string
#  listing_type :string
#  min_price    :float
#  status       :boolean
#  book_id      :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Listing < ActiveRecord::Base
	belongs_to :user
	belongs_to :book
	has_many :offers, dependent: :destroy
	has_one :exchange, dependent: :destroy
	
	validates :quality, presence: true, inclusion: {in: QUALITIES.collect {|k,v| v}}
	validates :listing_type, presence: true, inclusion: {in: TYPES}
	validates :min_price, presence: true, :numericality => {:greater_than_or_equal_to => 0}
	#validate :check_listing

	def check_listing
		if (exchange_type.present? && exchange_type!="Borrow" && !min_price.present?)
			errors.add(:min_price, "need Min Price")
		end
		if (exchange_type.present? && exchange_type=="Auction" && !max_price.present?)
			errors.add(:max_price, "need Max Price")
		end

		if (min_price.present? && min_price<0)
			errors.add(:min_price, "Must be non-negative")
		end

		if (max_price.present? && max_price<0)
			errors.add(:max_price, "Must be non-negative")
		end
	end
end

