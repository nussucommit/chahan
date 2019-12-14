FactoryBot.define do
  factory :user do
    email { 'test@exmaple.com' }
    password { '123456' }
    username { SecureRandom.alphanumeric(8) }
  end
end
