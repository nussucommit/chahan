# == Schema Information
#
# Table name: email_templates
#
#  id         :bigint           not null, primary key
#  content    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmailTemplate < ApplicationRecord
  validates :content, presence: true
  validates :name, presence: true
end
