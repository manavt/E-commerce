class SendEmailsMailer < ApplicationMailer

  def welcome(user)
    @user = user
   attachments[@user.image.photo_file_name] = File.read(@user.image.photo.path) if @user.image.present?
    mail(
    to: user.email,
    subject: "Welcome to Ashok Estore:)"
    )
  end
end
