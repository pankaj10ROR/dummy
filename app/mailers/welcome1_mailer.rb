class Welcome1Mailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome1_mailer.send_greetings_to_seller__notification.subject
  #
  def send_greetings_to_seller__notification(seller)
   @seller = seller

    mail to: @seller.email, subject: "Welcome to E-commerce "
  end
end
