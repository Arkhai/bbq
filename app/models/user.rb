class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :vkontakte]
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  class << self
    def find_from_oauth(access_token)
      find_create_user(access_token)
    end

    private

    def find_create_user(access_token)
      email = access_token.info.email
      return if email.blank?

      user = where(email: email).first
      return user if user.present?

      provider = access_token.provider
      uid = access_token.uid

      user = find_or_initialize_by(provider: provider, url: uid)
      user.email = email
      user.password = Devise.friendly_token[0, 20]

      user.name =
        case provider
        when 'facebook' then access_token.info.name
        when 'vkontakte' then access_token.info.first_name
        end

      user.remote_avatar_url =
        case provider
        when 'facebook' then access_token.info.image
        when 'vkontakte' then access_token.extra.raw_info.photo_400_orig
        end

      user.save
      user
    end
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
                .update_all(user_id: self.id)
  end
end
