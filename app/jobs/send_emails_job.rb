class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later

    CrudNotificationMailer.create_notification(user).deliver

  end
end
