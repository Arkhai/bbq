FactoryBot.define do
  # Название фабрики (event)
  factory :event do
    sequence(:title) { |n| "Party #{n}?" }
    sequence(:description) { |n| "Description for Party #{n}"}
    address { "Kremlin" }
    datetime { "2022-01-04 13:19:00.000000000 +0000" }

    association :user
  end
end