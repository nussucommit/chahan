# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  category   :integer
#  email      :string
#  items      :string
#  name       :string
#  purpose    :text
#  quantity   :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :booking do
    name { "Test" }
    items { "Item" }
    email { "test@example.com" }
    category { "electronics" }
    quantity { 1 }
    purpose { "Purpose" }
    status { "pending" }
  end
end

