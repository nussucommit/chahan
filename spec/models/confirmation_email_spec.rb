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
  it { should validate_presence_of :content }
  it { should validate_presence_of :subject }
  
  it { 
    should allow_values('basic@email.com', 'underscore_separated@email.com').
      for(:recipient)
  }

  it { 
    should_not allow_values('normal_website.com', 'plain text').
      for(:recipient).
      with_message('is not a properly formatted email')
  }
end
