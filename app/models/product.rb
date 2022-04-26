class Product < ApplicationRecord
 has_many :line_items, dependent: :destroy
 has_many :wish_items, dependent: :destroy
 
 belongs_to :seller, optional: true

 has_many :reasons
 
 after_update :after_confirmation_of_product

 mount_uploader :avatar, AvatarUploader


private
  def after_confirmation_of_product
  WelcomeproductMailer.send_greeting_to_seller_for_approved_notification(self).deliver_now
  end
end

