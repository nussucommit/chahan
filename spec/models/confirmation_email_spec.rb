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

require 'rails_helper'

RSpec.describe ConfirmationEmail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
