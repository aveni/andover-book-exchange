# == Schema Information
#
# Table name: exchanges
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  listing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exchange < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing

	validates :user_id, presence: true
	validates :listing_id, presence: true
	validate :valid_buy

	def valid_buy
		!(:user_id == :listing_id)
	end
end
