class CrudNotificationMailer < ApplicationMailer

  def create_notification(object)
     @object=object
    #  @object_count=object.class.count

    # mail to: "#{@object.name}@example.com", subject:  "a new object is created"
    attachments['download.png'] = File.read('app/assets/images/download.png')

     mail to: "likharavanika128@gmail.com",
         subject: "a new student",
        #  cc: Student.all.pluck(:email) ,
          #bcc: "vaparadkar@bestpeers.in",
         from: "support@example.com"

  #   mail(
  #   to: email_address_with_name("#{@object.name}@example.com", @object.name),
  #   subject: 'Welcome to My Awesome Site'
  # )
  # raman <raman@example.com>( is format me aayga aage name hokr)
  end

  def update_notification

  end

  def delete_notification

  end
end
