# Preview all emails at http://localhost:3000/rails/mailers/send_emails_mailer
class SendEmailsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_emails_mailer/welcome
  def welcome
    SendEmailsMailer.welcome
  end

end
