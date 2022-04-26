class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable, :trackable, :timeoutable,
  :lockable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :carts
  has_many :wishlists
  has_many :orders
  
 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0, 20]
      customer.name = auth.info.name   # assuming the customer model has a name
      # customer.image = auth.info.image # assuming the customer model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # customer.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |customer|
      if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
        customer.email = data["email"] if customer.email.blank?
      end
    end
  end
private
def after_confirmation
  WelcomeMailer.send_greetings_notification(self).deliver_now
end
end
