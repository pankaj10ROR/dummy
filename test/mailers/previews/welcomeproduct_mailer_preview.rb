# Preview all emails at http://localhost:3000/rails/mailers/welcomeproduct_mailer
class WelcomeproductMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/welcomeproduct_mailer/send_greeting_to_seller_for_approved_notification
  def send_greeting_to_seller_for_approved_notification
    WelcomeproductMailer.send_greeting_to_seller_for_approved_notification
  end

end
