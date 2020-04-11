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

class ConfirmationEmail < ApplicationRecord
  validates :recipient, format: { with: URI::MailTo::EMAIL_REGEXP,
                                  message: "is not a properly formatted email"}
  validates :content, presence: true
  validates :subject, presence: true
end
