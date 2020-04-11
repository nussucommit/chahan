FactoryBot.define do
  factory :confirmation_email do
    recipient { "MyString" }
    subject { "MyString" }
    content { "MyText" }
  end
end
