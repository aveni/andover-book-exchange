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

require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
