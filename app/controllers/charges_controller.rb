class ChargesController < ApplicationController
 before_action :require_login

 def new
  @order = Order.find(params[:order_id])
  @charge = @order.charges.new
end

def create
  @order = Order.find(params[:order_id])
  @amount = @order.pay_methed.to_i

  Stripe.api_key = 'sk_test_51KnyZcCIOjuxPTPEiMnLg87LXbTrZXaQM9oyWwjeb8DM4soG9jEuWOeU5ggsNRPE7hqVGqEXbS6wdwhCtwDxEtuk00s6doShzu'

  a = Stripe::Token.create({
    card: {
      number: '4242424242424242',
      exp_month: 4,
      exp_year: 2023,
      cvc: '314',
    },
  })

  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: a,
    )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount*100,
    description: 'Rails Stripe customer',
    currency: 'usd'
    )
  @charge = @order.charges.new
  @charge.charge_id = charge.id
  @charge.save
  if charge.status == 'succeeded'
    @order.update(status: 'Complete')
  else
    @order.update(status: 'Incomplete')
  end

  @order.id = nil
  redirect_to orders_path, notice: "You have successfully complete the payment of #{@order.pay_methed}..."
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end



def refund
  @order = Order.find(params[:order_id])
  a = @order.charges.pluck(:charge_id)
  b = a[0]
  Stripe.api_key = 'sk_test_51KnyZcCIOjuxPTPEiMnLg87LXbTrZXaQM9oyWwjeb8DM4soG9jEuWOeU5ggsNRPE7hqVGqEXbS6wdwhCtwDxEtuk00s6doShzu'
  refund = Stripe::Refund.create({
    charge: b,
  })
  if refund.status == 'succeeded'
    @order.update(status: 'Refunded')
  else
    @order.update(status: 'Complete')
  end
  redirect_to orders_path, notice: "You have successfully Refunded the payment of #{@order.pay_methed}..."
end
private
def require_login
  unless current_customer
    redirect_to customer_session_path
  end
end
private
def charge_params
  params.require(:charge).permit(:charge_id, :cauthenticity_token, :stripeToken, :stripeTokenType, :stripeEmail)
end
end
