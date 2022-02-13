class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(model)
    event = model.event
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq # - [model.user&.email]

    case model
    when Comment
      all_emails.each { |mail| EventMailer.comment(model, mail).deliver_later } if model == Comment
    when Photo
      all_emails.each { |mail| EventMailer.photo(model, mail).deliver_later } if model == Photo
    when Subscription
      EventMailer.subscription(model).deliver_later if model == Subscription
    end
  end
end
