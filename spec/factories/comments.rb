FactoryBot.define do
  factory :comment do
    text {Faker::Lorem.sentence}
    association :user #associationによるuserと紐付け
    association :tweet #associationによるtweetと紐付け
  end
end
