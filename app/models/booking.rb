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

class Booking < ApplicationRecord
  # category mapping
  CATEGORIES = %i[electronics].freeze
  enum category: CATEGORIES

  validates :name, presence: true
  validates :email, presence: true
  validates :category, presence: true
  validates :items, presence: true
  validates :quantity, numericality:{greater_than: 0}
end
