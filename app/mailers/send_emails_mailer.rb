class SendEmailsMailer < ApplicationMailer

  def welcome(user)
    @user = user
   attachments['image1.jpg'] = File.read("/Users/manvendratripathi/Desktop/image1.jpg")
    mail(
    to: user.email,
    subject: "Welcome to Ashok Estore:)"
    )
  end
end
