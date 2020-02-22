# == Schema Information
#
# Table name: email_templates
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :email_template do
    content { "MyText" }
  end
end
