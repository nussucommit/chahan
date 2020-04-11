# == Schema Information
#
# Table name: confirmation_emails
#
#  id         :bigint           not null, primary key
#  content    :text
#  recipient  :string
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :confirmation_email do
    recipient { "MyString" }
    subject { "MyString" }
    content { "MyText" }
  end
end
