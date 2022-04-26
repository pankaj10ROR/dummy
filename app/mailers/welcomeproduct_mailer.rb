class WelcomeproductMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcomeproduct_mailer.send_greeting_to_seller_for_approved_notification.subject
  #
  def send_greeting_to_seller_for_approved_notification(seller)
     @seller = seller
    mail to: @seller.seller_email, subject: "product approved"
  end
end
