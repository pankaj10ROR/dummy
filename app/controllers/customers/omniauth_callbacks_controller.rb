# frozen_string_literal: true

class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
   def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/customer.rb)
    @customer = Customer.from_omniauth(request.env["omniauth.auth"])
    if @customer.persisted?
      sign_in_and_redirect @customer, event: :authentication #this will throw if @customer is not activated
      set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
    else
      session["devise.google_oauth2_data"] = request.env["omniauth.auth"]
      redirect_to new_customer_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end