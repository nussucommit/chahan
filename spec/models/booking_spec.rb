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

RSpec.describe Booking, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:items) }
  it { should validate_numericality_of(:quantity).is_greater_than 0 }
end