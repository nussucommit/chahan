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

RSpec.describe Booking, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:items) }
  it { should validate_presence_of(:status) }
  it { should validate_numericality_of(:quantity).is_greater_than 0 }
end
