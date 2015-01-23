# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  type       :string
#  price      :integer
#  user_id    :integer
#  listing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Offer < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
end
