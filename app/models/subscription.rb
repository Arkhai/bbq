class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  # Проверки user_name и user_email выполняются только для анонимных пользователей
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  # Для конкретного event_id один юзер может подписаться только один раз (если юзер задан)
  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }

  # Или один email может использоваться только один раз (если анонимная подписка)
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  validates :user_email, exclusion: { in: User.pluck(:email),
                                      message: I18n.t('activerecord.subscriptions.emailexist') }, unless: -> { user.present? }

  validate :event_owner, if: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def event_owner
    errors.add(:user_id, I18n.t('activerecord.subscriptions.eventowner')) if event.user == user
  end
end
