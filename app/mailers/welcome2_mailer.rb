class Welcome2Mailer < ApplicationMailer
	def send_greeting_to_seller_for_answer_notification(seller)
     @seller = seller
    mail to: @seller.seller_email, subject: "Answer"
  end
end
