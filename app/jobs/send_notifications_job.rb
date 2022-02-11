class SendNotificationsJob < ApplicationJob
  queue_as :default

  def perform(model, modeltype)
    event = model.event
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [model.user&.email]
    all_emails.each { |mail| EventMailer.comment(model, mail).deliver_later } if modeltype == 'comment'
    all_emails.each { |mail| EventMailer.photo(model, mail).deliver_later } if modeltype == 'photo'
  end
end
