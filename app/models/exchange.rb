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
end
