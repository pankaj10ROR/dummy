class AddChargeToCharge < ActiveRecord::Migration[7.0]
  def change
    add_column :charges, :charge_id, :string
    # add_column :charges, :cauthenticity_token, :string
    # add_column :charges, :stripeToken, :string
    # add_column :charges, :stripeTokenType, :string
    # add_column :charges, :stripeEmail, :string
  end
end
