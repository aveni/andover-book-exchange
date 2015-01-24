# == Schema Information
#
# Table name: listings
#
#  id          :integer          not null, primary key
#  description :text
#  quality     :string
#  type        :string
#  max_price   :float
#  min_price   :float
#  book_id     :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Listing < ActiveRecord::Base
	belongs_to :user
	belongs_to :book
	has_many :offers
end
