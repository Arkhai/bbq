FactoryBot.define do
  factory :user do
    # Создаём случайное имя
    name { "Жора_#{rand(999)}" }

    # Email должен быть уникален, поэтому снова используем n
    # При каждом вызове фабрики n будет увеличен,
    # поэтому у юзеров будут разные адреса: someguy_1@example.com,
    # someguy_2@example.com, someguy_3@example.com и т.д.
    sequence(:email) { |n| "someguy_#{n}@example.com" }

    # Коллбэк — после фазы :build записываем поля паролей, иначе Devise не
    # позволит создать юзера
    after(:build) { |u| u.password_confirmation = u.password = "123456"}
  end
end