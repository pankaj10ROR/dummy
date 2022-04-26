# Preview all emails at http://localhost:3000/rails/mailers/welcome1_mailer
class Welcome1MailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcome1_mailer/send_greetings_to_seller__notification
  def send_greetings_to_seller__notification
    Welcome1Mailer.send_greetings_to_seller__notification
  end

end
