class Reason < ApplicationRecord
belongs_to :product, optional: true
belongs_to :seller, optional: true
after_update :after_confirmation_for_answer

private
  def after_confirmation_for_answer
    Welcome2Mailer.send_greeting_to_seller_for_answer_notification(self).deliver_now
  end

end
