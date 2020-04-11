# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  category   :string
#  email      :string
#  items      :string
#  name       :string
#  purpose    :text
#  quantity   :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
