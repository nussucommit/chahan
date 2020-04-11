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

require 'rails_helper'

RSpec.describe EmailTemplate, type: :model do
  it { should validate_presence_of :content }
  it { should validate_presence_of :name }
end
