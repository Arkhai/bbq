# Подписка на событие и удаление подписки
class SubscriptionsController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_subscription, only: %i[destroy]

  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @new_subscription.save
      SendNotificationsJob.perform_later(@new_subscription)
      # Если сохранилась, редиректим на страницу самого события
      redirect_to @event, notice: t('controllers.subscriptions.created')
    else
      # если ошибки — рендерим шаблон события
      render 'events/show', alert: t('controllers.subscriptions.error')
    end
  end

  def destroy
    message = { notice: t('controllers.subscriptions.destroyed') }
    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = { alert: t('controllers.subscriptions.error') }
    end

    redirect_to @event, message
  end

  private

  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def subscription_params
    # .fetch разрешает в params отсутствие ключа :subscription
    params.fetch(:subscription, {}).permit(:user_email, :user_name)
  end
end
