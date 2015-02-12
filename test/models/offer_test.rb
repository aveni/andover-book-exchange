# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  price      :float
#  user_id    :integer
#  listing_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
