# Авторизация через соцсети: фейсбук и вконтакте
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    omniauth_user('facebook')
  end

  def vkontakte
    omniauth_user('vkontakte')
  end

  def omniauth_user(provider)
    # Дёргаем метод модели, который найдёт пользователя
    @user = User.find_from_oauth(request.env['omniauth.auth'])

    # Если юзер есть, то логиним и редиректим на его страницу
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider)
      sign_in_and_redirect @user, event: :authentication
      # Если неудачно, то выдаём ошибку и редиректим на главную
    else
      flash[:error] = I18n.t(
        'devise.omniauth_callbacks.failure',
        kind: provider,
        reason: 'authentication error'
      )

      redirect_to root_path
    end
  end
end
