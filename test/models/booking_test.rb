# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  category   :integer
#  items      :string
#  quantity   :integer
#  purpose    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
