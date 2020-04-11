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

class Booking < ApplicationRecord
  # category mapping
  # CATEGORIES = %i[electronics].freeze
  # enum category: CATEGORIES

  STATUSES = %i[pending approved rejected].freeze
  enum status: STATUSES

  validates :name, presence: true
  validates :email, presence: true
  validates :category, presence: true
  validates :items, presence: true
  validates :status, presence: true
  validates :quantity, numericality:{greater_than: 0}
end
