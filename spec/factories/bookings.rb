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

